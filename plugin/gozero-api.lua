-- gozero-api.nvim: filetype detection, syntax highlighting, and formatting.
if vim.g.loaded_gozero_api then
  return
end
vim.g.loaded_gozero_api = true

vim.filetype.add({
  extension = {
    api = "api",
  },
})

-- Integrate with conform.nvim when available. goctl's --stdin mode lets
-- Conform replace the current buffer contents safely, including on save.
local ok, conform = pcall(require, "conform")
if ok then
  conform.formatters.goctl = {
    command = "goctl",
    args = { "api", "format", "--stdin" },
    stdin = true,
  }

  conform.formatters_by_ft.api = { "goctl" }
end

-- Keep an explicit formatting shortcut as well.
vim.keymap.set("n", "<leader>cf", function()
  if vim.fn.executable("goctl") ~= 1 then
    vim.notify("gozero-api: goctl is not installed or not in PATH", vim.log.levels.ERROR)
    return
  end

  local ok_conform, conform_module = pcall(require, "conform")
  if not ok_conform then
    vim.notify("gozero-api: conform.nvim is not available", vim.log.levels.ERROR)
    return
  end

  conform_module.format({
    bufnr = vim.api.nvim_get_current_buf(),
    formatters = { "goctl" },
    lsp_format = "never",
  })
end, { desc = "Format go-zero API file" })
