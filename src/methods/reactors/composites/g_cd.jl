@symbol_func function G_CD(cur_reactor::AbstractReactor)
  cur_ratio = cur_reactor.T_bar

  cur_ratio /= cur_reactor.T_CD_sat

  cur_G = tanh( 2 * cur_ratio )

  cur_G *= cur_reactor.sigma_v

  cur_G
end
