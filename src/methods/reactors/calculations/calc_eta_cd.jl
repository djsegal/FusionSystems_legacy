function calc_eta_CD(cur_reactor::AbstractReactor)
  cur_ratio = cur_reactor.T_bar

  cur_ratio /= cur_reactor.T_CD_sat

  cur_eta = cur_reactor.eta_CD_sat

  cur_eta *= tanh( 2 * cur_ratio )

  cur_eta
end
