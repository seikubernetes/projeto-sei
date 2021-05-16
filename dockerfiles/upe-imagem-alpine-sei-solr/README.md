## Imagem Docker (SEI-SOLR)

Obs.: o diretório /dados deve ser um volume persistente

Geração da imagem local:
> $  podman build  --no-cache -t ${enderecoDockerRegistry}/${nomeProjeto}/${nomeImagem}:${versaoImagem} ${diretorioDockerfile} 
