mutable struct Reactor <: AbstractReactor
  n_bar::AbstractSymbol
  T_bar::AbstractSymbol
  R_0::AbstractSymbol
  B_0::AbstractSymbol
  I_P::AbstractSymbol

  mode_scaling::Dict

  is_pulsed::Bool

  H::AbstractFloat
  Q::AbstractFloat

  epsilon::AbstractFloat
  kappa_95::AbstractFloat
  delta_95::AbstractFloat

  nu_n::AbstractFloat
  nu_T::AbstractFloat

  Z_eff::AbstractFloat
  f_D::AbstractFloat

  A::AbstractFloat

  l_i::AbstractFloat
  rho_m::AbstractFloat

  N_G::AbstractFloat

  eta_CD::AbstractFloat
  eta_T::AbstractFloat

  tau_FT::AbstractFloat
  C_saw::AbstractFloat
  C_ejima::AbstractFloat

  B_OH::AbstractFloat
  R_OH::AbstractFloat
  dR_OH::AbstractFloat

  max_beta_N::AbstractFloat
  max_q_95::AbstractFloat
  max_P_E::AbstractFloat

  beta_N::AbstractCalculated
  q_95::AbstractCalculated
  P_E::AbstractCalculated
end

reactor_symbols = [
  n_bar_sym,
  T_bar_sym,
  R_0_sym,
  B_0_sym,
  I_P_sym
]

reactor_defaults = OrderedDict(
  :mode_scaling => h_mode_scaling,
  :is_pulsed => default_is_pulsed,
  :H => default_H,
  :Q => default_Q,
  :epsilon => default_epsilon,
  :kappa_95 => default_kappa_95,
  :delta_95 => default_delta_95,
  :nu_n => default_nu_n,
  :nu_T => default_nu_T,
  :Z_eff => default_Z_eff,
  :f_D => default_f_D,
  :A => default_A,
  :l_i => default_l_i,
  :rho_m => default_rho_m,
  :N_G => default_N_G,
  :eta_CD => default_eta_CD,
  :eta_T => default_eta_T,
  :tau_FT => default_tau_FT,
  :C_saw => default_C_saw,
  :C_ejima => default_C_ejima,
  :B_OH => default_B_OH,
  :R_OH => default_R_OH,
  :dR_OH => default_dR_OH,
  :max_beta_N => default_max_beta_N,
  :max_q_95 => default_max_q_95,
  :max_P_E => default_max_P_E
)

reactor_limits = [
  "beta_N",
  "q_95",
  "P_E"
]

function Reactor(; raw_kwargs...)
  cur_kwargs = Dict(raw_kwargs)
  cur_inputs = deepcopy(reactor_defaults)

  for cur_key in keys(cur_inputs)
    haskey(cur_kwargs, cur_key) || continue

    cur_inputs[cur_key] = cur_kwargs[cur_key]
  end

  cur_reactor = Reactor(
    reactor_symbols...,
    values(cur_inputs)...,
    repmat([nothing], length(reactor_limits))...
  )

  cur_reactor
end
