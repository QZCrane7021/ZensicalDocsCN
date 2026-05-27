---
icon: lucide/drill
tags:
  - 开始使用
  - 个性化
---

# 个性化 { #customization }

Zensical 让用户得以轻松开始构建现代文档站点。然而，有时你可能想修改文档的外观或氛围，使之更符合你的项目品牌，或者加入自定义功能。本篇说明了你可以怎样个性化改造 Zensical。

## 添加静态资源 { #adding-assets }

Zensical 提供了多种主题个性化的选项。如果你想更改网页的外观，可以将自行写成的 CSS 文件添加到文档的目录中。如果想进行更高级的修改，也可以引入自定义的 JavaScript 代码。

### 添加 CSS { #additional-css }

要想个性化修改网站的外观，你可以添加一份自定义的样式表，以覆写或扩展 Zensical 的默认风格。无论是想修改设计还是加上具体的平拍，只需将样式表文件放在 `docs` 目录下即可：

=== "`zensical.toml`"

    ```
    .
    ├─ docs/
    │  └─ stylesheets/
    │     └─ extra.css
    └─ zensical.toml
    ```

    然后在 `zensical.toml` 中添加如下内容：

    ``` toml
    [project]
    extra_css = ["stylesheets/extra.css"]
    ```

=== "`mkdocs.yml`"

    ```
    .
    ├─ docs/
    │  └─ stylesheets/
    │     └─ extra.css
    └─ mkdocs.yml
    ```

    然后在 `mkdocs.yml` 中添加如下内容：

    ``` yaml
    extra_css:
      - stylesheets/extra.css
    ```

### 添加 JavaScript { #additional-javascript }

要想新增自定义功能或者交互特性，以提升文档体验，你可以向项目中添加 JavaScript 文件。将自定义脚本放置在 `docs` 目录下：

=== "`zensical.toml`"

    ```
    .
    ├─ docs/
    │  └─ javascripts/
    │     └─ extra.js
    └─ zensical.toml
    ```

    然后在 `zensical.toml` 中添加如下内容：

    ``` toml
    [project]
    extra_javascript = ["javascripts/extra.js"]
    ```

=== "`mkdocs.yml`"

    ```
    .
    ├─ docs/
    │  └─ javascripts/
    │     └─ extra.js
    └─ mkdocs.yml
    ```

    然后在 `mkdocs.yml` 中添加如下内容：

    ``` yaml
    extra_javascript:
      - javascripts/extra.js
    ```

???+ tip "确保你的 JavaScript 代码在正确的时机运行"

    你有可能想在浏览器完全加载完网页后立刻运行 JavaScript 中的某些初始化代码。这意味着你需要设置一个回调函数，用于订阅由 Zensical 导出的 `document$` 可观察事件。

    [即时导航][instant navigation] 不会引起浏览器页面刷新，但订阅到可观察事件的函数会执行。如果你使用了这个特性，则尤其需要利用 `document$` 可观察事件。

    ``` javascript
    document$.subscribe(function() {
      console.log("Initialize third-party libraries here")
    })
    ```

  [instant navigation]: setup/navigation.md#instant-navigation

#### 模块，`async` 和 `defer` { #modules-async-defer }

如果你想把自己的代码以 [JavaScript 模块][JavaScript module] 的形式导入，只要确保脚本文件的后缀名是 `.mjs`，或者指明它应该作为模块导入即可：

[JavaScript module]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules

=== "`zensical.toml`"

    ``` toml
    [[project.extra_javascript]]
    path = "javascripts/extra.js"
    type = "module"
    ```

=== "`mkdocs.yml`"

    ``` yaml
    extra_javascript:
      - path: javascripts/extra.js
        type: module
    ```

如此设置后，额外的 JavaScript 在引入时，其 `<script>` 标签会加上 `type="module"` 参数。

