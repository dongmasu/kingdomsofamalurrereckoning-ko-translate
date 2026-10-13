import struct
import csv
import os
import sys

def montar_flat(arquivo_csv):
    arquivo_bin_saida = arquivo_csv.replace(".csv", "") + "_NOVO.bin"
    arquivo_hashes = "estrutura_hashes_flat.bin"
    
    if not os.path.exists(arquivo_hashes):
        print("[!] Erro: 'estrutura_hashes_flat.bin' não encontrado.")
        return

    print(f"[-] Lendo {arquivo_csv}...")
    
    # 1. Ler CSV
    linhas = {}
    with open(arquivo_csv, 'r', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f, delimiter=';')
        for row in reader:
            id_linha = int(row['ID_Linha'])
            texto = row['Texto']
            linhas[id_linha] = texto

    # 2. Carregar Hash
    with open(arquivo_hashes, 'rb') as f:
        hash_blob = f.read()
    
    # 3. Construir Binário
    ids_ordenados = sorted(linhas.keys())
    novos_ponteiros = []
    novo_bloco_dados = bytearray()
    
    # Calcular Offset Inicial
    # Magic(4) + (NumStrings * 4) + HashSize
    offset_base = 4 + (len(ids_ordenados) * 4) + len(hash_blob)
    offset_atual = offset_base
    
    print("[-] Reconstruindo blocos de texto...")
    
    for id_linha in ids_ordenados:
        texto = linhas[id_linha]
        
        # Opcional: Alinhamento de memória (Padding)
        # Se o jogo crashar, descomente as linhas abaixo para forçar alinhamento par
        # if offset_atual % 2 != 0:
        #     novo_bloco_dados.append(0xFF)
        #     offset_atual += 1
        
        # Salva o ponteiro atual
        novos_ponteiros.append(offset_atual)
        
        # Converte texto e adiciona null terminator
        texto_bytes = texto.encode('utf-8')
        entrada = texto_bytes + b'\x00'
        
        novo_bloco_dados.extend(entrada)
        offset_atual += len(entrada)

    # 4. Escrever Arquivo
    with open(arquivo_bin_saida, 'wb') as f:
        # Magic
        f.write(b'\x6F\xFE\x00\x00')
        
        # Ponteiros
        for p in novos_ponteiros:
            f.write(struct.pack('<I', p))
            
        # Hash
        f.write(hash_blob)
        
        # Texto
        f.write(novo_bloco_dados)

    print(f"[-] Arquivo criado: {arquivo_bin_saida}")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        montar_flat(sys.argv[1])
    else:
        print("Arraste o arquivo .CSV para cá.")
        input()