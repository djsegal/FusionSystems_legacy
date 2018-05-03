function calc_eta_CD(cur_reactor::AbstractReactor)
  cur_eta = cur_reactor.T_bar

  if cur_reactor.is_pulsed
    cur_eta *= 0.21
  else
    cur_eta *= 1.2 / ( 5 + cur_reactor.Z_eff )
  end

  cur_eta /= 10

  cur_eta
end
