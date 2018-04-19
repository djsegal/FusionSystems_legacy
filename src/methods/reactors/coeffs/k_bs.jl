@symbol_func function K_BS(cur_reactor::AbstractReactor)
  cur_K = 4.879

  cur_K *= 1 + cur_reactor.kappa_95 ^ 2

  cur_K /= 2

  cur_K *= sqrt(cur_reactor.epsilon) ^ 5

  cur_K *= _C_B(cur_reactor)

  cur_K
end

@symbol_func function _C_B(cur_reactor::AbstractReactor)
  cur_nu_n = cur_reactor.nu_n

  cur_nu_T = cur_reactor.nu_T

  cur_gamma = 1 / ( 1 - cur_reactor.rho_m ^ 2 )

  cur_func = function (cur_rho)
    cur_value = 1.0 - cur_rho ^ 2

    cur_value ^= cur_nu_n + cur_nu_T - 1

    cur_value *= sqrt(cur_rho) ^ 5

    cur_value /= _b_theta(cur_gamma, cur_rho)

    cur_value
  end

  cur_reactor.is_symbolic &&
    ( cur_func = cur_func(rho_sym) )

  cur_C_B = norm_int(cur_func)

  cur_C_B *= 1 + cur_nu_n

  cur_C_B *= 1 + cur_nu_T

  cur_C_B *= cur_nu_n + 0.054 * cur_nu_T

  cur_C_B
end

function _b_theta(cur_gamma::SymEngine.Basic, cur_rho::SymEngine.Basic, use_default::Bool=false)
  use_default && return _b_theta_default(cur_gamma, cur_rho)
  symbols(:b_theta)
end

function _b_theta(cur_gamma::AbstractFloat, cur_rho::AbstractFloat)
  _b_theta_default(cur_gamma, cur_rho)
end

function _b_theta_default(cur_gamma::AbstractSymbol, cur_rho::AbstractSymbol)
  cur_repeat = 1 + cur_gamma

  cur_b_theta = cur_gamma * cur_rho ^ 2
  cur_b_theta -= cur_repeat

  cur_b_theta *= -exp( cur_gamma * cur_rho ^ 2 )
  cur_b_theta -= cur_repeat

  cur_b_theta /= cur_rho
  cur_b_theta /= exp(cur_gamma) - cur_repeat

  cur_b_theta
end
