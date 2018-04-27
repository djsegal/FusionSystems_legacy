@symbol_func function K_CS(cur_reactor::AbstractReactor)
  cur_K = phi_cs(cur_reactor)

  cur_K /= K_I(cur_reactor)

  cur_K
end
