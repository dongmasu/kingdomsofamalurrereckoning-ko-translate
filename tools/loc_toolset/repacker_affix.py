import struct
import csv
import os
import sys

def montar(arquivo_csv):
    arquivo_bin_saida = arquivo_csv.replace(".csv", "") + "_NOVO.bin"
    arquivo_hashes = "estrutura_hashes.bin"
    
    if not os.path.exists(arquivo_hashes):
        print("[!] Erro: Arquivo 'estrutura_hashes.bin' não encontrado.")
        print("Execute o desmontador primeiro.")
        return

    print(f"[-] Lendo {arquivo_csv}...")
    
    # 1. Carregar CSV e agrupar por ID
    linhas = {} # { id: [ (tipo, texto), (tipo, texto) ... ] }
    
    with open(arquivo_csv, 'r', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f, delimiter=';')
        for row in reader:
            id_linha = int(row['ID_Linha'])
            tipo = int(row['Tipo_Variante'], 16) # Converte Hex string "11" para int 0x11
            texto = row['Texto']
            
            if id_linha not in linhas:
                linhas[id_linha] = []
            linhas[id_linha].append((tipo, texto))

    # 2. Reconstruir o Bloco de Dados (Texto)
    # E calcular os novos ponteiros absolutos
    
    novo_bloco_dados = bytearray()
    novos_ponteiros = []
    
    # Carregar o blob de hashes para saber o offset inicial
    with open(arquivo_hashes, 'rb') as f:
        hash_blob = f.read()
    
    # Tamanho do cabeçalho = Magic (4) + Ponteiros (N * 4) + HashBlob
    num_linhas = len(linhas)
    # Nota: Precisamos garantir que os IDs estão ordenados 0, 1, 2...
    ids_ordenados = sorted(linhas.keys())
    
    tamanho_header_ponteiros = num_linhas * 4
    offset_atual_absoluto = 4 + tamanho_header_ponteiros + len(hash_blob)
    
    print("[-] Reconstruindo blocos de texto...")
    
    for id_linha in ids_ordenados:
        variantes = linhas[id_linha]
        count = len(variantes)
        
        # Salva o ponteiro absoluto para o inicio desta linha
        novos_ponteiros.append(offset_atual_absoluto)
        
        # --- Construção do Cabeçalho da Linha ---
        # Byte 0: Quantidade
        # Byte 1-2: Offset para a primeira string
        # Formula: 3 bytes fixos + (Count - 1) * 2 bytes de offsets
        if count > 0:
            offset_primeira_str = 3 + (count - 1) * 2
        else:
            offset_primeira_str = 3 # Caso estranho de linha vazia
            
        header_linha = bytearray()
        header_linha.append(count)
        header_linha.extend(struct.pack('<H', offset_primeira_str))
        
        # --- Construção das Strings e Offsets Relativos ---
        blob_strings = bytearray()
        offsets_relativos = bytearray()
        
        # Posição acumulada dentro do bloco de strings (começa logo após o header da linha)
        cursor_relativo = offset_primeira_str
        
        for i, (tipo, texto) in enumerate(variantes):
            # Codificar texto
            texto_bytes = texto.encode('utf-8') # ou 'latin-1' se der erro de acento no jogo
            
            # Montar entrada: [Tipo] [Texto] [00]
            entrada = struct.pack('B', tipo) + texto_bytes + b'\x00'
            blob_strings.extend(entrada)
            
            # Calcular onde essa string TERMINOU para o próximo offset
            cursor_relativo += len(entrada)
            
            # Se NÃO for a última variante, adiciona o offset do fim dela na lista
            if i < count - 1:
                offsets_relativos.extend(struct.pack('<H', cursor_relativo))
        
        # Juntar tudo desta linha
        linha_completa = header_linha + offsets_relativos + blob_strings
        
        # Adicionar ao bloco principal e atualizar ponteiro absoluto
        novo_bloco_dados.extend(linha_completa)
        offset_atual_absoluto += len(linha_completa)

    # 3. Montar o Arquivo Final
    print("[-] Escrevendo arquivo final...")
    
    with open(arquivo_bin_saida, 'wb') as f:
        # A. Magic
        f.write(b'\x4A\x02\x00\x00')
        
        # B. Tabela de Ponteiros
        for p in novos_ponteiros:
            f.write(struct.pack('<I', p))
            
        # C. Hash Blob (Original)
        f.write(hash_blob)
        
        # D. Dados de Texto (Novos)
        f.write(novo_bloco_dados)

    print(f"[-] Arquivo criado: {arquivo_bin_saida}")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        montar(sys.argv[1])
    else:
        print("Arraste o arquivo .CSV para cima deste script.")
        input("Pressione Enter para sair...")