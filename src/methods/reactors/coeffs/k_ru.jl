@symbol_func function K_RU(cur_reactor::AbstractReactor)
  cur_K = cur_reactor.C_ejima

  cur_K += cur_reactor.l_i / 2

  cur_K += _external_inductance_term(cur_reactor)

  cur_K *= wb_conversion

  cur_K
end

@symbol_func function _external_inductance_term(cur_reactor::AbstractReactor)
  cur_epsilon = cur_reactor.epsilon

  cur_kappa = kappa_x(cur_reactor)

  cur_numerator = _b_HN(cur_epsilon)

  cur_numerator -= _a_HN(cur_epsilon)

  cur_denominator = cur_kappa

  cur_denominator *= _d_HN(cur_epsilon)

  cur_denominator /= ( 1 - cur_epsilon )

  cur_denominator += 1

  cur_term = cur_numerator

  cur_term /= cur_denominator

  cur_term
end

function _a_HN(cur_epsilon::AbstractFloat)
  cur_a = 2.0

  cur_a += 9.25 * sqrt(cur_epsilon)

  cur_a -= 1.21 * cur_epsilon

  cur_a
end

function _b_HN(cur_epsilon::AbstractFloat)
  cur_b = 1.0

  cur_b += 1.81 * sqrt(cur_epsilon)

  cur_b += 2.05 * cur_epsilon

  cur_b *= log( 8.0 / cur_epsilon )

  cur_b
end

function _d_HN(cur_epsilon::AbstractFloat)
  cur_sqrt_epsilon = sqrt(cur_epsilon)

  cur_d = 1.0

  cur_d += 2 * cur_epsilon ^ 4

  cur_d -= 6 * cur_epsilon ^ 5

  cur_d += 3.7 * cur_epsilon ^ 6

  cur_d *= 0.73 * cur_sqrt_epsilon

  cur_d
end
