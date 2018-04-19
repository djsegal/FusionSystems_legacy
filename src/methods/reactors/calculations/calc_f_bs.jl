function calc_f_BS(cur_reactor::AbstractReactor)
  cur_f_BS = K_BS(cur_reactor)

  cur_f_BS *= cur_reactor.n_bar

  cur_f_BS *= cur_reactor.T_bar

  cur_f_BS *= cur_reactor.R_0 ^ 2

  cur_f_BS /= cur_reactor.I_P ^ 2

  cur_f_BS
end
