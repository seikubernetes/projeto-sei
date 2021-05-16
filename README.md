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



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Índice</summary>
  <ol>
    <li>
      <a href="#Sobre-o-projeto">Sobre o projeto</a>
      <ul>
        <li><a href="#Tecnologias-utilizadas">Tecnologias utilizadas</a></li>
      </ul>
    </li>
    <li>
      <a href="#Começando">Começando</a>
      <ul>
        <li><a href="#arquitetura">Arquitetura</a></li>
        <li><a href="#Pré-requisitos">Pré-requisitos</a></li>
        <li><a href="#imagens">Imagens</a></li>
        <li><a href="#instalação">Instalação</a></li>
        <li><a href="#desinstalação">Desinstalação</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#Contribuições">Contribuições</a></li>
    <li><a href="#Licença">Licença</a></li>
    <li><a href="#Contatos">Contatos</a></li>
    <ul>
        <li><a href="#marcelo">Marcelo Lima</a></li>
        <li><a href="#igor">Igor Oliveira</a></li>
        <li><a href="#carlos">Carlos Lima</a></li>
    </ul>
    <li><a href="#Reconhecimentos">Reconhecimentos</a></li>
  </ol>
</details>



<!-- Sobre o projeto -->
## Sobre o projeto

[![SEI][product-screenshot]](https://softwarepublico.gov.br/social/profile/sei)

O Sistema Eletrônico de Informações (SEI), desenvolvido pelo Tribunal Regional Federal da 4ª Região (TRF4), é um sistema de gestão de processos e documentos arquivísticos eletrônicos, com interface amigável e práticas inovadoras de trabalho. Uma das suas principais características é a libertação do papel como suporte físico para documentos institucionais e o compartilhamento do conhecimento com atualização e comunicação de novos eventos em tempo real.

O projeto atual visa permitir a instalação de um ambiente completo do SEI em Kubernetes via Helm.

### Tecnologias utilizadas

Para a implantação do projeto é necessário o uso do Helm e do git.
* [helm](https://helm.sh/)
* [git](https://github.com/)
* [mysql](https://www.mysql.com/)
* [apache](https://httpd.apache.org/)
* [php](https://www.php.net/)
* [jod-converter](https://sourceforge.net/projects/jodconverter/files/JODConverter/2.2.2/)
* [memcache](https://memcached.org/)
* [solr](https://solr.apache.org/)
* [docker](https://www.docker.com/)
* [podman](https://podman.io/)
* [alpine](https://alpinelinux.org/)

<!-- Começando -->
## Começando

Nesta sessão iremos demostrar como a instalação e a desinstalação do ambiente deve ser realizada.

### Arquitetura

A arquitetura do projeto SeiKubernetes é composta por 4 containers.
um Banco de dados mysql, um servidor jodconverter, um servidor apache+php+memcache e um servidor solr

[![SeiKubernetes][project-screenshot]](https://drive.google.com/file/d/1MfvLN3vewDgHmu3Ri0z0jAxEmdpiLMup/view?usp=sharing)


### Pré-requisitos

O helm deve ser instalado:
* helm
  ```sh
   $ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
   $ chmod 700 get_helm.sh
   $ ./get_helm.sh
  ```

### Imagens

Todas as imagens foram construídas utilizando como imagem base o alpinelinux:

* [sei-jodconverter](https://hub.docker.com/r/seikubernetes/sei-jodconverter)
* [sei-solr](https://hub.docker.com/r/seikubernetes/sei-solr)
* [sei-mysql](https://hub.docker.com/r/seikubernetes/sei-mysql)
* [sei](https://hub.docker.com/r/seikubernetes/sei)

### Instalação

1. Realize o clone do repositório localmente:
   ```sh
   git clone https://github.com/seikubernetes/projeto-sei.git
   ```
2. Crie um namespace em seu ambiente kubernetes:
   ```sh
   kubectl create namespace projeto-sei
   ```
3. Defina a variável de namespace name no arquivo de nome values.yaml conforme nome do namespace criado anteriormente.
4. Instale o helm chart do sei para criar o ambiente completo:
   ```sh
   helm install projeto-sei .projeto-sei/sei
   ```

### Desinstalação

1. Realize o clone do repositório localmente:
   ```sh
   git clone https://github.com/seikubernetes/projeto-sei.git
   ```
2. Defina a variável de namespace name no arquivo de nome values.yaml conforme nome do namespace onde o sei está instalado.
3. Desinstale o helm chart sei para deletar todos os recursos criados no namespace definido.
   ```sh
   helm uninstall projeto-sei .projeto-sei/sei
   ```


<!-- ROADMAP -->
## Roadmap

Veja [problemas abertos](https://github.com/seikubernetes/projeto-sei/issues) para obter uma lista de recursos propostos (e problemas conhecidos).



<!-- CONTRIBUTING -->
## Contribuições

Constribuições são o que tornam a comunidade de código aberto um lugar incrível para aprender, inspirar e criar. Quaisquer contribuições são ** muito apreciadas**.

1. Realize Fork do projeto
2. Crie sua Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Realize o Commit das suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Realize o Push para a Branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request



<!-- LICENSE -->
## Licença

Distributed under the GLP-3.0. See `LICENSE` for more information.



<!-- CONTACT -->
## Contatos

### Marcelo
![nome-marcelo][nome-shield-marcelo]
[![github-marcelo][github-shield-marcelo]][github-url-marcelo]
[![LinkedIn-Marcelo][linkedin-shield-marcelo]][linkedin-marcelo]
[![Email-Marcelo][mail-shield-marcelo]][mail-url-marcelo]

### Igor
![nome-igor][nome-shield-igor]
[![github-igor][github-shield-igor]][github-url-igor]
[![LinkedIn-Igor][linkedin-shield-igor]][linkedin-igor]
[![Email-Igor][mail-shield-igor]][mail-url-igor]

### Carlos
![nome-carlos][nome-shield-carlos]
[![github-carlos][github-shield-carlos]][github-url-carlos]
[![LinkedIn-Carlos][linkedin-shield-carlos]][linkedin-carlos]
[![Email-carlos][mail-shield-carlos]][mail-url-carlos]


<!-- ACKNOWLEDGEMENTS -->
## Reconhecimentos
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
[license-url]: https://github.com/seikubernetes/projeto-sei/blob/master/LICENSE.txt

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
[github-url-carlos]: https://github.com/marcelolimax
[mail-shield-carlos]: https://img.shields.io/badge/Email-email%40email.com-yellowgreen.svg?logo=mail&style=for-the-badge
[mail-url-carlos]: mailto:adicionar-email@email.com
[nome-shield-igor]: https://img.shields.io/badge/Nome-Igor%20Jos%C3%A9%20Gomes%20de%20Oliveira-yellowgreen.svg?logo=mail&style=for-the-badge

<!-- IGOR -->
[linkedin-shield-igor]: https://img.shields.io/badge/linkedin-igor-brightgreen.svg?logo=linkedin&style=for-the-badge
[linkedin-igor]: https://www.linkedin.com/
[github-shield-igor]: https://img.shields.io/badge/github-igor-brightgreen.svg?logo=github&style=for-the-badge
[github-url-igor]: https://github.com/ijgoliveira
[mail-shield-igor]: https://img.shields.io/badge/Email-igor.oliveira%40tjpe.jus.br-yellowgreen.svg?logo=mail&style=for-the-badge
[mail-url-igor]: mailto:igor.oliveira@tjpe.jus.br
[nome-shield-carlos]: https://img.shields.io/badge/Nome-Carlos%20Lima-yellowgreen.svg?logo=mail&style=for-the-badge

[product-screenshot]: images/logo.png
[project-screenshot]: images/Sei-kubernetes.png
