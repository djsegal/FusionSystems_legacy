@symbol_func function G_DV(cur_reactor::AbstractReactor)
  cur_G = G_I(cur_reactor)

  cur_G *= cur_reactor.T_bar

  cur_G /= cur_reactor.R_0

  cur_G ^= 3.2

  cur_G *= cur_reactor.sigma_v

  cur_G
end
