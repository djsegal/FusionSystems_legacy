@symbol_func function alpha_I(cur_reactor::AbstractReactor)
  cur_scaling = cur_reactor.mode_scaling

  cur_alpha = cur_scaling[:I]

  cur_alpha += alpha_n(cur_reactor)

  cur_alpha
end
