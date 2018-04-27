@symbol_func function G_VO(cur_reactor::AbstractReactor)
  cur_R_outer = cur_reactor.R_CS
  cur_R_outer += cur_reactor.dR_CS

  cur_ratio = cur_R_outer

  cur_ratio /= cur_reactor.R_0

  cur_G = 1.0

  cur_G -= cur_ratio ^ 2

  cur_G
end
