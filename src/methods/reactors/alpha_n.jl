@symbol_func function alpha_n(cur_reactor::AbstractReactor)
  cur_scaling = cur_reactor.mode_scaling

  cur_alpha = 1.0

  cur_alpha += cur_scaling[:n]

  cur_alpha -= 2 * cur_scaling[:P]

  cur_alpha
end
