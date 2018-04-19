function solve!(cur_reactor::AbstractReactor, cur_limit::Symbol)
  cur_reactor.sigma_v = calc_sigma_v(cur_reactor)

  cur_reactor.R_0 = _solve(cur_reactor, cur_limit)

  cur_reactor.B_0 = calc_B_0(cur_reactor)

  cur_reactor.I_P = calc_I_P(cur_reactor)

  cur_reactor.n_bar = calc_n_bar(cur_reactor)

  cur_reactor.tau_E = tau_E(cur_reactor)
  cur_reactor.p_bar = p_bar(cur_reactor)
  cur_reactor.P_F = P_F(cur_reactor)

  cur_reactor.f_BS = calc_f_BS(cur_reactor)

  cur_reactor.beta_N = calc_beta_N(cur_reactor)
  cur_reactor.q_95 = calc_q_95(cur_reactor)
  cur_reactor.P_E = calc_P_E(cur_reactor)

  cur_reactor.norm_beta_N = calc_beta_N(cur_reactor)
  cur_reactor.norm_q_95 = calc_q_95(cur_reactor)
  cur_reactor.norm_P_E = calc_P_E(cur_reactor)

  cur_reactor.norm_beta_N /= cur_reactor.max_beta_N
  cur_reactor.norm_q_95 /= cur_reactor.max_q_95
  cur_reactor.norm_P_E /= cur_reactor.max_P_E

  cur_reactor.cost = cost(cur_reactor)
  cur_reactor.volume = volume(cur_reactor)
  cur_reactor.magnetic_energy = magnetic_energy(cur_reactor)

  cur_reactor.is_good = !isnan(cur_reactor.R_0)

  cur_reactor.is_solved = true

  cur_reactor
end

function _solve(cur_reactor::AbstractReactor, cur_limit::Symbol)
  cur_mapping = secondary_limits[cur_limit]

  cur_gamma = _getvalue(cur_reactor, cur_mapping, "gamma")

  if iszero(cur_gamma)
    cur_R_0 = _solve_one_equation(cur_reactor, cur_mapping)
  else
    cur_R_0 = _solve_two_equations(cur_reactor, cur_mapping)
  end

  cur_R_0
end

function _getvalue(cur_reactor::AbstractReactor, cur_mapping::AbstractString, cur_field::AbstractString)
  cur_symbol = Symbol("$(cur_field)_$(cur_mapping)")

  cur_field = getfield(
    FusionSystems,
    cur_symbol
  )

  cur_value = cur_field(cur_reactor)

  cur_value
end

function _solve_one_equation(cur_reactor::AbstractReactor, cur_mapping::AbstractString)
  cur_eq = _getvalue(cur_reactor, cur_mapping, "K")
  cur_eq *= _getvalue(cur_reactor, cur_mapping, "G")

  cur_eq -= 1.0

  cur_R_0 = _solve_cur_equation(cur_eq)

  cur_R_0
end

function _solve_two_equations(cur_reactor::AbstractReactor, cur_mapping::AbstractString)
  cur_lhs = K_PB(cur_reactor)
  cur_lhs *= G_PB(cur_reactor)
  cur_lhs ^= 1 / gamma_PB(cur_reactor)

  cur_rhs = _getvalue(cur_reactor, cur_mapping, "K")
  cur_rhs *= _getvalue(cur_reactor, cur_mapping, "G")
  cur_rhs ^= 1 / _getvalue(cur_reactor, cur_mapping, "gamma")

  cur_eq = cur_lhs - cur_rhs

  cur_R_0 = _solve_cur_equation(cur_eq)

  cur_R_0
end

function _solve_cur_equation(cur_eq::SymEngine.Basic, cur_min::Number=min_R_0, cur_max::Number=max_R_0, cur_depth::Int=0)
  cur_R_0 = NaN

  ( cur_depth > 8 ) && return cur_R_0

  try
    cur_R_0 = fzero(cur_eq, cur_min, cur_max)
  catch cur_error
    cur_mid = mean([cur_min, cur_max])

    cur_R_0_bot = _solve_cur_equation(cur_eq, cur_min, cur_mid, cur_depth+1)
    cur_R_0_top = _solve_cur_equation(cur_eq, cur_mid, cur_max, cur_depth+1)

    if isnan(cur_R_0_bot)
      cur_R_0 = cur_R_0_top
    elseif isnan(cur_R_0_top)
      cur_R_0 = cur_R_0_bot
    else
      cur_R_0 = min(cur_R_0_bot, cur_R_0_top)
    end
  end

  cur_R_0
end
