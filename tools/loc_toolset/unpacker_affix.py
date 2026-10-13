import struct
import csv
import os
import sys

def ler_string(buffer, offset):
    """Lê uma string terminada em null a partir do offset."""
    limit = min(offset + 5000, len(buffer))
    end = buffer.find(b'\x00', offset, limit)
    if end == -1:
        return buffer[offset:limit].decode('utf-8'), limit
    return buffer[offset:end].decode('utf-8'), end + 1

def desmontar(arquivo_bin):
    print(f"[-] Abrindo {arquivo_bin}...")
    
    with open(arquivo_bin, 'rb') as f:
        data = f.read()
    
    tamanho_arquivo = len(data)

    # 1. Ler Magic Number
    magic = data[0:4]
    if magic != b'\x4A\x02\x00\x00':
        print("[!] Aviso: Magic number diferente do esperado.")
    
    # 2. Descobrir onde começa o texto
    # O primeiro ponteiro absoluto (offset 4) diz onde começa o bloco de texto.
    primeiro_ponteiro_texto = struct.unpack('<I', data[4:8])[0]
    print(f"[-] Inicio dos dados de texto (offset): {primeiro_ponteiro_texto}")
    
    # 3. Ler Tabela de Ponteiros
    # VAMOS PARAR DE LER assim que encontrarmos algo que não pareça um ponteiro válido.
    # O Hash fica entre os ponteiros e o texto.
    
    ponteiros = []
    offset_leitura = 4
    ultimo_valor = 0
    
    while offset_leitura < primeiro_ponteiro_texto:
        # Lê 4 bytes
        val = struct.unpack('<I', data[offset_leitura:offset_leitura+4])[0]
        
        # --- REGRAS DE SEGURANÇA (A CORREÇÃO ESTÁ AQUI) ---
        
        # Regra 1: O ponteiro não pode ser maior que o tamanho do arquivo
        if val >= tamanho_arquivo:
            print(f"[-] Fim dos ponteiros detectado (Valor {val} fora do arquivo). Iniciando Hash.")
            break
            
        # Regra 2: Os ponteiros de texto são sempre crescentes.
        # Se o valor atual for MENOR que o anterior, entramos no HASH (que é aleatório).
        if val < ultimo_valor:
            print(f"[-] Fim dos ponteiros detectado (Sequência quebrada: {val} < {ultimo_valor}). Iniciando Hash.")
            break

        # Regra 3: O ponteiro deve apontar para DEPOIS ou IGUAL ao inicio do bloco de texto
        if val < primeiro_ponteiro_texto:
             # Isso tecnicamente não deveria acontecer se a tabela for ordenada, 
             # mas se acontecer, é lixo/hash.
             pass 

        ponteiros.append(val)
        ultimo_valor = val
        offset_leitura += 4

    fim_tabela_ponteiros = offset_leitura
    print(f"[-] Tabela de ponteiros identificada: {len(ponteiros)} linhas.")
    
    # 4. Salvar o bloco de HASH/GAP
    # Vai de onde paramos de ler ponteiros até o inicio do texto
    hash_blob = data[fim_tabela_ponteiros:primeiro_ponteiro_texto]
    
    with open('estrutura_hashes.bin', 'wb') as f:
        f.write(hash_blob)
    print(f"[-] Bloco de HASH salvo ({len(hash_blob)} bytes).")

    # 5. Ler os textos e gerar CSV
    csv_filename = arquivo_bin + ".csv"
    print(f"[-] Extraindo textos para {csv_filename}...")
    
    with open(csv_filename, 'w', newline='', encoding='utf-8-sig') as f:
        writer = csv.writer(f, delimiter=';')
        writer.writerow(['ID_Linha', 'Tipo_Variante', 'Texto'])
        
        for i, p_start in enumerate(ponteiros):
            cursor = p_start
            
            # Validação extra pra não crashar se o ponteiro apontar pro além
            if cursor + 3 > tamanho_arquivo:
                print(f"[!] Erro na linha {i}: Ponteiro {cursor} fora do arquivo. Pulando.")
                continue

            # Estrutura da Linha: [Count] [OffsetStart] ...
            try:
                num_variantes = data[cursor]
                offset_primeira_str = struct.unpack('<H', data[cursor+1:cursor+3])[0]
                
                # Onde começam as strings DE FATO
                strings_start_abs = cursor + offset_primeira_str
                current_str_cursor = strings_start_abs
                
                for v in range(num_variantes):
                    if current_str_cursor >= tamanho_arquivo:
                        break
                        
                    tipo_variante = data[current_str_cursor]
                    texto, novo_cursor = ler_string(data, current_str_cursor + 1)
                    
                    writer.writerow([i, f"{tipo_variante:02X}", texto])
                    current_str_cursor = novo_cursor
            except Exception as e:
                print(f"[!] Erro ao ler linha {i} no offset {cursor}: {e}")

    print("[-] Concluído.")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        desmontar(sys.argv[1])
    else:
        print("Arraste o arquivo .bin para cima deste script.")
        input("Pressione Enter para sair...")
