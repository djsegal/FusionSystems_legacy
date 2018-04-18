@symbol_func function alpha_R(cur_reactor::AbstractReactor)
  cur_scaling = cur_reactor.mode_scaling

  cur_alpha = cur_scaling[:R]

  cur_alpha += cur_scaling[:a]

  cur_alpha += cur_scaling[:P]

  cur_alpha -= 2 * ( 1 + cur_scaling[:n] )

  cur_alpha
end
