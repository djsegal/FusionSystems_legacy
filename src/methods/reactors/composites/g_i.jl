@symbol_func function G_I(cur_reactor::AbstractReactor)
  cur_is_pulsed = cur_reactor.is_pulsed

  cur_func = cur_is_pulsed ? _G_I_P : _G_I_S

  cur_G = cur_func(cur_reactor)

  cur_G
end

function _G_I_P(cur_reactor::AbstractReactor)
  cur_numerator = phi_total(cur_reactor)

  cur_numerator /= K_I(cur_reactor)

  cur_numerator *= cur_reactor.R_0

  cur_numerator *= cur_reactor.T_bar ^ (1/2)

  cur_numerator += K_FT(cur_reactor)

  cur_denominator = K_RU(cur_reactor)

  cur_denominator *= cur_reactor.R_0 ^ 2

  cur_denominator *= cur_reactor.T_bar ^ (3/2)

  cur_denominator += K_FT(cur_reactor)

  cur_G = cur_numerator

  cur_G /= cur_denominator

  cur_G
end

function _G_I_S(cur_reactor::AbstractReactor)
  cur_G = 1.0

  cur_G -= K_LH(cur_reactor) * sigma_v_sym

  cur_G ^= -1

  cur_G
end
