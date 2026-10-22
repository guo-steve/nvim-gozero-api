-- gozero-api.nvim: filetype detection and formatting for go-zero .api files.
if vim.g.loaded_gozero_api then
  return
end
vim.g.loaded_gozero_api = true

vim.filetype.add({
  extension = {
    api = "api",
  },
})

-- Format all .api files in the current file's directory.
-- goctl's formatter accepts a directory, so this intentionally uses --dir.
vim.keymap.set("n", "<leader>cf", function()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then
    vim.notify("gozero-api: current buffer has no file", vim.log.levels.WARN)
    return
  end

  if vim.fn.executable("goctl") ~= 1 then
    vim.notify("gozero-api: goctl is not installed or not in PATH", vim.log.levels.ERROR)
    return
  end

  local dir = vim.fn.fnamemodify(file, ":p:h")
  local output = vim.fn.system({ "goctl", "api", "format", "--dir", dir })
  if vim.v.shell_error == 0 then
    vim.notify("Formatted .api files in " .. dir, vim.log.levels.INFO)
  else
    vim.notify("goctl api format failed:\n" .. output, vim.log.levels.ERROR)
  end
end, { desc = "Format go-zero API files" })
