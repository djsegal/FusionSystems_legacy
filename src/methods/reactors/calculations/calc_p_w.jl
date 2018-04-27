function calc_P_W(cur_reactor::AbstractReactor)
  cur_P_W = K_W(cur_reactor)

  cur_P_W *= cur_reactor.n_bar ^ 2

  cur_P_W *= cur_reactor.R_0

  cur_P_W *= cur_reactor.sigma_v

  cur_P_W
end
