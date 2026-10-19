<div align="center">

# TCC Seed — Monografia

[![LaTeX](https://img.shields.io/badge/LaTeX-008080?style=for-the-badge&logo=latex&logoColor=white)](https://www.latex-project.org/)
</div>

Monografia do Trabalho de Conclusão de Curso em Engenharia de Software sobre coleta e análise de dados de humor, hábitos e saúde de estudantes universitários, escrita em LaTeX.

---

## Sobre o Projeto

Monografia submetida ao curso de graduação em **Engenharia de Software** da **Universidade de Brasília (UnB)**, como requisito parcial para obtenção do título de Bacharel em Engenharia de Software.

O trabalho aborda o desenvolvimento de uma solução para coleta e análise de dados sobre humor, hábitos e saúde geral de estudantes em instituições de ensino superior (IES), com o objetivo de auxiliar o direcionamento de políticas institucionais de promoção à saúde.

---

## Estrutura do Repositório

| Caminho            | Descrição                                             |
| -------------------- | ------------------------------------------------------ |
| `main.tex`            | Arquivo principal do documento                        |
| `bibliografia.bib`    | Referências bibliográficas (BibTeX)                   |
| `fixos/`              | Elementos fixos do template (capa, folha de rosto etc.) |
| `editaveis/`          | Capítulos e seções editáveis do trabalho              |
| `figuras/`            | Imagens e figuras utilizadas no documento             |
| `main.pdf`            | Última versão compilada do documento                  |

---

## Tecnologias Utilizadas

| Camada          | Tecnologia |
| ---------------- | ----------- |
| Tipografia        | LaTeX       |
| Referências       | BibTeX      |
| Build             | Make        |

---

## Como Compilar

### Pré-requisitos

- Distribuição LaTeX instalada (ex: [TeX Live](https://www.tug.org/texlive/) ou [MiKTeX](https://miktex.org/)), com `pdflatex`, `bibtex` e `makeindex` disponíveis
- Make

### Compilação completa

Gera o PDF processando referências bibliográficas e índice:

```bash
make
```

O PDF final é gerado em `main.pdf` (e também em `build/main.pdf`).

### Compilação rápida

Útil durante a edição, quando não é necessário reprocessar bibliografia e índice:

```bash
make quick
```

### Limpeza

Remove os arquivos temporários de build:

```bash
make clean
```

Remove os arquivos temporários de build **e** o PDF gerado:

```bash
make cleanall
```

---

<div align="center">
Feito com <3 na <strong>Universidade de Brasília</strong>
</div>
