-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.keymap.set({ "n", "v" }, "j", "k", { noremap = true })
vim.keymap.set({ "n", "v" }, "k", "j", { noremap = true })

local devsetup_sock = vim.env.DEVSETUP_NVIM_SOCK
if devsetup_sock and vim.v.servername == devsetup_sock then
  local cache = vim.fn.expand("~/.cache/devsetup")
  local cwd_file = cache .. "/cwd"
  local sid_file = cache .. "/bottom.sid"

  local function sync_cwd()
    local cwd = vim.fn.getcwd()
    vim.fn.writefile({ cwd }, cwd_file)
    if vim.fn.filereadable(sid_file) == 1 then
      local sid = (vim.fn.readfile(sid_file)[1] or ""):gsub("%s+$", "")
      if sid ~= "" then
        local script = string.format(
          'tell application "iTerm2" to tell session id %q to write text "cd %s"',
          sid, cwd:gsub('"', '\\"')
        )
        vim.fn.jobstart({ "osascript", "-e", script }, { detach = true })
      end
    end
  end

  vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, { callback = sync_cwd })
end

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    if
      vim.bo[buf].modified
      and vim.bo[buf].buftype == ""
      and vim.api.nvim_buf_get_name(buf) ~= ""
    then
      vim.cmd "silent! write"
    end
  end,
})
