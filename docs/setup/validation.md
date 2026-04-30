---
icon: lucide/scan-text
tags:
  - Setup
  - Information architecture
status: new
---

# Validation

Broken links are easy to miss – pages get renamed or moved, and references silently stop working. Zensical validates all internal links at build time by scanning every Markdown file and resolving all references: inline links, reference-style links, footnotes, link definitions, and anchors.

## Configuration

Validation is enabled by default. All checks can be individually toggled:

=== "`zensical.toml`"

    ``` toml
    [project.validation]
    unresolved_references = true
    unresolved_footnotes = true
    unused_definitions = true
    unused_footnotes = true
    shadowed_definitions = true
    shadowed_footnotes = true
    invalid_links = true
    invalid_link_anchors = true
    ```

=== "`mkdocs.yml`"

    ``` yaml
    validation:
      unresolved_references: true
      unresolved_footnotes: true
      unused_definitions: true
      unused_footnotes: true
      shadowed_definitions: true
      shadowed_footnotes: true
      invalid_links: true
      invalid_link_anchors: true
    ```

Validation can also be completely disabled:

=== "`zensical.toml`"

    ``` toml
    [project]
    validation = false
    ```

=== "`mkdocs.yml`"

    ``` yaml
    validation: false
    ```

### Links and footnotes

The following checks for links and footnotes are available:

- [`unresolved_references`](#unresolved_references)
- [`unresolved_footnotes`](#unresolved_footnotes)
- [`unused_definitions`](#unused_definitions)
- [`unused_footnotes`](#unused_footnotes)
- [`shadowed_definitions`](#shadowed_definitions)
- [`shadowed_footnotes`](#shadowed_footnotes)
- [`invalid_links`](#invalid_links)
- [`invalid_link_anchors`](#invalid_link_anchors)

---

#### `unresolved_references`

Warn when a link or image reference has no matching definition.

=== "`zensical.toml`"

    ``` toml
    [project.validation]
    unresolved_references = true
    ```

=== "`mkdocs.yml`"

    ``` yaml
    validation:
      unresolved_references: true
    ```

__Example__

``` markdown title="index.md"
This is an [unresolved reference][id].
```

<div class="result" markdown>

``` console
$ zensical build
...
Warning: unresolved link reference
   ╭─[ index.md:1:35 ]
   │
 1 │ This is an [unresolved reference][id].
   │                                   ─┬
   │                                    ╰── unresolved link reference
───╯
```

</div>

---

#### `unresolved_footnotes`

Warn when a footnote reference has no matching definition.

=== "`zensical.toml`"

    ``` toml
    [project.validation]
    unresolved_footnotes = true
    ```

=== "`mkdocs.yml`"

    ``` yaml
    validation:
      unresolved_footnotes: true
    ```

__Example__

``` markdown title="index.md"
This is an unresolved footnote[^id].
```

<div class="result" markdown>

``` console
$ zensical build
...
Warning: unresolved footnote reference
   ╭─[ index.md:1:33 ]
   │
 1 │ This is an unresolved footnote[^id].
   │                                 ─┬
   │                                  ╰── unresolved footnote reference
───╯
```

</div>

---

#### `unused_definitions`

Warn when a link definition is never referenced.

=== "`zensical.toml`"

    ``` toml
    [project.validation]
    unused_definitions = true
    ```

=== "`mkdocs.yml`"

    ``` yaml
    validation:
      unused_definitions: true
    ```

__Example__

``` markdown title="index.md"
[id]: https://example.com
```

<div class="result" markdown>
``` console
$ zensical build
...
Warning: unused link definition
   ╭─[ index.md:1:2 ]
   │
 1 │ [id]: https://example.com
   │  ─┬
   │   ╰── unused link definition
───╯
```
</div>

---

#### `unused_footnotes`

Warn when a footnote definition is never referenced.

=== "`zensical.toml`"

    ``` toml
    [project.validation]
    unused_footnotes = true
    ```

=== "`mkdocs.yml`"

    ``` yaml
    validation:
      unused_footnotes: true
    ```

__Example__

``` markdown title="index.md"
[^id]: This footnote is never referenced.
```

<div class="result" markdown>
``` console
$ zensical build
...
Warning: unused footnote definition
   ╭─[ index.md:1:3 ]
   │
 1 │ [^id]: This footnote is never referenced.
   │   ─┬
   │    ╰── unused footnote definition
───╯
```
</div>

---

#### `shadowed_definitions`

Warn when a link definition is declared more than once.

=== "`zensical.toml`"

    ``` toml
    [project.validation]
    shadowed_definitions = true
    ```

=== "`mkdocs.yml`"

    ``` yaml
    validation:
      shadowed_definitions: true
    ```

__Example__

``` markdown title="index.md"
This [reference][id] has two definitions.

[id]: https://example.com/shadowed
[id]: https://example.com
```

<div class="result" markdown>
``` console
$ zensical build
...
Warning: shadowed link definition
   ╭─[ index.md:3:2 ]
   │
 3 │ [id]: https://example.com/shadowed
   │  ─┬
   │   ╰── shadowed link definition
───╯
```
</div>

---

#### `shadowed_footnotes`

Warn when a footnote definition is declared more than once.

=== "`zensical.toml`"

    ``` toml
    [project.validation]
    shadowed_footnotes = true
    ```

=== "`mkdocs.yml`"

    ``` yaml
    validation:
      shadowed_footnotes: true
    ```

__Example__

``` markdown title="index.md"
This footnote[^id] has two definitions.

[^id]: 1st definition
[^id]: 2nd definition
```

<div class="result" markdown>
``` console
$ zensical build
...
Warning: shadowed footnote definition
   ╭─[ index.md:3:3 ]
   │
 3 │ [^id]: 1st definition
   │   ─┬
   │    ╰── shadowed footnote definition
───╯
```
</div>

---

#### `invalid_links`

Warn when a link points to a page that does not exist.

=== "`zensical.toml`"

    ``` toml
    [project.validation]
    invalid_links = true
    ```

=== "`mkdocs.yml`"

    ``` yaml
    validation:
      invalid_links: true
    ```

__Example__

``` markdown title="index.md"
Oh no, [this page] does not exit.

[this page]: non-existent.md
```

<div class="result" markdown>
``` console
$ zensical build
...
Warning: page does not exist
   ╭─[ index.md:3:14 ]
   │
 3 │ [this page]: non-existent.md
   │              ───────┬───────
   │                     ╰───────── page does not exist
───╯
```
</div>

---

#### `invalid_link_anchors`

Warn when a link points to an anchor that does not exist.

=== "`zensical.toml`"

    ``` toml
    [project.validation]
    invalid_link_anchors = true
    ```

=== "`mkdocs.yml`"

    ``` yaml
    validation:
      invalid_link_anchors: true
    ```

__Example__

``` markdown title="index.md"
Oh no, [this section] does not exit.

[this section]: page.md#non-existent
```

<div class="result" markdown>
``` console
$ zensical build
...
Warning: anchor does not exist
   ╭─[ index.md:3:31 ]
   │
 3 │ [this section]: page.md#non-existent
   │                         ──────┬─────
   │                               ╰─────── anchor does not exist
───╯

```
</div>
