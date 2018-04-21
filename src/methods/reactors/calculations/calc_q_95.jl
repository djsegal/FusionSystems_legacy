function calc_q_95(cur_reactor::AbstractReactor)
  cur_q_95 = 5.0

  cur_q_95 *= cur_reactor.B_0

  cur_q_95 *= a(cur_reactor) ^ 2

  cur_q_95 *= _f_q(cur_reactor)

  cur_q_95 /= cur_reactor.R_0

  cur_q_95 /= cur_reactor.I_P

  cur_q_95
end
