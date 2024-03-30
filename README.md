<p align="center">
  <img width="75%" src="data/logo.svg" alt="Banner">
</p>
<p align="center">
  Editing svg files in Neovim with Inkscape: easy mode.
</p>
<p align="center">
  <a href="https://github.com/koekeishiya/yabai/blob/master/LICENSE.txt">
    <img src="https://img.shields.io/github/license/felipejoribeiro/svgo.nvim?color=blue" alt="License Badge">
  </a>
  <a href="https://github.com/felipejoribeiro/svgo.nvim/releases">
    <img src="https://img.shields.io/github/commits-since/felipejoribeiro/svgo.nvim/latest.svg?color=blue" alt="Version Badge">
  </a>
  <a href="https://github.com/felipejoribeiro/svgo.nvim/releases">
    <img src="https://img.shields.io/github/languages/top/felipejoribeiro/svgo.nvim?color=blue" alt="Version Badge">
  </a>
</p>

SVGo.nvim is a lua plugin for neovim that lets you quickly create, search and open **SVG** files in Inkscape (Linux, macOS) from within neovim. It works with Markdown files.

## Features

With key bindings you define, `illustrate` can:

- Create a new `.svg` file with a name of your choice, insert a code snippet of the figure automatically, and open the figure in Inkscape. The example key binding provided below is
  `<leader>i`.
- Open the figure under the cursor, in Inkscape. The example key binding below is `<leader>io`.

The plugin currently supports macOS and Linux only.

## Roadmap

The following features are planned for the future:

- [ ] Complete support for templates:
  - [x] System-wide default template;
  - [ ] Project-specific default template;
  - [ ] System-wide templates;
  - [ ] Project-specific templates;
  - [ ] Creation of `add-template` function;
  - [ ] Creation of `remove-template` function;
- [ ] Support for svg libraries;
  - [ ] Creation of `add-to-library` function;
  - [ ] Creation of `open-from-library` function to use library element as template;
  - [ ] Creation of `remove-from-library` function;
- [ ] Deal with hot-reload from Inkscape;
- [ ] Support for Windows;

## Installation

```lua
--- lazy.nvim
return {
  'felipejoribeiro/svgo.nvim',
  dependencies = {
    "rcarriga/nvim-notify",
  },
  keys = function()
    local illustrate = require('svgo')
    return {
      {
        "<leader>i",
        function() svgo.create_and_open_svg() end,
        desc = "Create and open a new SVG file with provided name."
      },
      {
        "<leader>io",
        function() svgo.open_under_cursor() end,
        desc = "Open file under cursor (or file within environment under cursor)."
      },
    }
  end,
  opts = {},
}
```

## Final remarks

In memory of **Gilles Castel ✝︎2022**, author of [How I'm able to take notes in mathematics lectures using LaTeX and Vim](https://castel.dev/post/lecture-notes-1/) blog post, whom inspired me to persue note taking excellence. Forked from [illustrate](https://github.com/rpapallas/illustrate.nvim).
