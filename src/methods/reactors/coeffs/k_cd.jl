@symbol_func function K_CD(cur_reactor::AbstractReactor)
  cur_K = K_F(cur_reactor)

  cur_K *= cur_reactor.eta_CD_sat

  cur_K /= cur_reactor.Q

  cur_K *= K_G(cur_reactor)

  cur_K
end
