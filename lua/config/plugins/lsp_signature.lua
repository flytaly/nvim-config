require'lsp_signature'.setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false

  floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ",  -- Panda for parameter
  use_lspsaga = false,  -- set to true if you want to use lspsaga popup
  timer_interval = 500, -- default timer check interval set to lower value if you want to reduce latency
})
