function calc_n_bar(cur_reactor::AbstractReactor)
  cur_n_bar = K_G(cur_reactor)

  cur_n_bar *= cur_reactor.I_P

  cur_n_bar /= cur_reactor.R_0 ^ 2

  cur_n_bar
end
