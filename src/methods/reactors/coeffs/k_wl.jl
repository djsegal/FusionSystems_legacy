@symbol_func function K_WL(cur_reactor::AbstractReactor)
  cur_K = K_W(cur_reactor)

  cur_K *= K_G(cur_reactor) ^ 2

  cur_K *= K_I(cur_reactor) ^ 2

  cur_K /= cur_reactor.max_P_W

  cur_K
end
