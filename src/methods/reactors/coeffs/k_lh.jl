@symbol_func function K_LH(cur_reactor::AbstractReactor)
  cur_K = K_F(cur_reactor)

  cur_K *= cur_reactor.eta_CD

  cur_K /= cur_reactor.Q

  cur_K *= K_G(cur_reactor)

  cur_K
end
