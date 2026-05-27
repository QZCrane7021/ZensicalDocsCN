---
icon: lucide/cloud-upload
tags:
  - 开始使用
  - 发布
---

# 发布网站 { #publish your site }

在 `git` 仓库中托管项目文档有一大优势，就是收到新改动时能自动部署。Zensical 让这一切无比简单。

## GitHub Pages

如果你的代码已经托管在 Github 上，用 [Github Pages] 发布项目文档，无需付款、操作简易，显然最方便。

  [GitHub Pages]: https://pages.github.com/

### 通过 GitHub Actions 部署 { #with-github-actions }

利用 [Github Actions]，你的项目文档可以自动部署。在仓库根目录下，新建一个 Github Actions 工作流，例如 `.github/workflows/docs.yml`，并复制以下内容，粘贴进去：

``` yaml
name: Documentation
on:
  push:
    branches:
      - master
      - main
permissions:
  contents: read
  pages: write
  id-token: write
jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - uses: actions/configure-pages@v5
      - uses: actions/checkout@v5
      - uses: actions/setup-python@v5
        with:
          python-version: 3.x
      - run: pip install zensical
      - run: zensical build --clean # (1)!
      - uses: actions/upload-pages-artifact@v4
        with:
          path: site
      - uses: actions/deploy-pages@v4
        id: deployment
```

1. 目前，我们不建议在持续集成系统中保留缓存，因为缓存功能会随着我们优化 Zensical 的性能而不断改动。

每当有新内容被提交到用于部署的分支中（例如 `master` 或 `main`），系统就会自动构建、部署静态站点。推送内容改动，以查看工作流的运行情况。

一小段时间后，你的文档就能在 `<username>.github.io/<repository>` 访问了。

  [GitHub Actions]: https://github.com/features/actions

## GitLab Pages

如果你将代码托管在 Gitlab 上，可以用 [GitLab 持续集成系统][GitLab CI] 的任务执行器部署到 [GitLab Pages] 上。在根目录创建一个名为 `.gitlab-ci.yml` 的任务定义，并复制以下内容，粘贴进去：

``` yaml
pages:
  stage: deploy
  image: python:latest
  script:
    - pip install zensical
    - zensical build --clean # (1)!
  pages:
    publish: site # (2)!
  rules:
    - if: '$CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
```

1. 目前，我们不建议在持续集成系统中保留缓存，因为缓存功能会随着我们优化 Zensical 的性能而不断改动。

2. Gitlab 文档说明，静态文档生成工具需要配置以适应 Gitlab Pages。Gitlab Pages 默认使用 `public` 文件夹，但也可以在后文链接中 [设置默认文件夹][configure the default folder]。

[configure the default folder]: https://docs.gitlab.com/user/project/pages/introduction/#customize-the-default-folder

每当有新内容被提交到 [默认分支][default branch] 中（例如 `master` 或 `main`），系统就会自动构建、部署静态站点。推送内容改动，以查看工作流的运行情况。

!!! note "Gitlab Pages settings"
    默认情况下，Gitlab Pages 会将用户的网站发布到一个带有随机字符串的域名上。为了生产部署，请在 Gitlab Pages 设置中取消勾选 `Use unique domain`。此外如果想对外公开，要确保在 Pages `Settings > General > Visibility` 设置中调整好可见性。

你的文档现在应该被发布到 `<username>.gitlab.io/<repository>` 了。

  [GitLab Pages]: https://gitlab.com/pages
  [GitLab CI]: https://docs.gitlab.com/ee/ci/
  [default branch]: https://docs.gitlab.com/ee/user/project/repository/branches/default.html

## 其他平台 {#other}

我们无法在此列举出所有的托管服务商。以下社区教程会讲述如何在其他地方部署 Zensical 网站。如果你发现教程有问题，请联系教程的作者。

* [基于 GitHub Actions 的 Azure 静态网络应用](https://zensical-guides.hypercat.net/azure-static-web-app-github/)
* [基于 Azure DevOps 的 Azure 静态网络应用](https://zensical-guides.hypercat.net/azure-static-web-app-devops/)
