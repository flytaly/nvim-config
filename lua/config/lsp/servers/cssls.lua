-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
return function()
  return {
      settings = { css = { validate = false } }
  }
end
