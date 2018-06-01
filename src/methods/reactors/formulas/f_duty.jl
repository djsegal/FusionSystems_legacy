@symbol_func function f_duty(cur_reactor::AbstractReactor)
  cur_reactor.is_pulsed || return 1.0

  cur_f = cur_reactor.tau_FT

  cur_f /= (
    cur_reactor.tau_FT + cur_reactor.tau_WK
  )

  cur_f
end
