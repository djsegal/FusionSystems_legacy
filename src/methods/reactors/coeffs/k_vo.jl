@symbol_func function K_VO(cur_reactor::AbstractReactor)
  cur_K = cur_reactor.l_i

  cur_K -= 3.0

  cur_K /= 2

  cur_K += log( 8.0 / cur_reactor.epsilon )

  cur_K *= cur_reactor.pi

  cur_K /= 10

  cur_K
end
