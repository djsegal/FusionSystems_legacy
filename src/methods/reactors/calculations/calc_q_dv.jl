function calc_q_DV(cur_reactor::AbstractReactor)
  cur_q_DV = 18.31e-3

  cur_q_DV *= 1 + cur_reactor.Q / 5.0

  cur_q_DV *= 2 ^ 0.6

  cur_q_DV /= ( 1.0 + cur_reactor.kappa_95 ^ 2 ) ^ 0.6

  cur_q_DV *= P_H(cur_reactor)

  cur_q_DV *= cur_reactor.I_P ^ 1.2

  cur_q_DV /= cur_reactor.epsilon ^ 1.2

  cur_q_DV /= cur_reactor.R_0 ^ 2.2

  cur_q_DV
end
