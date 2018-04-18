@symbol_func function G_KF(cur_reactor::AbstractReactor)
  cur_G = 1.0

  cur_G /= G_I(cur_reactor)

  cur_G /= cur_reactor.R_0

  cur_G /= cur_reactor.T_bar

  cur_G
end
