@symbol_func function K_VI(cur_reactor::AbstractReactor)
  cur_K = 1.007

  cur_K /= K_BS(cur_reactor)

  cur_K *= cur_reactor.epsilon ^ 2

  cur_K *= _perimeter_shape_factor(cur_reactor)

  cur_K *= ( 1 + cur_reactor.f_D )

  cur_K *= ( 1 + cur_nu_n )

  cur_K *= ( 1 + cur_nu_T )

  cur_K /= 1 + cur_nu_n + cur_nu_T

  cur_K *= cur_reactor.pi

  cur_K /= 10

  cur_K
end
