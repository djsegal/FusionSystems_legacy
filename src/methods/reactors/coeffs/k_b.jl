@symbol_func function K_B(cur_reactor::AbstractReactor)
  cur_nu_n = cur_reactor.nu_n

  cur_nu_T = cur_reactor.nu_T

  cur_K = 0.1056

  cur_K *= ( 1 + cur_nu_n ) ^ 2

  cur_K *= sqrt( 1 + cur_nu_T )

  cur_K /= 1 + 2 * cur_nu_n + 0.5 * cur_nu_T

  cur_K *= cur_reactor.Z_eff

  cur_K *= cur_reactor.epsilon ^ 2

  cur_K *= cur_reactor.kappa_95

  cur_K *= geom_factor(cur_reactor)

  cur_K
end
