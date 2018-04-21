function calc_f_CD(cur_reactor::AbstractReactor)
  cur_f_CD = cur_reactor.eta_CD

  cur_f_CD *= P_H(cur_reactor)

  cur_f_CD /= cur_reactor.I_P

  cur_f_CD /= cur_reactor.n_bar

  cur_f_CD /= cur_reactor.R_0

  cur_f_CD
end
