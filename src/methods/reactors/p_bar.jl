function p_bar(cur_reactor::AbstractReactor)
  cur_p_bar = atm_conversion

  cur_p_bar *= 1 + cur_reactor.f_D

  cur_p_bar *= 1 + cur_reactor.nu_n

  cur_p_bar *= 1 + cur_reactor.nu_T

  cur_p_bar /= 1 + cur_reactor.nu_n + cur_reactor.nu_n

  cur_p_bar *= cur_reactor.n_bar

  cur_p_bar *= cur_reactor.T_bar

  cur_p_bar
end
