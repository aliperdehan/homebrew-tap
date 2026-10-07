# homebrew-tap

Homebrew formula for [pdfmd](https://github.com/aliperdehan/pdfmd), a Markdown-to-PDF
wrapper around Pandoc.

```sh
brew install aliperdehan/tap/pdfmd
```

This installs Pandoc and Typst alongside it, so `pdfmd file.md` works straight away.
For LaTeX output as well, add `brew install --cask mactex-no-gui`.

`Formula/pdfmd.rb` follows the newest `pdfmd-cli` release on PyPI; a daily workflow
updates it.
