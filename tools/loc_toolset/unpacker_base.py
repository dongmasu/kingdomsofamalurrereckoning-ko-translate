import struct
import csv
import os
import sys

def ler_string(buffer, offset):
    """Read one UTF-8 string terminated by a null byte."""
    end = buffer.find(b'\x00', offset)
    if end == -1:
        return buffer[offset:].decode('utf-8'), len(buffer)
    return buffer[offset:end].decode('utf-8'), end + 1

def desmontar_stream(arquivo_bin):
    print(f"[-] Abrindo {arquivo_bin}...")
    
    with open(arquivo_bin, 'rb') as f:
        data = f.read()
    
    tamanho_arquivo = len(data)

    # 1. Verificar Magic Number (EC 12 00 00)
    magic = data[0:4]
    if magic != b'\xEC\x12\x00\x00':
        print(f"[!] Atenção: Magic Number {magic.hex()} diferente de EC120000.")
        print("    O script tentará continuar mesmo assim.")
    
    # 2. Ler Ponteiros
    primeiro_ponteiro_texto = struct.unpack('<I', data[4:8])[0]
    print(f"[-] Inicio do texto detectado em: {primeiro_ponteiro_texto}")
    
    ponteiros = []
    offset_leitura = 4
    ultimo_valor = 0
    
    while offset_leitura < primeiro_ponteiro_texto:
        val = struct.unpack('<I', data[offset_leitura:offset_leitura+4])[0]
        
        # Travas de segurança iguais ao script anterior
        if val >= tamanho_arquivo: break
        if val < ultimo_valor: break # Sequência quebrou = começou o Hash
        
        ponteiros.append(val)
        ultimo_valor = val
        offset_leitura += 4

    fim_tabela_ponteiros = offset_leitura
    print(f"[-] Tabela: {len(ponteiros)} linhas encontradas.")
    
    # 3. Salvar Hash/Gap
    hash_blob = data[fim_tabela_ponteiros:primeiro_ponteiro_texto]
    with open('estrutura_hashes_stream.bin', 'wb') as f:
        f.write(hash_blob)
    print(f"[-] Hash salvo ({len(hash_blob)} bytes).")

    # 4. Extrair Texto (Lógica de Blocos)
    csv_filename = arquivo_bin + ".csv"
    
    with open(csv_filename, 'w', newline='', encoding='utf-8-sig') as f:
        writer = csv.writer(f, delimiter=';')
        writer.writerow(['ID_Linha', 'Tipo_Variante', 'Texto'])
        
        total_ponteiros = len(ponteiros)
        
        for i in range(total_ponteiros):
            inicio_bloco = ponteiros[i]
            
            # O fim deste bloco é o inicio do próximo ponteiro
            # Se for o último ponteiro, o fim é o final do arquivo
            if i < total_ponteiros - 1:
                fim_bloco = ponteiros[i+1]
            else:
                fim_bloco = tamanho_arquivo

            # Validar tamanho
            if fim_bloco > tamanho_arquivo: fim_bloco = tamanho_arquivo
            
            # --- Parsing do Bloco ---
            cursor = inicio_bloco
            
            while cursor < fim_bloco:
                # Se sobrar apenas bytes FF ou 00 no final do bloco, ignoramos (padding)
                # Mas precisamos ter certeza que não é uma variante válida.
                # Geralmente variante precisa ter pelo menos 1 byte de tipo + 1 byte 00.
                if cursor + 1 >= fim_bloco:
                    break

                byte_tipo = data[cursor]
                
                # Checagem de Padding Comum (FF ou 00 repetido no final)
                if byte_tipo == 0xFF:
                    # O FF que você viu provavelmente é lixo entre blocos.
                    # Vamos pular 1 byte e tentar de novo, ou parar se estivermos no fim.
                    cursor += 1
                    continue
                
                # Ler texto
                texto, novo_cursor = ler_string(data, cursor + 1)
                
                # Salvar no CSV
                writer.writerow([i, f"{byte_tipo:02X}", texto])
                
                cursor = novo_cursor

    print(f"[-] CSV Gerado: {csv_filename}")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        desmontar_stream(sys.argv[1])
    else:
        print("Arraste o arquivo .bin (EC 12...) para cá.")
        input()
