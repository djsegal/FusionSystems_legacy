@symbol_func function G_I(cur_reactor::AbstractReactor)
  cur_is_pulsed = cur_reactor.is_pulsed

  cur_func = cur_is_pulsed ? _G_I_P : _G_I_S

  cur_G = cur_func(cur_reactor)

  cur_G
end

function _G_I_P(cur_reactor::AbstractReactor)
  cur_numerator = K_UP(cur_reactor)

  cur_numerator *= cur_reactor.R_0

  cur_numerator *= sqrt(cur_reactor.T_bar)

  cur_numerator += 1

  cur_denominator = K_DN(cur_reactor)

  cur_denominator *= cur_reactor.R_0 ^ 2

  cur_denominator *= sqrt(cur_reactor.T_bar) ^ 3

  cur_denominator -= _G_I_CD_term(cur_reactor)

  cur_denominator += 1

  cur_G = cur_numerator

  cur_G /= cur_denominator

  cur_G
end

function _G_I_S(cur_reactor::AbstractReactor)
  cur_G = 1.0

  cur_G -= _G_I_CD_term(cur_reactor)

  cur_G ^= -1

  cur_G
end

function _G_I_CD_term(cur_reactor::AbstractReactor)
  cur_ratio = cur_reactor.T_bar

  cur_ratio /= cur_reactor.T_CD_sat

  cur_term = K_CD(cur_reactor)

  cur_term *= tanh( 2 * cur_ratio )

  cur_term *= cur_reactor.sigma_v

  cur_term
end
