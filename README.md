# nvim-gozero-api

A small Neovim plugin for go-zero `.api` files. Designed to work with LazyVim.

## Features

- Detects `.api` files as the separate `api` filetype, so `gopls` does not treat them as Go source files.
- Adds basic syntax highlighting for go-zero API definitions.
- Adds `<leader>cf` to run `goctl api format --dir <current-file-directory>`.

> `goctl api format --dir` formats API files in the current file's directory; it may format more than the current buffer.

## Requirements

- Neovim
- [goctl](https://go-zero.dev/reference/cli-guide/api/) installed and available in `PATH` to use the formatter

## Install with LazyVim

After pushing this repository to GitHub, add the following to a LazyVim plugin spec, for example `~/.config/nvim/lua/plugins/gozero-api.lua`:

```lua
return {
  {
    "guo-steve/nvim-gozero-api",
    ft = "api",
  },
}
```

Replace `guo-steve` with your GitHub username or organization. Restart Neovim and open a `.api` file.

## Usage

- Open any go-zero `.api` file.
- Basic syntax highlighting is applied automatically.
- Press `<leader>cf` to format `.api` files in the current file's directory.

Check the detected filetype with:

```vim
:set filetype?
```

Expected output:

```text
filetype=api
```

## Notes

This plugin provides lightweight Vim syntax highlighting, not a full Tree-sitter parser or language server. It does not enable Go LSP features for `.api` files.
