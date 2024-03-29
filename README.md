<h1 align="center">🎨 svgo</h1>

<p align="center">

<img src="https://img.shields.io/badge/Neovim-57A143?logo=neovim&logoColor=fff&style=for-the-badge" alt="Neovim" />

<img src="https://img.shields.io/badge/Made%20With%20Lua-2C2D72?logo=lua&logoColor=fff&style=for-the-badge" alt="made with lua" >

Illustrate.nvim is a lua plugin for neovim that lets you quickly create, search and open **SVG** files in Inkscape (Linux, macOS) from within neovim. It works with Markdown files.

</p>

## Features

With key bindings you define, `illustrate` can:

- Create a new `.svg` file with a name of your choice, insert a code snippet of the figure automatically, and open the figure in Inkscape. The example key binding provided below is
  `<leader>i`.
- Open the figure under the cursor, in Inkscape. The example key binding below is `<leader>io`.

The plugin currently supports macOS and Linux only.

## Installation

The plugin is currently designed for [lazy.nvim](https://github.com/folke/lazy.nvim).

### lazy.nvim

```lua
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
        function() illustrate.create_and_open_svg() end,
        desc = "Create and open a new SVG file with provided name."
      },
      {
        "<leader>io",
        function() illustrate.open_under_cursor() end,
        desc = "Open file under cursor (or file within environment under cursor)."
      },
    }
  end,
  opts = {},
}
```

## Contributions, feedback and requests

Happy to accept contributions/pull requests to extend and improve this simple
plugin. I am also open to feedback and requests for new features. Please open a
GitHub issue for those.

## Other notes

- This plugin is inspired from [this](https://github.com/gillescastel/inkscape-figures) Python project from [Gilles Castel](https://github.com/gillescastel) and his excellent blog post [here](https://castel.dev/post/lecture-notes-2/), made to be a native lua plugin for neovim.
- The structure of this repo is based on [nvim-plugin-template](https://github.com/mistricky/nvim-plugin-template)
- Forked from [illustrate](https://github.com/rpapallas/illustrate.nvim)
