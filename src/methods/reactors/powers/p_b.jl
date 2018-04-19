@symbol_func function P_B(cur_reactor::AbstractReactor)
  cur_P = K_B(cur_reactor)

  cur_P *= cur_reactor.R_0 ^ 3

  cur_P *= cur_reactor.n_bar ^ 2

  cur_P *= sqrt(cur_reactor.T_bar)

  cur_P
end
