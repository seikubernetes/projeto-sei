## Imagem Docker (SEI-APACHE)
## Obs.: é necessário copiar os fontes do sei para dentro de arquivos/SEI-Fontes-v3.1.0

Geração da imagem local:
> $  podman build  --no-cache -t ${enderecoDockerRegistry}/${nomeProjeto}/${nomeImagem}:${versaoImagem} ${diretorioDockerfile} 
