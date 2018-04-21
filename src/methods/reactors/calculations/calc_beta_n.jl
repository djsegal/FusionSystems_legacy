function calc_beta_N(cur_reactor::AbstractReactor)
  cur_beta_N = K_TB(cur_reactor)

  cur_beta_N *= cur_reactor.max_beta_N

  cur_beta_N *= G_TB(cur_reactor)

  cur_beta_N ^= 1 / lambda_TB(cur_reactor)

  cur_beta_N /= cur_reactor.B_0

  cur_beta_N
end