类似地，也可以给脚本标签添加 [`defer`][defer] 和 [`async`][async] 参数，深入影响 JavaScript 加载的方式。比如添加了 `async` 的情况：

=== "`zensical.toml`"

    ``` toml
    [[project.extra_javascript]]
    path = "javascripts/extra.js"
    async = true
    ```

=== "`mkdocs.yml`"

    ``` yaml
    extra_javascript:
      - path: javascripts/extra.js
        async: true
    ```

  [defer]: https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/script#defer
  [async]: https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/script#async

需要注意，只有 `extra_javascript` 的参数完全空白，Zensical 才会根据文件后缀名自动检测模块。这意味着如果你想用 `async` 参数加载模块，就需要同时声明 `type` 参数。

## Extending the theme { #extending-the-theme }

Zensical uses [MiniJinja], a Rust-based template engine inspired by Python’s
popular [Jinja] system, to render the HTML structure of your site – including
the header, footer, and navigation sidebars. It rendered the entire scaffold
of your documentation site, while the main content is generated from your
Markdown files.

Templates are HTML files enhanced with MiniJinja instructions for dynamic
rendering. The default page template is `main.html`, which inherits from
`base.html` and includes additional templates found in the `partials` directory.
The [`template`][template] can be customized per page.

[MiniJinja]: https://docs.rs/minijinja/latest/minijinja/
[Jinja]: https://jinja.palletsprojects.com
[template]: authoring/frontmatter.md#page-template

### Configuring overrides

To add new templates or to override parts of existing one, you first need to
configure the `custom_dir` setting to point to a directory in which you store
your template overrides:

=== "`zensical.toml`"

    ``` toml
    [project.theme]
    custom_dir = "overrides"
    ```

=== "`mkdocs.yml`"

    ``` yaml
    theme:
      custom_dir: overrides
    ```

The `custom_dir` path is resolved relative to your configuration file.

### Theme structure

In order to override theme templates, it's important to understand the file
system structure, since any files you store in `custom_dir` override the
templates and partials of the same name as they are provided by Zensical.
Likewise, it's important to know what files exist if you want to *add* your
new templates or partials:

``` .sh
.
├─ .icons/                             # Icon sets
├─ assets/
│  ├─ images/                          # Images and icons
│  ├─ javascripts/                     # JavaScript files
│  └─ stylesheets/                     # Style sheets
├─ partials/
│  ├─ integrations/                    # Third-party integrations
│  │  ├─ analytics/                    # Analytics integrations
│  │  └─ analytics.html                # Analytics setup
│  ├─ languages/                       # Translation languages
│  ├─ actions.html                     # Actions
│  ├─ alternate.html                   # Site language selector
│  ├─ comments.html                    # Comment system (empty by default)
│  ├─ consent.html                     # Consent
│  ├─ content.html                     # Page content
│  ├─ copyright.html                   # Copyright and theme information
│  ├─ feedback.html                    # Was this page helpful?
│  ├─ footer.html                      # Footer bar
│  ├─ header.html                      # Header bar
│  ├─ icons.html                       # Custom icons
│  ├─ language.html                    # Translation setup
│  ├─ logo.html                        # Logo in header and sidebar
│  ├─ nav.html                         # Main navigation
│  ├─ nav-item.html                    # Main navigation item
│  ├─ palette.html                     # Color palette toggle
│  ├─ progress.html                    # Progress indicator
│  ├─ search.html                      # Search interface
│  ├─ social.html                      # Social links
│  ├─ source.html                      # Repository information
│  ├─ source-file.html                 # Source file information
│  ├─ tabs.html                        # Tabs navigation
│  ├─ tabs-item.html                   # Tabs navigation item
│  ├─ tags.html                        # Tags
│  ├─ toc.html                         # Table of contents
│  ├─ toc-item.html                    # Table of contents item
│  └─ top.html                         # Back-to-top button
├─ 404.html                            # 404 error page
├─ base.html                           # Base template
└─ main.html                           # Default page
```

