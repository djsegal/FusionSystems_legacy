@symbol_func function phi_total(cur_reactor::AbstractReactor)
  cur_phi = cur_reactor.pi

  cur_phi *= (2/3)

  cur_phi *= cur_reactor.B_OH

  cur_phi *= _solenoid_radius_squared(cur_reactor)

  cur_phi
end

function _solenoid_radius_squared(cur_reactor::AbstractReactor)
  cur_R_inner = cur_reactor.R_OH
  cur_R_outer = cur_R_inner + cur_reactor.dR_OH

  cur_R_2 = cur_R_inner
  cur_R_2 *= cur_R_outer

  cur_R_2 += cur_R_inner ^ 2
  cur_R_2 += cur_R_outer ^ 2

  cur_R_2
end
