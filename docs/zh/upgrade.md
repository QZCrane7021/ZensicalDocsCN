---
icon: lucide/clipboard-clock
tags:
  - 开始使用
---

# 如何升级 { #how-to-upgrade }

查看 [更新日志][changelog]，确定你想升级到的版本。要注意 Zensical 使用 [语义化版本命名法][semantic versioning]，因此如果你想从一个主版本升级到另一个主版本，请仔细阅读 Zensical 文档提供的 [版本规则信息][versioning]。

[changelog]: https://github.com/zensical/zensical/releases
[semantic versioning]: https://semver.org/lang/zh-CN/
[versioning]: #versioning

一旦你确定了要更新，请根据安装 Zensical 的方式，按以下教程操作：

=== "通过 `pip`"

    确保你正确激活了想要升级 Zensical 版本的虚拟环境，然后执行：

    ```
    pip install --upgrade --force-reinstall zensical
    ```

    想要查看当前安装的版本，请执行：

    ```
    pip show zensical
    ```

=== "通过 `uv`"

    如果环境中有锁文件，那么 uv 会 [保持先前的包版本][stick to previous versions] 除非你明确要升级。执行以下指令，但把 `<version>` 替换成你想要升级到的版本。

    ```
    uv lock --upgrade-package zensical==<version>
    ```

    想要查看当前安装的版本，请执行：

    ```
    uv pip show zensical
    ```

[stick to previous versions]: https://docs.astral.sh/uv/concepts/projects/sync/#upgrading-locked-package-versions

## 版本规则信息 { #versioning }

Zensical 采用了 [语义化版本命名法][semantic versioning]，目前采用形如 **0.0.x 的版本号** （适用于早期测试/开发版本）。我们即将发布 **成熟测试版本**，之后就会改用形如 **0.x** 的版本号。发布稳定的 1.0 版本后，我们将会更严格地采用标准的语义化版本命名法。
