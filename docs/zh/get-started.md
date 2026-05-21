---
icon: lucide/package-open
tags:
  - Get started
  - Setup
---

# 开始上手 { #get-started }

Zensical 是一款现代的静态网站生成工具，旨在让项目文档构建、维护起来更简单。它由 [Material for MkDocs] 的开发者开发而成，也共享着相同的核心设计原则和哲学 —— 开箱即用，简单易上手，个性化选择强大。

_你可以 [点击这里][here]，深入了解两个项目是如何关联起来的。_

[Material for MkDocs]: https://squidfunk.github.io/mkdocs-material/
[here]: https://zensical.org/about

## 安装 { #installation }

Zensical 由 Rust 和 Python 编写而成，并发布为 [Python 包][Python package]。我们建议你 [通过 `pip`][with-pip] 或者 [通过 `uv`][with-uv] 安装时，使用 Python _虚拟环境_。两种安装方式下，Zensical 以及全部必要的依赖项都会自动安装好。

[Python package]: https://pypi.org/project/zensical

!!! note "预备条件"
    在安装 Zensical 前，你需要先安装 Python 和 Python 包管理器。我们建议你基于自己的设备操作系统，跟随 [Python 官网][Python website] 上的 [Python 安装与使用][Python Setup and Usage] 的教程。现代的 Python 分发版包含了 `pip` 包管理器，因此除非你在开发基于 Python 的软件，且在使用 `uv`，这就是在你的设备系统上安装 Zensical 最简单的方法。

  [with-pip]: #install-with-pip
  [with-uv]: #install-with-uv
  [Python Setup and Usage]: https://docs.python.org/3/using
  [Python website]: https://www.python.org/

!!! tip "使用 Docker"
    如果你想为了预览、构建网页在 Docker 容器中运行 Zensical，可以使用我们的 [官方 Docker 镜像][official Docker image]。要注意它不是用来托管网站的。至于安装和使用教程，请移步 Docker Hub 上的文档。

[official Docker image]: https://hub.docker.com/r/zensical/zensical

### 通过 pip 安装 { #install-with-pip data-toc-label="通过 pip" }

Zensical 可以通过 `pip` 安装进虚拟环境[^venv]中。

[^venv]: [Python 虚拟环境][Python virtual environment] 是项目目录下的一个文件夹，其中包含一份独立的 Python 副本以及项目运行所需的全部 Python 第三方包。将 Zensical 与依赖项安装进虚拟环境，可以确保它不会干扰电脑上其他基于 Python 运行的项目。

  [Python virtual environment]: https://docs.python.org/3/tutorial/venv.html

=== ":material-apple: macOS"
    打开终端窗口，首先搭建虚拟环境，然后使用 `pip` 将 Zensical 包安装到环境中：

    ``` sh
    python3 -m venv .venv
    source .venv/bin/activate
    pip install zensical
    ```

=== ":fontawesome-brands-windows: Windows"
    打开命令窗口，首先搭建虚拟环境，然后使用 `pip` 将 Zensical 包安装到环境中：

    ```ps1
    python -m venv .venv  # (1)!
    .venv\Scripts\activate
    pip install zensical
    ```

    1.  你可能需要使用其他不同的二进制名，例如 `python3` 或 `py -3`，具体取决于你安装的 Python 版本。

=== ":material-linux: Linux"
    打开终端窗口，首先搭建虚拟环境，然后使用 `pip` 将 Zensical 包安装到环境中：

    ``` sh
    python3 -m venv .venv
    source .venv/bin/activate
    pip install zensical
    ```

### 通过 uv 安装 { #install-with-uv data-toc-label="通过 uv" }

如果你在开发基于 Python 的软件，很有可能你已经在使用 [`uv`][uv] 了。它是一款项目和包管理器，近些年热度水涨船高。

要想通过 uv 安装 Zensical，并将它加入到 `pyproject.toml` 开发依赖项中，执行以下指令：

  [uv]: https://docs.astral.sh/uv/

```
uv init
uv add --dev zensical
uv run zensical
```

要注意，将 Zensical 用作项目依赖项时，你每次都需要执行 `uv run` 或者手动激活项目的虚拟环境。

!!! tip "以 `uv` 工具运行"
    我们强烈建议你在项目虚拟环境中运行 Zensical，以确保 Zensical 的版本固定已知。不过，既然你使用 uv，也可以直接通过一行命令，运行 Zensical 独立工具。请阅读 [`uv` 的文档][uvtool] 以了解详情。

  [uvtool]: https://docs.astral.sh/uv/concepts/tools/#tool-environments


!!! tip "其他利用 PyPI 的工具"
    当然，在 Python 的生态系统中，也有其他利用 PyPI 作为依赖项仓库的管理器。使用那些工具安装 Zensical，流程和 `uv` 应该是类似的。阅读它们自己的文档，以了解详情。

## 第三方发行版 {#third-party-distributions}

Zensical 有其他发行版可用，但这些发行版可能没有使用我们单独发布到 PyPI 上的官方包。如果你有充分的理由，也可以使用这些发行版，但正常使用时，我们还是建议通过上述官方支持的方式安装。

### 通过 conda/Mamba 安装 { #install-with-condamamba data-toc-label="conda/Mamba" }

Zensical 可以在 [conda-forge] 的社区仓库中获取到，因此可以通过 [conda] 或 [Mamba] 安装.

  [conda-forge]: https://conda-forge.org/
  [conda]: https://docs.conda.io/en/latest/
  [Mamba]: https://mamba.readthedocs.io

!!! warning
    我们无法为不受我们控制的发行版提供技术支持。如果你遇到问题，请联系 [conda-forge/zensical-feedstock] 的维护者。

  [conda-forge/zensical-feedstock]: https://github.com/conda-forge/zensical-feedstock

=== ":material-apple: macOS"
    ```
    conda create -n zensical python=3.14
    conda activate zensical
    conda install -c conda-forge zensical
    ```

=== ":fontawesome-brands-windows: Windows"

    如果你在使用 conda 或 Mamba，要确保 base 环境激活。如果你在使用 conda，可以直接打开 [Anaconda 提示符][Anaconda Prompt]。如果你安装了 Mamba 作为 [Miniforge] 的一部分，也有类似的 Miniforge 提示符。

    ```
    conda create -n zensical python=3.14
    conda activate zensical
    conda install -c conda-forge zensical
    ```

=== ":material-linux: Linux"
    ```
    conda create -n zensical python=3.14
    conda activate zensical
    conda install -c conda-forge zensical
    ```

[Anaconda Prompt]: https://www.anaconda.com/docs/reference/glossary#anaconda-prompt
[Miniforge]: https://conda-forge.org/download/
