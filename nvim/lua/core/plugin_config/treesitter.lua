require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- Install all parsers or specify a list
  highlight = {
      enable = true,        -- Enable highlighting
      additional_vim_regex_highlighting = false,
  },
  context_commentstring = {
      enable = true,
      enable_autocmd = false,
  },
}
