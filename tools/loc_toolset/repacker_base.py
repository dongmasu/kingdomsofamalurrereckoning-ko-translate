import struct
import csv
import os
import sys

def montar_stream(arquivo_csv):
    arquivo_bin_saida = arquivo_csv.replace(".csv", "") + "_NOVO.bin"
    arquivo_hashes = "estrutura_hashes_stream.bin"
    
    if not os.path.exists(arquivo_hashes):
        print("[!] Erro: 'estrutura_hashes_stream.bin' não encontrado.")
        return

    print(f"[-] Lendo {arquivo_csv}...")
    
    # 1. Agrupar CSV
    linhas = {} 
    with open(arquivo_csv, 'r', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f, delimiter=';')
        for row in reader:
            id_linha = int(row['ID_Linha'])
            tipo = int(row['Tipo_Variante'], 16)
            texto = row['Texto']
            
            if id_linha not in linhas:
                linhas[id_linha] = []
            linhas[id_linha].append((tipo, texto))

    # 2. Carregar Hash
    with open(arquivo_hashes, 'rb') as f:
        hash_blob = f.read()
    
    # 3. Construir Binário
    ids_ordenados = sorted(linhas.keys())
    novos_ponteiros = []
    novo_bloco_dados = bytearray()
    
    # Calcular onde começa o texto:
    # Magic (4) + (Num_Linhas * 4) + Hash
    offset_base = 4 + (len(ids_ordenados) * 4) + len(hash_blob)
    offset_atual = offset_base
    
    print("[-] Reconstruindo fluxo de dados...")
    
    for id_linha in ids_ordenados:
        # Salva onde começa este bloco
        novos_ponteiros.append(offset_atual)
        
        variantes = linhas[id_linha]
        
        for tipo, texto in variantes:
            # Estrutura Simples: [Byte Tipo] [Texto] [00]
            texto_bytes = texto.encode('utf-8')
            entrada = struct.pack('B', tipo) + texto_bytes + b'\x00'
            
            novo_bloco_dados.extend(entrada)
            offset_atual += len(entrada)
            
        # Opcional: Adicionar alinhamento se necessário?
        # O arquivo original tinha 'FF' as vezes. Geralmente não é obrigatório para tradução,
        # a menos que o jogo exija alinhamento de 4 bytes. 
        # Por enquanto vamos deixar sem padding para testar.

    # 4. Gravar Arquivo
    with open(arquivo_bin_saida, 'wb') as f:
        # Magic
        f.write(b'\xEC\x12\x00\x00')
        
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
        montar_stream(sys.argv[1])
    else:
        print("Arraste o arquivo .CSV para cá.")
        input()