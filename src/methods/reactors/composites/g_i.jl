@symbol_func function G_I(cur_reactor::AbstractReactor)
  cur_is_pulsed = cur_reactor.is_pulsed

  cur_func = cur_is_pulsed ? _G_I_P : _G_I_S

  cur_G = cur_func(cur_reactor)

  cur_G
end

function _G_I_P(cur_reactor::AbstractReactor)
  tmp_term = G_VI(cur_reactor)
  tmp_term /= K_FT(cur_reactor)

  cur_G_VO = G_VO(cur_reactor)

  cur_numerator =
    ( K_CS(cur_numerator) * G_CS(cur_reactor) )

  cur_numerator +=
    ( K_VI(cur_reactor) * cur_G_VO )

  cur_denominator = K_RU(cur_reactor)

  cur_denominator -=
    ( K_VO(cur_reactor) * cur_G_VO )

  cur_numerator *= tmp_term
  cur_denominator *= tmp_term

  cur_numerator += 1.0
  cur_denominator += 1.0

  cur_denominator -=
    ( K_CD(cur_reactor) * G_CD(cur_reactor) )

  cur_G = cur_numerator

  cur_G /= cur_denominator

  cur_G
end

function _G_I_S(cur_reactor::AbstractReactor)
  cur_G = 1.0

  cur_G -=
    ( K_CD(cur_reactor) * G_CD(cur_reactor) )

  cur_G ^= -1

  cur_G
end
