function K_rad(cur_reactor::AbstractReactor)
  cur_K = K_law(cur_reactor)

  cur_K *= K_B(cur_reactor)

  cur_K /= K_kappa(cur_reactor)

  cur_K
end
