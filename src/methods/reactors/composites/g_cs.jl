@symbol_func function G_CS(cur_reactor::AbstractReactor)
  cur_G = cur_reactor.R_0

  cur_G *= cur_reactor.T_bar

  cur_G ^= -1

  cur_G
end
