local function get_typescript_server_path(root_dir)
  local project_roots = vim.fs.find("node_modules", { path = root_dir, upward = true, limit = math.huge })
  for _, project_root in ipairs(project_roots) do
    local typescript_path = project_root .. "/typescript"
    local stat = vim.loop.fs_stat(typescript_path)
    if stat and stat.type == "directory" then
      return typescript_path .. "/lib"
    end
  end
  return ""
end

-- Root dir function based on your markers
local function get_root_dir(fname)
  return vim.fs.root(fname, { "package.json", "tsconfig.json", "jsconfig.json", ".git" })
end

-- Get the root directory once (optional: could defer this per-buffer)
local root_dir = get_root_dir(vim.api.nvim_buf_get_name(0))
local tsdk_path = get_typescript_server_path(root_dir)

--- @type vim.lsp.Config
return {
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
  init_options = {
    typescript = {
      tsdk = tsdk_path,
    },
  },
}
