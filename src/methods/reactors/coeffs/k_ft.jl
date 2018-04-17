function K_FT(cur_reactor::AbstractReactor)
  cur_K = 6.8e-8

  cur_K *= cur_reactor.C_saw

  cur_K *= cur_reactor.tau_FT

  cur_K *= cur_reactor.Z_eff

  cur_K /= kappa_x(cur_reactor)

  cur_K /= cur_reactor.epsilon ^ 2

  cur_K *= ( 4.3 - 0.6 / cur_reactor.epsilon )

  cur_K
end
