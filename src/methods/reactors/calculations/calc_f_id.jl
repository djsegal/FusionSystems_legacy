function calc_f_ID(cur_reactor::AbstractReactor)
  cur_f_ID = 1.0

  cur_f_ID -= cur_reactor.f_BS

  cur_f_ID -= cur_reactor.f_CD

  cur_eps = eps()

  cur_is_zero = isapprox(
    cur_f_ID, cur_eps, atol=2*cur_eps
  )

  cur_is_zero && return 0.0

  cur_f_ID
end
