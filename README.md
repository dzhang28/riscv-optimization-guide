# RISC-V Optimization Guide

The intention is to give specific actionable optimization recommendations for software developers writing code for RISC-V application processors.

The guide is also available at https://riscv-optimization-guide.riseproject.dev. Any changes merged into the `main` branch are automatically visible at that address using [GitLab Pages](https://docs.gitlab.com/ee/user/project/pages/).

## Intended Audience

See [Intended Audience](https://riscv-optimization-guide.riseproject.dev/#_intended_audience)

## Documentation generator

### Requirements

`asciidoctor`, `asciidoctor-pdf`, `rouge`

Install using [gem](https://docs.asciidoctor.org/asciidoctor/latest/install/ruby-packaging/)

### Build HTML/PDF documents

`make`

Resulting files are `riscv-optimization-guide.pdf` and `riscv-optimization-guide.html`

For a continuous rendering, simply run `make -j continuous-rebuild serve`, and reload the page on your browser after saving riscv-optimization-guide.adoc to disk. It works for both `riscv-optimization-guide.pdf` and `riscv-optimization-guide.html`.
