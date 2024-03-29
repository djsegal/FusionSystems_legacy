function calc_f_CD(cur_reactor::AbstractReactor)
  cur_eta_CD = cur_reactor.eta_CD

  ( cur_eta_CD == nothing ) &&
    ( cur_eta_CD = calc_eta_CD(cur_reactor) )

  cur_f_CD = cur_eta_CD

  cur_f_CD *= P_H(cur_reactor)

  cur_f_CD /= cur_reactor.I_P

  cur_f_CD /= cur_reactor.n_bar

  cur_f_CD /= cur_reactor.R_0

  if isa(cur_reactor.sigma_v, SymEngine.Basic)
    cur_f_CD = float(
      calc_sigma_v(cur_reactor, cur_f_CD)
    )
  end

  cur_f_CD
end
