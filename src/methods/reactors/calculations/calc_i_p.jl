function calc_I_P(cur_reactor::AbstractReactor)
  cur_I_P = K_I(cur_reactor)

  cur_I_P *= G_I(cur_reactor)

  cur_I_P *= cur_reactor.T_bar

  cur_I_P
end
