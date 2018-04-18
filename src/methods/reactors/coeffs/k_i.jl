@symbol_func function K_I(cur_reactor::AbstractReactor)
  cur_K = K_BS(cur_reactor)

  cur_K *= K_G(cur_reactor)

  cur_K
end
