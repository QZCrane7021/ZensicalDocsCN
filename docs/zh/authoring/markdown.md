---
icon: lucide/notebook-text
tags:
  - 撰写工具
  - 兼容性
---

# Markdown

Markdown 是一种轻量的标记语言，用于撰写博客文章、技术文档等。2004 年，John Gruber 在 Aaron Swartz 的协助下发明了这种语言。相比于 HTML 或 XML 等替代方案，它格式精简、直观，易于撰写和阅读。

出于与 Material for MkDocs 的兼容性考虑，Zensical 由 [Python Markdown] 驱动。Python Markdown 旨在忠实移植 [John Gruber 的原始 Markdown 格式][gruber]，同时保持可扩展性。大多数情况下，它完全兼容原始规范，支持标题、列表、链接、引用块和行内格式（例如粗体和斜体）等核心功能。

[gruber]: https://daringfireball.net/projects/markdown/

!!! note "Markdown 变种之间的差异"
    Markdown 规范的各种实现对原始规范的进一步诠释 [各不相同][differences]。

    具体来说，Python Markdown 要求一次缩进为四个空格（或一次 Tab），而其他实现变种只需要两个空格。类似地，当列表项包含多层级或位于提示块中时，也都需要缩进四个空格。

    还有一种情况：Python Markdown 不会在列表标记改变时新开一个列表（例如从 `*` 改为 `-`），而其他规范（如 CommonMark）则会 [新开一个列表][start a new list]。

[differences]: https://python-markdown.github.io/#differences
[start a new list]: https://spec.commonmark.org/0.31.2/#lists

!!! warning "README 文件"

    位于 `docs_dir` 中的 `README.md` 文件会像 MkDocs 那样自动转换为 `index.html`。但目前，当 `README.md` 和 `index.md` 同时出现在一个目录下时，无法确定唯一结果，因此最好避免二者同时存在。我们有一条 [积压事务][bl_readme] 正是处理这一问题的。

[bl_readme]: https://github.com/zensical/backlog/issues/135

无论是 Python Markdown 本身还是 Zensical 支持的 [Python Markdown 扩展][Python Markdown Extensions]，都提供了 Markdown 核心特性之外的扩展功能，以满足那些希望写出清晰、美观、引人入胜的文档的专业作者的需求。

我们要确保与 Material for MkDocs 的兼容性，其中一个重要方法是支持相同的内容语法，然后在此基础上发展 Zensical。想了解细节，请移步 [我们的开发规划][our roadmap] 和 [兼容性页面][compatibility pages]。

[Python Markdown]: https://python-markdown.github.io/
[Python Markdown Extensions]: https://facelessuser.github.io/pymdown-extensions/
[our roadmap]: https://zensical.org/about/roadmap/
[compatibility pages]: https://zensical.org/compatibility/

!!! info "未来的开发规划"
    我们目前正在积极探索添加对 [CommonMark] 的支持，包括 GitHub 风格的 Markdown 扩展以及使用组件系统的扩展撰写选项。

    从基于 Python 的 Markdown 实现转向其他方案，还将带来显著的性能优势，并改善工具支持，因为 CommonMark 的采用率远高于 Python Markdown。

    当 Zensical 对 CommonMark 的支持成熟后，我们将提供迁移路径，让你的团队在准备好后将内容迁移到 CommonMark。

[CommonMark]: https://commonmark.org/

## 学习 Markdown { #learning-markdown }

如果你不熟悉 Markdown 语法，从 John Gruber 编写的 [初版 Markdown 说明][gruber] 学起，至今仍很可取。另外，也可以使用[Markdown 指南][Markdown Guide] 这一优质资源。

[Markdown Guide]: https://www.markdownguide.org/

## 页面间链接 { #linking-between-pages }

在添加指向其他页面的链接时，请始终使用指向对应 Markdown 文件的相关链接，而不要链接到将要生成的 HTML 文件。Zensical 会将它们转换为指向目标的正确链接。此外，如果使用了 [`use_directory_urls`][dirurls]，它会生成指向 HTML 文件的正确链接或以目录结尾的链接，这一点尤为重要。

[dirurls]: ../setup/basics.md#use_directory_urls

未来，Zensical 将支持 HTML 以外的输出格式。届时，指向 Markdown 页面的链接仍然有效，而直接指向 HTML 页面的链接则无效。

此外，使用相对链接时，你的站点可以迁移到新的 `site_url` 而无需任何更改。尽量避免使用绝对链接，因为绝对链接在你的本地机器上可能正常工作，但在生产服务器上可能会失效。

## 页面标题 { #page-title }

Zensical 会为每个页面生成页面标题，优先级顺序如下：

1. 在 `nav` 配置设置中为页面定义的标题
2. 在页面的前文中定义的标题
3. 页面内容中的一级 Markdown 标题
4. Markdown 文件的基础名称

因此，明确定义的导航标题优先级最高，其次是明确定义的页面标题，然后是首个一级 Markdown 标题。如果以上都不可用，则使用文件名作为后备。

!!! warning "临时限制"

    上述顺序适用于导航中的页面标题。

    Zensical 目前的行为在以下情况中与 MkDocs 不完全一致：如果你在配置中指定了 `nav` 设置，但没有在 Markdown 文件中指定 `# Page title`，MkDocs 会使用导航标题，而 Zensical 会使用 Markdown 文件的基础名称作为页面的 `h1`。

    ---

    我们目前正在重新设计导航功能，其中部分工作就是解决上述问题。[ZAP 001] 概述了页面标题的行为及其用例。特别是，我们希望保留标题中的标记语言，而 MkDocs 剥离了这个功能。我们会确保重新设计后，用户在迁移时不会大量返工。

  [ZAP 001]: https://zensical.org/spark/proposals/zap-001-page-titles/
