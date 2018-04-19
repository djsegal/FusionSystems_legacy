@symbol_func function K_DN(cur_reactor::AbstractReactor)
  cur_K = K_RU(cur_reactor)

  cur_K /= K_FT(cur_reactor)

  cur_K
end
