@with_kw mutable struct Reactor <: AbstractReactor
  T_bar::AbstractSymbol = symbols(:T_bar)

  n_bar::AbstractSymbol = symbols(:n_bar)
  I_P::AbstractSymbol = symbols(:I_P)

  R_0::AbstractSymbol = symbols(:R_0)
  B_0::AbstractSymbol = symbols(:B_0)

  sigma_v::AbstractSymbol = symbols(:sigma_v)

  mode_scaling::Dict = h_mode_scaling

  deck::Union{Void, Symbol} = nothing

  is_pulsed::Bool = true
  is_symbolic::Bool = false

  is_solved::Bool = false
  is_good::Bool = true

  H::AbstractSymbol = 1.1
  Q::AbstractSymbol = 39.86

  epsilon::AbstractSymbol = 0.3226
  kappa_95::AbstractSymbol = 1.590
  delta_95::AbstractSymbol = 0.333

  nu_n::AbstractSymbol = 1.00
  nu_T::AbstractSymbol = 1.45

  Z_eff::AbstractSymbol = 2.584
  f_D::AbstractSymbol = 0.9

  A::AbstractSymbol = 2.735

  l_i::AbstractSymbol = 1.155
  rho_m::AbstractSymbol = 0.6

  N_G::AbstractSymbol = 1.2

  eta_CD_sat::AbstractSymbol = 0.35
  T_CD_sat::AbstractSymbol = 30.0

  eta_T::AbstractSymbol = 0.352

  tau_FT::AbstractSymbol = 7273.0
  C_saw::AbstractSymbol = 1.0
  C_ejima::AbstractSymbol = 0.3

  pi::AbstractSymbol = AbstractFloat(Base.pi)

  B_OH::AbstractSymbol = 12.77
  R_OH::AbstractSymbol = 2.483
  dR_OH::AbstractSymbol = 0.8181

  max_beta_N::AbstractSymbol = 0.02591
  max_q_95::AbstractSymbol = 3.247
  max_P_E::AbstractSymbol = 1000.0

  tau_E::AbstractCalculated = nothing
  p_bar::AbstractCalculated = nothing
  P_F::AbstractCalculated = nothing

  beta_N::AbstractCalculated = nothing
  q_95::AbstractCalculated = nothing
  P_E::AbstractCalculated = nothing

  norm_beta_N::AbstractCalculated = nothing
  norm_q_95::AbstractCalculated = nothing
  norm_P_E::AbstractCalculated = nothing

  f_BS::AbstractCalculated = nothing
  f_CD::AbstractCalculated = nothing
  f_ID::AbstractCalculated = nothing

  volume::AbstractCalculated = nothing

  magnetic_energy::AbstractCalculated = nothing
  cost::AbstractCalculated = nothing

  eta_CD::AbstractCalculated = nothing
end

function _Reactor!(cur_reactor::AbstractReactor, cur_kwargs::Dict)
  for (cur_key, cur_value) in cur_kwargs
    setfield!(cur_reactor, cur_key, cur_value)
  end
end

function Reactor(cur_temp::AbstractSymbol; cur_kwargs...)
  cur_dict = Dict(cur_kwargs)

  cur_reactor = Reactor(cur_temp, cur_dict)

  cur_reactor
end

function Reactor(cur_temp::AbstractSymbol, cur_dict::Dict)
  if haskey(cur_dict, :deck) && cur_dict[:deck] != nothing
    cur_deck_symbol = Symbol("$(cur_dict[:deck])_deck")
    cur_deck_func = getfield(FusionSystems, cur_deck_symbol)

    cur_reactor = cur_deck_func()
  else
    cur_reactor = Reactor()
  end

  cur_reactor.T_bar = cur_temp

  _Reactor!(cur_reactor, cur_dict)

  cur_reactor
end

function SymbolicReactor(; cur_kwargs...)
  cur_dict = Dict(cur_kwargs)

  cur_scaling = haskey(cur_dict, :mode_scaling) ?
    cur_dict[:mode_scaling] : symbol_scaling

  delete!(cur_dict, :mode_scaling)

  cur_reactor = Reactor(
    is_symbolic = true,
    mode_scaling = cur_scaling
  )

  _Reactor!(cur_reactor, cur_dict)

  for cur_field_name in fieldnames(cur_reactor)
    cur_field = getfield(cur_reactor, cur_field_name)
    isa(cur_field, AbstractFloat) || continue

    cur_field = symbols(cur_field_name)
    setfield!(cur_reactor, cur_field_name, cur_field)
  end

  cur_reactor
end
