@symbol_func function G_WL(cur_reactor::AbstractReactor)
  cur_G = G_I(cur_reactor) ^ 2

  cur_G *= cur_reactor.T_bar ^ 2

  cur_G *= cur_reactor.sigma_v

  cur_G /= cur_reactor.R_0 ^ 3

  cur_G
end
