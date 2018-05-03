@symbol_func function K_CD(cur_reactor::AbstractReactor)
  cur_K = K_F(cur_reactor)

  if cur_reactor.is_pulsed
    cur_K *= 0.21
  else
    cur_K *= 1.2 / ( 5 + cur_reactor.Z_eff )
  end

  cur_K /= 10

  cur_K /= cur_reactor.Q

  cur_K *= K_G(cur_reactor)

  cur_K
end
