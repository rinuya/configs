-- LSP SETUP
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'gopls' }
})

local lsp_zero = require('lsp-zero').preset({})

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('lspconfig').gopls.setup({
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})

lsp_zero.setup()


-- AUTOCOMPLETION SETUP (VSCode like)

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local luasnip = require("luasnip")

-- Taken from the cmp wiki
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  mapping = {
    -- Auto fill active suggestion
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    -- Arrows to switch between auto fill options, only used when searching for sth specific
    ["<Up>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<Down>"] = cmp.mapping.select_next_item(cmp_select),
    -- not really used
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
})
