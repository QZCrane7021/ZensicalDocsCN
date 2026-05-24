---
icon: lucide/compass
tags:
  - 开始使用
  - 兼容性
---

# 浏览器支持 { #browser-support }

Zensical 试图适配尽可能大范围的浏览器，同时使用诸如 [自定义属性][custom properties]、[蒙版图形][mask images] 等现代 CSS 特性，让 [主题自定义][customize the theme] 更容易。

  [customize the theme]: customization.md
  [custom properties]: https://caniuse.com/css-variables
  [mask images]: https://caniuse.com/mdn-css_properties_mask-image

## 支持的浏览器 { #supported-browsers}

以下的表格列出了 Zensical 完全支持的所有浏览器，因此可以认为这些浏览器中，Zensical 的特性将能无缺损完全实现。如果你使用支持版本内的浏览器，却发现有些内容有问题，请 [新建 issue][open an issue]：

<figure markdown>

| 浏览器                                |     版本 |      发布日期 |         |        |      使用量 |
| ------------------------------------ | ------: | -----------: | ------: | -----: | ---------: |
|                                      |         |              |  桌面端  |  移动端 |       整体  |
| :fontawesome-brands-chrome: Chrome   |     49+ |      03/2016 | 25.65%  | 38.33% |     63.98% |
| :fontawesome-brands-safari: Safari   |     10+ |      09/2016 |  4.63%  | 14.96% |     19.59% |
| :fontawesome-brands-edge: Edge       |     79+ |      01/2020 |  3.95%  |    n/a |      3.95% |
| :fontawesome-brands-firefox: Firefox |     53+ |      04/2017 |  3.40%  |   .30% |      3.70% |
| :fontawesome-brands-opera: Opera     |     36+ |      03/2016 |  1.44%  |   .01% |      1.45% |
|                                      |         |              |         |        | __92.67%__ |

  <figcaption markdown>

浏览器支持表来自于 [caniuse.com]。[^1]

  </figcaption>
</figure>

  [^1]:
    此数据在 2022 年 1 月由 [caniuse.com] 收集得来，主要基于浏览器对 [自定义属性][custom properties]、[蒙版图形][mask images] 和 [:is 伪类选择器][:is pseudo selector] 等特性的支持。上述特性无法完全通过补丁向后兼容。市场份额低于 1% 的浏览器不在考虑范围内，但也可能完全或部分支持上述特性。

要注意这份使用分布数据基于全球的浏览器市场份额，因此它实际上可能和你的目标受众完全不同。建议你自己统计用户中浏览器类型和版本的分布情况。

  [open an issue]: https://github.com/zensical/zensical/issues/new/choose
  [caniuse.com]: https://caniuse.com/
  [:is pseudo selector]: https://caniuse.com/css-matches-pseudo
