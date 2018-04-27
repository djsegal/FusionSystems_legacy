@symbol_func function K_DV(cur_reactor::AbstractReactor)
  cur_K = 27.753e-3

  cur_K *= K_P(cur_reactor)

  cur_K *= K_F(cur_reactor)

  cur_K *= K_G(cur_reactor) ^ 2

  cur_K *= K_I(cur_reactor) ^ 3.2

  cur_K /= ( 1 + cur_reactor.kappa_95 ^ 2 ) ^ 0.6

  cur_K /= cur_reactor.epsilon ^ 1.2

  cur_K /= cur_reactor.max_q_DV

  cur_K
end
