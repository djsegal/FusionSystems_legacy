function G_law(cur_reactor::AbstractReactor)
  cur_G = sigma_v_sym

  cur_G -= K_rad(cur_reactor) * cur_reactor.T_bar ^ 1/2

  cur_G ^= -1

  cur_G
end