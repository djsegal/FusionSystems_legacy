@symbol_func function rho_spitzer(cur_reactor::AbstractReactor)
  cur_rho = 6.8e-8

  cur_rho *= cur_reactor.Z_eff

  cur_rho *= cur_reactor.R_0

  cur_rho /= kappa_x(cur_reactor)

  cur_rho /= a(cur_reactor) ^ 2

  cur_rho /= sqrt(cur_reactor.T_bar) ^ 3

  cur_rho *= ( 4.3 - 0.6 / cur_reactor.epsilon )

  cur_rho
end
