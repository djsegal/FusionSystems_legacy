function G_TB(cur_reactor::AbstractReactor)
  cur_G = cur_reactor.T_bar

  cur_G /= cur_reactor.R_0

  cur_G
end