### Custom templates

Some of your pages may need a different structure. Say, you want to have a
custom layout for the homepage of your documentation site, for reference pages or
your blog posts. You can use the [template language provided by MiniJinja] to
produce any HTML structure you like. Use the templates provided by Zensical as
a starter or start from a clean slate.

[template language provided by MiniJinja]: https://docs.rs/minijinja/latest/minijinja/syntax/index.html

Add a new template to the overrides directory you configured. Make sure its name
is not the same as one of the files provided by Zensical (such as `main.html`
and `base.html`). Now you can specify which template should be used for a page
by adding the [template option] to the page header:

[template option]: authoring/frontmatter.md#page-template

``` yaml
---
template: "my_template.html"
---

# Page title

...
```

### Custom error pages

The `overrides` directory is also the place for adding a 404 error page, which
can be configured as a fallback in your web server. If you set `custom_dir` to
`overrides`, use the following layout:

```
├─ overrides/
│  └─ 404.html
└─ zensical.toml
```

Note that Zensical provides a default `404.html` template.

### Template overrides

There are two methods to override templates: You can either override entire
templates or partials, or you can override specific blocks within templates,
which is the recommended approach.

For more information, refer to the [Jinja Template Designer Documentation].

[Jinja Template Designer Documentation]: https://jinja.palletsprojects.com/en/stable/templates/

#### Overriding blocks <small>recommended</small> { #overriding-blocks data-toc-label="Overriding blocks" }

Zensical templates contain _blocks_ that wrap specific features and that can be
re-defined or extended by an override. Zensical defines a `main.html` template
that inherits all its functionality from `base.html`. The most robust way of
making changes via overrides is therefore to override `main.html` instead of
`base.html`, which is more likely to change in future versions of Zensical.

In order to set up block overrides, create a `main.html` file inside the
`overrides` directory:

```
.
└─ overrides/
   └─ main.html
```

Then, e.g. to override the site title, add the following lines to `main.html`:

``` html
{% extends "base.html" %}

{% block htmltitle %}
  <title>Lorem ipsum dolor sit amet</title>
{% endblock %}
```

If you intend to __add__ something to a block rather than to replace it
altogether with new content, use `{{ super() }}` inside the block to include the
original block content. This is particularly useful when adding third-party
scripts to your docs, e.g.

``` html
{% extends "base.html" %}

{% block scripts %}
  <!-- Add scripts that need to run before here -->
  {{ super() }}
  <!-- Add scripts that need to run afterwards here -->
{% endblock %}
```

The following template blocks are provided by the theme:

| Block name        | Purpose                                         |
| :---------------- | :---------------------------------------------- |
| `analytics`       | Wraps the Google Analytics integration          |
| `announce`        | Wraps the announcement bar                      |
| `config`          | Wraps the JavaScript application config         |
| `container`       | Wraps the main content container                |
| `content`         | Wraps the main content                          |
| `extrahead`       | Empty block to add custom meta tags             |
| `fonts`           | Wraps the font definitions                      |
| `footer`          | Wraps the footer with navigation and copyright  |
| `header`          | Wraps the fixed header bar                      |
| `hero`            | Wraps the hero teaser (if available)            |
| `htmltitle`       | Wraps the `<title>` tag                         |
| `libs`            | Wraps the JavaScript libraries (header)         |
| `outdated`        | Wraps the version warning                       |
| `scripts`         | Wraps the JavaScript application (footer)       |
| `site_meta`       | Wraps the meta tags in the document head        |
| `site_nav`        | Wraps the site navigation and table of contents |
| `styles`          | Wraps the style sheets (also extra sources)     |
| `tabs`            | Wraps the tabs navigation (if available)        |


#### Overriding partials

In order to override a partial, you can replace it with a file of the same name
and location in the `overrides` directory. For example, to replace the original
`footer.html` partial, create a new `footer.html` partial in the `overrides`
directory:

