@symbol_func function G_CD(cur_reactor::AbstractReactor)
  cur_G = cur_reactor.T_bar

  cur_G *= cur_reactor.sigma_v

  cur_G
end
