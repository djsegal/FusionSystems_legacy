function K_PB(cur_reactor::AbstractReactor)
  cur_scaling = cur_reactor.mode_scaling

  cur_K = K_law(cur_reactor)

  cur_K /= cur_scaling[:constant]

  cur_K *= ( K_P(cur_reactor) * K_F(cur_reactor) ) ^ cur_scaling[:P]

  cur_K /= K_G(cur_reactor) ^ alpha_n(cur_reactor)

  cur_K /= cur_reactor.H

  cur_K /= cur_reactor.epsilon ^ cur_scaling[:a]

  cur_K /= cur_reactor.kappa_95 ^ cur_scaling[:kappa]

  cur_K /= cur_reactor.A ^ cur_scaling[:A]

  cur_K /= K_I(cur_reactor) ^ cur_scaling[:I]

  cur_K
end
