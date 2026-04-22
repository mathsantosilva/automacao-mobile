class Arquivos 
    def ler_ultima_linha_arquivo(caminho)
        ultima_linha = File.readlines("#{caminho}").last
        puts ultima_linha
        return ultima_linha.strip
    end

end