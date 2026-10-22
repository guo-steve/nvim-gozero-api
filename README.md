# nvim-gozero-api

A small Neovim plugin for go-zero `.api` files, designed for LazyVim.

## Features

- Detects `.api` files as the separate `api` filetype, so `gopls` does not treat them as Go source files.
- Adds basic syntax highlighting for go-zero API definitions.
- Integrates with `conform.nvim` using `goctl api format --stdin`.
- Uses Conform's normal format-on-save flow when your LazyVim configuration has format-on-save enabled.
- Adds `<leader>cf` to format the current `.api` buffer.

## Requirements

- Neovim
- [goctl](https://go-zero.dev/reference/cli-guide/api/) installed and available in `PATH`
- `stevearc/conform.nvim` (included in the LazyVim setup described below)

## Install with LazyVim

Create `~/.config/nvim/lua/plugins/gozero-api.lua`:

```lua
return {
  {
    "guo-steve/nvim-gozero-api",
    ft = "api",
    dependencies = {
      "stevearc/conform.nvim",
    },
  },
}
```

Restart Neovim and run `:Lazy sync`.

The plugin registers a `goctl` formatter with Conform for the `api` filetype. If your LazyVim setup already formats on save, `.api` files will use it automatically. Otherwise, add or enable `format_on_save` in your Conform configuration.

## Usage

- Open a go-zero `.api` file.
- Basic syntax highlighting is applied automatically.
- Save the file to format it automatically, if Conform format-on-save is enabled.
- Press `<leader>cf` to format the current `.api` buffer manually.

Check the detected filetype with:

```vim
:set filetype?
```

Expected output:

```text
filetype=api
```

## How formatting works

The plugin uses:

```bash
goctl api format --stdin
```

The `--stdin` mode lets Conform send the current buffer contents to `goctl` and receive the formatted content back. Unlike `goctl api format --dir`, this formats the current buffer without formatting neighboring `.api` files.

## Notes

This plugin provides lightweight Vim syntax highlighting, not a full Tree-sitter parser or language server. It does not enable Go LSP features for `.api` files.
