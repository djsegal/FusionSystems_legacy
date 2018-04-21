@symbol_func function kappa_tau(cur_reactor::AbstractReactor)
  cur_kappa = kappa_x(cur_reactor)

  cur_kappa *= geom_factor(
    cur_reactor,
    delta_x(cur_reactor)
  )

  cur_kappa
end
