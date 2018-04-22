@symbol_func function L_P(cur_reactor::AbstractReactor)
  cur_L_P = cur_reactor.l_i / 2

  cur_L_P += _external_inductance_term(cur_reactor)

  cur_L_P *= 4.0 * cur_reactor.pi

  cur_L_P *= 1e-7

  cur_L_P *= cur_reactor.R_0

  cur_L_P
end
