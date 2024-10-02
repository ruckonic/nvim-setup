local lsp = require("lsp-zero")
local mason = require('mason')
local mason_lsp_config = require('mason-lspconfig')
local lsp_config = require('lspconfig')
local cmp = require('cmp')

lsp.preset("recommended")
lsp.setup()

lsp.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)


mason.setup({})


mason_lsp_config.setup({
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      -- (Optional) configure lua language server
      local lua_opts = lsp.nvim_lua_ls()
      lsp_config.lua_ls.setup(lua_opts)
    end,
    biome = function()
      -- (Optional) configure biome language server
      lsp_config.biome.setup({})
    end,
    denols = function()
      -- (Optional) configure deno language server
      lsp_config.denols.setup({
        root_dir = lsp_config.util.root_pattern("deno.json", "deno.jsonc"),
      })
    end,
    tsserver = function()
      -- (Optional) configure tsserver language server
      lsp_config.tsserver.setup({
        root_dir = lsp_config.util.root_pattern("package.json"),
        single_file_support = false
      })
    end,
  }
})

---
-- Autocompletion config
---
local cmp_action = lsp.cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})


