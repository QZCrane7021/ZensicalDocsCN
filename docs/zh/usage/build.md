---
icon: lucide/hammer
tags:
  - Usage
---

# 构建 { #build }

要构建文档网站，请运行 `zensical build` 指令。

[site_dir]: ../setup/basics.md#site_dir

## 指令用法 { #usage }

```sh
zensical build [OPTIONS]
```

指令运行时会在配置好的 [`site_dir`][site_dir] 目录下生成静态网站，默认为 `site` 目录。

## 参数选项 { #options }

你可以运行 `zensical build --help` 指令在命令行中获取有关 `build` 指令的帮助。它支持以下可选参数：

| 参数           | 简写  | 描述                             |
| ------------- | ----- | ------------------------------- |
| --config-file | -f    | 指定使用的配置文件路径。            |
| --clean       | -c    | 清理缓存。                        |
| --strict      | -s    | 启用 [严格模式][strict mode]。     |
| --help        |       | 显示帮助信息后直接退出。            |

[strict mode]: ../setup/validation.md#strict-mode
