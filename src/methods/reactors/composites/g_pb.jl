@symbol_func function G_PB(cur_reactor::AbstractReactor)
  cur_scaling = cur_reactor.mode_scaling

  cur_alpha_I_star = alpha_I_star(cur_reactor)

  tmp_G_I = G_I(cur_reactor)
  _is_valid_G(tmp_G_I) || return NaN

  tmp_G_I ^= cur_alpha_I_star
  _is_valid_G(tmp_G_I) || return NaN

  cur_G = G_law(cur_reactor)

  cur_G *= cur_reactor.T_bar ^ ( 1 - cur_alpha_I_star )

  cur_G /= cur_reactor.R_0 ^ alpha_R_star(cur_reactor)

  cur_G *= cur_reactor.sigma_v ^ cur_scaling[:P]

  cur_G /= tmp_G_I

  cur_G
end

function _is_valid_G(cur_G)
  isa(cur_G, SymEngine.Basic) && return true
  ( cur_G > 0 ) && return true

  false
end
