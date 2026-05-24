---
icon: lucide/file-box
tags:
  - 开始使用
  - 设置
---

# 创建网站 { #create-your-site}

在你 [安装好][installed] Zensical 后，就可以使用 `zensical` 可执行指令，启动项目文档。来到你希望安置项目的目录下，然后输入：

[installed]: get-started.md

```
zensical new .
```

如此，Zensical 会创建以下的文件结构：

``` .sh
.
├─ .github/workflows
│  └─ docs.yml
├─ docs/
│  ├─ index.md
│  └─ markdown.md
└─ zensical.toml
```

要想深入了解以上为你生成的具体文件和目录，请移步 [`new` 指令][new] 的用法指导页面。

[new]: usage/new.md#usage

## 配置 { #configuration }

Zensical 有许多 [配置选项][configuration options]，但都自带合理的默认值，即使几乎没有配置任何选项，也能构建出文档网站。你只需要设置 [`site_name`][site_name] 即可：[^1]

  [^1]:
    [`site_name`][site_name] 目前之所以必需，是因为 Zensical 意在替代的静态网站生成工具 —— MkDocs —— 需要这一设置。我们计划在未来某次更新中将它改为非必需。

[site_name]: setup/basics.md#site_name
[site_url]: setup/basics.md#site_url

``` toml
[project]
site_name = "My site"
```

除非你在构建用于 [离线浏览][offline usage] 的文档，否则强烈建议同时指定 [`site_url`][site_url] 设置，因为以下特性依赖于这一设置：

- [即时导航][Instant navigation]
- [即时预览][Instant previews]
- [自定义错误页面][Custom error pages]

[configuration options]: setup/basics.md
[offline usage]: setup/offline.md
[Custom error pages]: customization.md#custom-error-pages
[Instant navigation]: setup/navigation.md#instant-navigation
[Instant previews]: setup/navigation.md#instant-previews

## 边写边预览 { #preview-as-you-write }

Zensical 中包含了网络服务器，因此你可以边写边预览你的文档。源文件修改后，服务器会自动重建站点。输入这条指令开始预览：

``` sh
zensical serve
```

打开浏览器，输入 [localhost:8000][live preview]，就能看到：

![Creating your site]
![Creating your site dark]

  [live preview]: http://localhost:8000
  [Creating your site]: assets/screenshots/creating-your-site.png#gh-light-mode-only
  [Creating your site dark]: assets/screenshots/creating-your-site-dark.png#gh-dark-mode-only

## 构建网站 { #构建网站 }

当你编辑完成后，可以由 Markdown 文件构建出静态网站：

```
zensical build
```

这个目录下的内容就是你的项目文档。你无需运行数据库或服务器，因为它是完全自包含的。这一站点可以托管在 [GitHub Pages] 上、你选用的 CDN 上或者你的私人网络空间。

  [GitHub Pages]: publish-your-site.md#github-pages

如果你不想通过网络在线分发文档，而想把文档打包成一组文件分发（例如放在一个 `.zip` 压缩包中），请移步 [离线浏览][offline usage] 教程。
