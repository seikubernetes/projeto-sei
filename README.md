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

  <h3 align="center">Best-README-Template</h3>

  <p align="center">
    Padronização de implantação de sistema eletrônico de informações e gestão de documentos (SEI) em PaaS Kubernetes públicas e privadas.
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
        <li><a href="#Contruído-com">Contruído com</a></li>
      </ul>
    </li>
    <li>
      <a href="#Começando">Começando</a>
      <ul>
        <li><a href="#prerequisites">Prerequisitos</a></li>
        <li><a href="#instalação">Instalação</a></li>
        <li><a href="#desinstalação">desinstalação</a></li>
      </ul>
    </li>
    <li><a href="#uso">Uso</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#Contribuições">Contribuições</a></li>
    <li><a href="#Licença">Licença</a></li>
    <li><a href="#Contatos">Contatos</a></li>
    <li><a href="#Reconhecimentos">Reconhecimentos</a></li>
  </ol>
</details>



<!-- Sobre o projeto -->
## Sobre o projeto

[![SEI][product-screenshot]](https://softwarepublico.gov.br/social/profile/sei)

There are many great README templates available on GitHub, however, I didn't find one that really suit my needs so I created this enhanced one. I want to create a README template so amazing that it'll be the last one you ever need -- I think this is it.

Here's why:
* Your time should be focused on creating something amazing. A project that solves a problem and helps others
* You shouldn't be doing the same tasks over and over like creating a README from scratch
* You should element DRY principles to the rest of your life :smile:

Of course, no one template will serve all projects since your needs may be different. So I'll be adding more in the near future. You may also suggest changes by forking this repo and creating a pull request or opening an issue. Thanks to all the people have have contributed to expanding this template!

A list of commonly used resources that I find helpful are listed in the acknowledgements.

### Contruído com

This section should list any major frameworks that you built your project using. Leave any add-ons/plugins for the acknowledgements section. Here are a few examples.
* [helm](https://helm.sh/)
* [git](https://github.com/)



<!-- Começando -->
## Começando

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisitos

This is an example of how to list things you need to use the software and how to install them.
* helm
  ```sh
   $ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
   $ chmod 700 get_helm.sh
   $ ./get_helm.sh
  ```

### Instalação

1. Get a free API Key at [https://example.com](https://example.com)
2. Clone the repo
   ```sh
   git clone https://github.com/seikubernetes/projeto-sei.git
   ```
3. Create namespace on your kubernetes environment
   ```sh
   kubectl create namespace projeto-sei
   ```
4. Edit variable namespace name in values.yaml file to match your created namespace
5. Install helm chart sei to create the entire system
   ```sh
   helm install projeto-sei .projeto-sei/sei
   ```

### Desinstalação

1. Get a free API Key at [https://example.com](https://example.com)
2. Clone the repo
   ```sh
   git clone https://github.com/seikubernetes/projeto-sei.git
   ```
3. Uninstall helm chart sei to delete the entire system
   ```sh
   helm uninstall projeto-sei .projeto-sei/sei
   ```

<!-- USAGE EXAMPLES -->
## Uso

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/seikubernetes/projeto-sei/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contribuições

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## Licença

Distributed under the GLP-3.0. See `LICENSE` for more information.



<!-- CONTACT -->
## Contactos

Marcelo Wanderley Lima - marcelo.lima@tjpe.jus.br

[![github-marcelo][github-shield-marcelo]][github-url-marcelo][![LinkedIn-Marcelo][linkedin-shield-marcelo]][linkedin-marcelo]

Igor Jose Gomes De Oliveira - igor.oliveira@tjpe.jus.br

[![github-igor][github-shield-igor]][github-url-igor][![LinkedIn-Igor][linkedin-shield-igor]][linkedin-igor]

Carlos Lima - <>

[![github-carlos][github-shield-carlos]][github-url-carlos][![LinkedIn-Carlos][linkedin-shield-carlos]][linkedin-carlos]




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
[linkedin-shield-marcelo]: https://img.shields.io/badge/linkedin-marcelo-brightgreen.svg?logo=linkedin&style=for-the-badge
[linkedin-marcelo]: https://www.linkedin.com/in/marcelo-lima-6724b930
[github-shield-marcelo]: https://img.shields.io/badge/github-marcelo-brightgreen.svg?logo=github&style=for-the-badge
[github-url-marcelo]: https://github.com/marcelolimax
[linkedin-shield-carlos]: https://img.shields.io/badge/linkedin-carlos-brightgreen.svg?logo=linkedin&style=for-the-badge
[linkedin-carlos]: https://www.linkedin.com/in/carlos-lima/
[github-shield-carlos]: https://img.shields.io/badge/github-carlos-brightgreen.svg?logo=github&style=for-the-badge
[github-url-carlos]: https://github.com/marcelolimax
[linkedin-shield-igor]: https://img.shields.io/badge/linkedin-igor-brightgreen.svg?logo=linkedin&style=for-the-badge
[linkedin-igor]: https://www.linkedin.com/
[github-shield-igor]: https://img.shields.io/badge/github-igor-brightgreen.svg?logo=github&style=for-the-badge
[github-url-igor]: https://github.com/ijgoliveira
[product-screenshot]: images/logo.png