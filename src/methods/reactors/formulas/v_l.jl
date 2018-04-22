@symbol_func function V_L(cur_reactor::AbstractReactor)
  cur_V = cur_reactor.I_P

  cur_V *= 1e6

  cur_V *= rho_spitzer(cur_reactor)

  cur_V *= calc_f_ID(cur_reactor)

  cur_V
end
