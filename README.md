[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/seikubernetes/projeto-sei">
    <img src="images/sei.png" alt="Logo" width="400" height="300">
  </a>

  <h3 align="center">SEI - KUBERNETES</h3>

  <p align="center">
    Padronização de implantação de Sistema Eletrônico de Informações e Gestão de Documentos (SEI) em PaaS Kubernetes públicas e privadas.
    <br />
    <a href="https://github.com/seikubernetes/projeto-sei"><strong>Explore»</strong></a>
    <br />
    <br />
    <a href="https://github.com/seikubernetes/projeto-sei/issues">Reporte um Bug</a>
    ·
    <a href="https://github.com/seikubernetes/projeto-sei/issues">Solicite uma feature</a>
  </p>
</p>



# Table of contents
1. [Sobre o projeto](#Sobre)
    1. [Tecnologias utilizadas](#Tecnologias)
2. [Começando](#Começando)
    1. [Arquitetura](#Arquitetura)
    2. [Pré-requisitos](#Prerequisitos)
    3. [Imagens](#Imagens)
    4. [Instalação](#Instalação)
    5. [Desisntalação](#Desinstalação)
3. [Roadmap](#Roadmap)
4. [Contribuições](#Contribuições)
5. [Licença](#Licença)
6. [Contatos](#Contatos)
    1. [Marcelo Lima](#Marcelo)
    2. [Igor Oliveira](#Igor)
    3. [Carlos Lima](#Carlos)
6. [Reconhecimentos](#Reconhecimentos)

<!-- Sobre o projeto -->
## Sobre o projeto <a name="Sobre"></a>

[![SEI][product-screenshot]](https://softwarepublico.gov.br/social/profile/sei)

O Sistema Eletrônico de Informações (SEI), desenvolvido pelo Tribunal Regional Federal da 4ª Região (TRF4), é um sistema de gestão de processos e documentos arquivísticos eletrônicos, com interface amigável e práticas inovadoras de trabalho. Uma das suas principais características é a libertação do papel como suporte físico para documentos institucionais e o compartilhamento do conhecimento com atualização e comunicação de novos eventos em tempo real.

O projeto atual visa permitir a instalação de um ambiente completo do SEI em Kubernetes via Helm.

### Tecnologias utilizadas <a name="Tecnologias"></a>

Para a implantação do projeto é necessário o uso do Helm e Git.

As tecnologias utilizadas no ambiente foram:

* [Helm](https://helm.sh/)
* [Git](https://github.com/)
* [Mysql](https://www.mysql.com/)
* [Apache](https://httpd.apache.org/)
* [Php](https://www.php.net/)
* [Jod-converter](https://sourceforge.net/projects/jodconverter/files/JODConverter)
* [Memcached](https://memcached.org/)
* [Solr](https://solr.apache.org/)
* [Docker](https://www.docker.com/)
* [Podman](https://podman.io/)
* [Alpine](https://alpinelinux.org/)

<!-- Começando -->
## Começando <a name="Começando"></a>

Nesta sessão iremos demostrar a arquitetura e o processo de instalação e desinstalação do SEI em Kubernetes.

## Arquitetura <a name="Arquitetura"></a>

A arquitetura do projeto SEI Kubernetes é composta pelos seguintes containers:<br>
* Banco de dados Mysql
* Serviço Jodconverter
* Serviço Web Apache+PHP+Memcached
* Serviço de indexação Solr

[![SeiKubernetes][project-screenshot]](https://drive.google.com/file/d/1MfvLN3vewDgHmu3Ri0z0jAxEmdpiLMup/view?usp=sharing)


## Pré-requisitos <a name="Prerequisitos"></a>

O Helm deve ser instalado:
* Helm
  ```sh
   $ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
   $ chmod 700 get_helm.sh
   $ ./get_helm.sh
  ```

## Imagens <a name="Imagens"></a>

Todas as imagens foram construídas utilizando como imagem base o projeto Alpinelinux:

* [sei-jodconverter](https://hub.docker.com/r/seikubernetes/sei-jodconverter)
* [sei-solr](https://hub.docker.com/r/seikubernetes/sei-solr)
* [sei-mysql](https://hub.docker.com/r/seikubernetes/sei-mysql)
* [sei-apache](https://hub.docker.com/r/seikubernetes/sei-apache)

## Instalação <a name="Instalação"></a>

1. Realize o clone do repositório localmente:
   ```sh
   git clone https://github.com/seikubernetes/projeto-sei.git
   ```
2. Crie um namespace em seu ambiente kubernetes:
   ```sh
   kubectl create namespace projeto-sei
   ```
3. Defina a variável de namespace name no arquivo de nome values.yaml conforme nome do namespace criado anteriormente.
4. Configure as variáveis do values.yaml correspondentes ao seu ambiente kubernetes.
5. Instale o Helm Chart do SEI para criar o ambiente completo baseado nas definições estabelecidadas:
   ```sh
   helm install projeto-sei .projeto-sei/sei
   ```

## Desinstalação <a name="Desinstalação"></a>

1. Realize o clone do repositório localmente:
   ```sh
   git clone https://github.com/seikubernetes/projeto-sei.git
   ```
2. Defina a variável de namespace name no arquivo de nome values.yaml conforme nome do namespace onde o sei está instalado.
3. Desinstale o Helm Chart do SEI para deletar todos os recursos criados no namespace definido.
   ```sh
   helm uninstall projeto-sei
   ```
4. Caso não lembre o nome do Helm do SEI instalado execute:
   ```sh
   helm list
   ```
5. *Caso não apareça o Helm criado e se o namespace tenha sido criado conforme recomendado, pode-se apagar o namespace e os recursos criados dentro dele irão ser apagados também:
   ```sh
   kubectl delete namespace projeto-sei
   ```
   *OBS: Não execute o passo 5 se tiver instalado em namespaces que tem outras aplicações junto, pois, ele irá remover tudo que há no namespace


<!-- ROADMAP -->
## Roadmap <a name="Roadmap"></a>

Veja [problemas abertos](https://github.com/seikubernetes/projeto-sei/issues) para obter uma lista de recursos propostos (e problemas conhecidos).



<!-- CONTRIBUTING -->
## Contribuições <a name="Contribuições"></a>

Constribuições são o que tornam a comunidade de código aberto um lugar incrível para aprender, inspirar e criar. Quaisquer contribuições são ** muito apreciadas**.

1. Realize Fork do projeto
2. Crie sua Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Realize o Commit das suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Realize o Push para a Branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request



<!-- LICENSE -->
## Licença <a name="Licença"></a>

Distributed under the GLP-3.0. See `LICENSE` for more information.



<!-- CONTACT -->
## Contatos <a name="Contatos"></a>

## Marcelo <a name="Marcelo"></a>
![nome-marcelo][nome-shield-marcelo]
[![github-marcelo][github-shield-marcelo]][github-url-marcelo]
[![LinkedIn-Marcelo][linkedin-shield-marcelo]][linkedin-marcelo]
[![Email-Marcelo][mail-shield-marcelo]][mail-url-marcelo]

## Igor <a name="Igor"></a>
![nome-igor][nome-shield-igor]
[![github-igor][github-shield-igor]][github-url-igor]
[![LinkedIn-Igor][linkedin-shield-igor]][linkedin-igor]
[![Email-Igor][mail-shield-igor]][mail-url-igor]

## Carlos <a name="Carlos"></a>
![nome-carlos][nome-shield-carlos]
[![github-carlos][github-shield-carlos]][github-url-carlos]
[![LinkedIn-Carlos][linkedin-shield-carlos]][linkedin-carlos]
[![Email-carlos][mail-shield-carlos]][mail-url-carlos]


<!-- ACKNOWLEDGEMENTS -->
## Reconhecimentos <a name="Reconhecimentos"></a>
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Img Shields](https://shields.io)
* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Pages](https://pages.github.com)
* [Animate.css](https://daneden.github.io/animate.css)
* [Loaders.css](https://connoratherton.com/loaders)
* [Slick Carousel](https://kenwheeler.github.io/slick)
* [Smooth Scroll](https://github.com/cferdinandi/smooth-scroll)
* [Sticky Kit](http://leafo.net/sticky-kit)
* [JVectorMap](http://jvectormap.com)
* [Font Awesome](https://fontawesome.com)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/seikubernetes/projeto-sei.svg?style=for-the-badge
[contributors-url]: https://github.com/seikubernetes/projeto-sei/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/seikubernetes/projeto-sei.svg?style=for-the-badge
[forks-url]: https://github.com/seikubernetes/projeto-sei/network/members
[stars-shield]: https://img.shields.io/github/stars/seikubernetes/projeto-sei.svg?style=for-the-badge
[stars-url]: https://github.com/seikubernetes/projeto-sei/stargazers
[issues-shield]: https://img.shields.io/github/issues/seikubernetes/projeto-sei.svg?style=for-the-badge
[issues-url]: https://github.com/seikubernetes/projeto-sei/issues
[license-shield]: https://img.shields.io/github/license/seikubernetes/projeto-sei.svg?style=for-the-badge
[license-url]: https://github.com/seikubernetes/projeto-sei/blob/master/LICENSE

<!-- MARCELO -->
[linkedin-shield-marcelo]: https://img.shields.io/badge/linkedin-marcelo-brightgreen.svg?logo=linkedin&style=for-the-badge
[linkedin-marcelo]: https://www.linkedin.com/in/marcelo-lima-6724b930
[github-shield-marcelo]: https://img.shields.io/badge/github-marcelo-brightgreen.svg?logo=github&style=for-the-badge
[github-url-marcelo]: https://github.com/marcelolimax
[mail-shield-marcelo]: https://img.shields.io/badge/Email-marcelo.lima%40tjpe.jus.br-yellowgreen.svg?logo=mail&style=for-the-badge
[mail-url-marcelo]: mailto:marcelo.lima@tjpe.jus.br
[nome-shield-marcelo]: https://img.shields.io/badge/Nome-Marcelo%20Wanderley%20Lima-yellowgreen.svg?logo=mail&style=for-the-badge

<!-- CARLOS -->
[linkedin-shield-carlos]: https://img.shields.io/badge/linkedin-carlos-brightgreen.svg?logo=linkedin&style=for-the-badge
[linkedin-carlos]: https://www.linkedin.com/in/carlos-lima/
[github-shield-carlos]: https://img.shields.io/badge/github-carlos-brightgreen.svg?logo=github&style=for-the-badge
[github-url-carlos]: https://github.com/carlos-lima
[mail-shield-carlos]: https://img.shields.io/badge/Email-c.lima07%40email.com-yellowgreen.svg?logo=mail&style=for-the-badge
[mail-url-carlos]: mailto:c.lima07@gmail.com
[nome-shield-carlos]: https://img.shields.io/badge/Nome-Carlos%20Lima-yellowgreen.svg?logo=mail&style=for-the-badge


<!-- IGOR -->
[linkedin-shield-igor]: https://img.shields.io/badge/linkedin-igor-brightgreen.svg?logo=linkedin&style=for-the-badge
[linkedin-igor]: https://www.linkedin.com/
[github-shield-igor]: https://img.shields.io/badge/github-igor-brightgreen.svg?logo=github&style=for-the-badge
[github-url-igor]: https://github.com/ijgoliveira
[mail-shield-igor]: https://img.shields.io/badge/Email-igor.oliveira%40tjpe.jus.br-yellowgreen.svg?logo=mail&style=for-the-badge
[mail-url-igor]: mailto:igor.oliveira@tjpe.jus.br
[nome-shield-igor]: https://img.shields.io/badge/Nome-Igor%20Jos%C3%A9%20Gomes%20de%20Oliveira-yellowgreen.svg?logo=mail&style=for-the-badge

[product-screenshot]: images/logo.png
[project-screenshot]: images/Sei-kubernetes.png
