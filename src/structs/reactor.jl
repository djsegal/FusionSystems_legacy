@with_kw mutable struct Reactor <: AbstractReactor
  T_bar::AbstractSymbol = symbols(:T_bar)

  n_bar::AbstractSymbol = symbols(:n_bar)
  I_P::AbstractSymbol = symbols(:I_P)

  R_0::AbstractSymbol = symbols(:R_0)
  B_0::AbstractSymbol = symbols(:B_0)

  mode_scaling::Dict = h_mode_scaling

  is_pulsed::Bool = true

  H::AbstractFloat = 1.0
  Q::AbstractFloat = 39.86

  epsilon::AbstractFloat = 0.3226
  kappa_95::AbstractFloat = 1.590
  delta_95::AbstractFloat = 0.333

  nu_n::AbstractFloat = 1.00
  nu_T::AbstractFloat = 1.45

  Z_eff::AbstractFloat = 2.584
  f_D::AbstractFloat = 0.9

  A::AbstractFloat = 2.5

  l_i::AbstractFloat = 1.155
  rho_m::AbstractFloat = 0.6

  N_G::AbstractFloat = 1.2

  eta_CD::AbstractFloat = 0.256
  eta_T::AbstractFloat = 0.352

  tau_FT::AbstractFloat = 7200.0
  C_saw::AbstractFloat = 1.0
  C_ejima::AbstractFloat = 0.3

  B_OH::AbstractFloat = 12.8
  R_OH::AbstractFloat = 2.89
  dR_OH::AbstractFloat = 0.82

  max_beta_N::AbstractFloat = 0.02591
  max_q_95::AbstractFloat = 3.247
  max_P_E::AbstractFloat = 1000.0

  beta_N::AbstractCalculated = nothing
  q_95::AbstractCalculated = nothing
  P_E::AbstractCalculated = nothing
end

function Reactor(cur_temp::AbstractSymbol; cur_kwargs...)
  Reactor(
    T_bar = cur_temp,
    cur_kwargs...
  )
end

function SymbolicReactor(; cur_kwargs...)
  Reactor(
    mode_scaling = symbol_scaling,
    cur_kwargs...
  )
end
