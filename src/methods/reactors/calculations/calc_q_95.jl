function calc_q_95(cur_reactor::AbstractReactor)
  cur_q_95 = K_KF(cur_reactor)

  cur_q_95 /= cur_reactor.max_q_95

  cur_q_95 *= G_KF(cur_reactor)

  cur_q_95 /= cur_reactor.B_0

  cur_q_95 ^= -1

  cur_q_95
end
