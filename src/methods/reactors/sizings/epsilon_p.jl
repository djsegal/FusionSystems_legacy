@symbol_func function epsilon_P(cur_reactor::AbstractReactor)
  cur_epsilon = a_P(cur_reactor)

  cur_epsilon /= cur_reactor.R_0

  cur_epsilon
end
