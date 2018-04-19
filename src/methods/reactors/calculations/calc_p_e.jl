function calc_P_E(cur_reactor::AbstractReactor)
  cur_P_E = K_PC(cur_reactor)

  cur_P_E *= cur_reactor.max_P_E

  cur_P_E *= G_PC(cur_reactor)

  cur_P_E
end
