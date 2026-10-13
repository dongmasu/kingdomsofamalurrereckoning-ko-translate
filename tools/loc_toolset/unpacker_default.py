import struct
import csv
import os
import sys

def ler_string(buffer, offset):
    end = buffer.find(b'\x00', offset)
    if end == -1:
        end = len(buffer)
    return buffer[offset:end].decode('utf-8')

def desmontar_flat(arquivo_bin):
    print(f"[-] Abrindo {arquivo_bin}...")
    
    with open(arquivo_bin, 'rb') as f:
        data = f.read()
    
    tamanho_arquivo = len(data)

    # 1. Verificar Magic Number (6F FE 00 00)
    magic = data[0:4]
    if magic != b'\x6F\xFE\x00\x00':
        print(f"[!] Aviso: Magic Number {magic.hex()} diferente de 6FFE0000.")
    
    # 2. Ler Ponteiros
    primeiro_ponteiro = struct.unpack('<I', data[4:8])[0]
    print(f"[-] Inicio do texto detectado em: {primeiro_ponteiro}")
    
    ponteiros = []
    offset_leitura = 4
    ultimo_valor = 0
    
    while offset_leitura < primeiro_ponteiro:
        val = struct.unpack('<I', data[offset_leitura:offset_leitura+4])[0]
        
        # Travas de segurança padrão
        if val >= tamanho_arquivo: break
        if val < ultimo_valor: break 
        
        ponteiros.append(val)
        ultimo_valor = val
        offset_leitura += 4

    fim_tabela_ponteiros = offset_leitura
    print(f"[-] Tabela: {len(ponteiros)} linhas.")
    
    # 3. Salvar Hash/Gap
    hash_blob = data[fim_tabela_ponteiros:primeiro_ponteiro]
    with open('estrutura_hashes_flat.bin', 'wb') as f:
        f.write(hash_blob)
    
    # 4. Extrair Texto
    csv_filename = arquivo_bin + ".csv"
    
    with open(csv_filename, 'w', newline='', encoding='utf-8-sig') as f:
        writer = csv.writer(f, delimiter=';')
        writer.writerow(['ID_Linha', 'Texto']) # Sem coluna de 'Tipo'
        
        for i, p_start in enumerate(ponteiros):
            cursor = p_start
            
            # Checagem de Padding: Se o byte no ponteiro for FF, pula 1.
            # Às vezes o ponteiro aponta pro FF, às vezes pro texto direto.
            if cursor < tamanho_arquivo and data[cursor] == 0xFF:
                cursor += 1
            
            texto = ler_string(data, cursor)
            writer.writerow([i, texto])

    print(f"[-] CSV Gerado: {csv_filename}")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        desmontar_flat(sys.argv[1])
    else:
        print("Arraste o arquivo .bin (6F FE...) para cá.")
        input()
