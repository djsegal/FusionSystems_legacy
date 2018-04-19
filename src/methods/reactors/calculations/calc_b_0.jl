function calc_B_0(cur_reactor::AbstractReactor)
  cur_B_0 = K_PB(cur_reactor)

  cur_B_0 *= G_PB(cur_reactor)

  cur_B_0 ^= 1 / gamma_PB(cur_reactor)

  cur_B_0
end
