function K_PC(cur_reactor::AbstractReactor)
  cur_K = K_F(cur_reactor)

  cur_K *= K_G(cur_reactor) ^ 2

  cur_K *= K_I(cur_reactor) ^ 2

  cur_K *= 1.273

  cur_K *= cur_reactor.eta_T

  cur_K /= cur_reactor.max_P_E

  cur_K
end
