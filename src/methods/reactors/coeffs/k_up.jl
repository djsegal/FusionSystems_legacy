@symbol_func function K_UP(cur_reactor::AbstractReactor)
  cur_K = phi_total(cur_reactor)

  cur_K /= K_I(cur_reactor)

  cur_K /= K_FT(cur_reactor)

  cur_K
end
