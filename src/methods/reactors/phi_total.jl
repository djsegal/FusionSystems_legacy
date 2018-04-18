@symbol_func function phi_total(cur_reactor::AbstractReactor)
  cur_phi = pi

  cur_R_OH = cur_reactor.R_OH + cur_reactor.dR_OH
  cur_R_OH = 1/cur_R_OH + 1/cur_reactor.R_OH
  cur_R_OH = 2 / cur_R_OH

  cur_phi *= cur_R_OH ^ 2

  cur_phi *= cur_reactor.B_OH * 2

  cur_phi
end
