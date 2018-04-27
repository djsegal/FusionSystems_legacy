@symbol_func function G_VI(cur_reactor::AbstractReactor)
  cur_G = cur_reactor.R_0 ^ 2

  cur_G *= sqrt(cur_reactor.T_bar) ^ 3

  cur_G
end
