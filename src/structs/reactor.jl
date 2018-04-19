@with_kw mutable struct Reactor <: AbstractReactor
  T_bar::AbstractSymbol = symbols(:T_bar)

  n_bar::AbstractSymbol = symbols(:n_bar)
  I_P::AbstractSymbol = symbols(:I_P)

  R_0::AbstractSymbol = symbols(:R_0)
  B_0::AbstractSymbol = symbols(:B_0)

  sigma_v::AbstractSymbol = symbols(:sigma_v)

  mode_scaling::Dict = h_mode_scaling

  is_pulsed::Bool = true
  is_symbolic::Bool = false

  H::AbstractSymbol = 1.0
  Q::AbstractSymbol = 39.86

  epsilon::AbstractSymbol = 0.3226
  kappa_95::AbstractSymbol = 1.590
  delta_95::AbstractSymbol = 0.333

  nu_n::AbstractSymbol = 1.00
  nu_T::AbstractSymbol = 1.45

  Z_eff::AbstractSymbol = 2.584
  f_D::AbstractSymbol = 0.9

  A::AbstractSymbol = 2.5

  l_i::AbstractSymbol = 1.155
  rho_m::AbstractSymbol = 0.6

  N_G::AbstractSymbol = 1.2

  eta_CD::AbstractSymbol = 0.256
  eta_T::AbstractSymbol = 0.352

  tau_FT::AbstractSymbol = 7200.0
  C_saw::AbstractSymbol = 1.0
  C_ejima::AbstractSymbol = 0.3

  pi::AbstractSymbol = AbstractFloat(Base.pi)

  B_OH::AbstractSymbol = 12.8
  R_OH::AbstractSymbol = 2.89
  dR_OH::AbstractSymbol = 0.82

  max_beta_N::AbstractSymbol = 0.02591
  max_q_95::AbstractSymbol = 3.247
  max_P_E::AbstractSymbol = 1000.0

  beta_N::AbstractCalculated = nothing
  q_95::AbstractCalculated = nothing
  P_E::AbstractCalculated = nothing
end

function Reactor(cur_temp::Int; cur_kwargs...)
  Reactor(
    float(cur_temp),
    cur_kwargs...
  )
end

function Reactor(cur_temp::AbstractSymbol; cur_kwargs...)
  Reactor(
    T_bar = cur_temp,
    cur_kwargs...
  )
end

function SymbolicReactor(; cur_kwargs...)
  cur_reactor = Reactor(
    is_symbolic = true,
    mode_scaling = symbol_scaling,
    cur_kwargs...
  )

  for cur_field_name in fieldnames(cur_reactor)
    cur_field = getfield(cur_reactor, cur_field_name)
    isa(cur_field, AbstractFloat) || continue

    cur_field = symbols(cur_field_name)
    setfield!(cur_reactor, cur_field_name, cur_field)
  end

  cur_reactor
end