```
.
└─ overrides/
   └─ partials/
      └─ footer.html
```

Zensical will now use the new partial when rendering the theme.

## Packaging themes

If you want to share your theme extension with others, you can package it as a
Python distribution. This allows users to install it with `pip` and reference it
by name in their configuration.

!!! info "Future improvements"

    The current packaging process closely mirrors MkDocs, using the
    `mkdocs.themes` entry point, which allows existing Material for MkDocs
    theme derivations to run on Zensical with minimal changes. With the
    upcoming [component system], this process will become more flexible,
    enabling reuse at the component level.

[component system]: https://zensical.org/about/roadmap/#component-system

### Package layout

The following layout is recommended for a packaged theme extension. The package
directory contains an optional `mkdocs_theme.yml` configuration file alongside
your template and media files, and a `pyproject.toml` at the top level declares
the package metadata and entry point:

``` sh
.
├─ pyproject.toml
└─ my_theme/
   ├─ __init__.py #(1)!
   ├─ ... #(2)!
   ├─ main.html
   └─ mkdocs_theme.yml
```

1.  The `__init__.py` file is required to make the theme directory a Python
    package that can be imported. __It can be empty__.

2.  You can add any files you like here. As a recommendation for a sensible
    structure, you can follow the patterns laid out in the [theme structure]
    section.

[theme structure]: #theme-structure

### Package configuration

The `pyproject.toml` file should contain the following content, with the
placeholders – marked as highlighted lines – replaced with your actual values:

```toml hl_lines="6 8 10 17 20"
[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"

[project]
name = "my-theme"
version = "0.1.0"
description = "My theme extension"
authors = [
  { name = "Jane Doe", email = "jane@example.com" }
]
license = "MIT"
requires-python = ">=3.9"
dependencies = ["zensical>=0.0.37"]

[tool.hatch.build.targets.wheel]
include = ["my_theme"]

[project.entry-points."mkdocs.themes"]
my_theme = "my_theme"
```

The entry point group `mkdocs.themes` is what Zensical uses to discover
installed themes. The key on the left (`my_theme`) is the name users will
set in their configuration file, and the value on the right (`my_theme`) is
the directory inside your package that contains the theme files.

### Theme configuration

A packaged theme extension may include a `mkdocs_theme.yml` file in the theme
directory to set default configuration values and declare which theme it extends:

```yaml
extends: material #(1)!

# Default configuration - here, we just set a different font to demonstrate the
# concept, but you can set any theme configuration option here
font:
  text: Roboto
  code: Roboto
```

1.  If you're building on top of Zensical's default theme, set `extends` to
    `material`. If you're building on top of another extension, set it to the
    name of that extension.

    For now, we deliberately keep the name of the default theme as `material`
    for compatibility with existing Material for MkDocs extensions.

The `extends` key tells Zensical which theme this extension builds on. Users
can override any of the defaults defined here in their own `mkdocs.yml` or
`zensical.toml`. If no `mkdocs_theme.yml` is provided, the extension is treated
as a full standalone theme.


!!! note "Differences from MkDocs theme packaging"

    Zensical makes theming more flexible than MkDocs:

    - **`mkdocs_theme.yml` is optional, even for packaged themes.** MkDocs requires it for any packaged theme; Zensical simply looks for it and uses it when present.
    - **`mkdocs_theme.yml` is also read from `custom_dir`.** MkDocs ignores it outside of packaged themes; Zensical reads it regardless, so you can include theme configuration in a local override directory too.

### Using packaged themes

Once your package is ready, install it locally with:

```
pip install .
```

Or publish it to PyPI and let users install it with:

```
pip install my-theme
```

Users can then reference your extension by its entry point name in their
configuration:

=== "`zensical.toml`"

    ```toml
    [project.theme]
    name = "my_theme"
    ```

=== "`mkdocs.yml`"

    ``` yaml
    theme:
      name: my_theme
    ```
