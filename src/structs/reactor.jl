mutable struct Reactor <: AbstractReactor
  n_bar::AbstractSymbol
  T_bar::AbstractSymbol
  R_0::AbstractSymbol
  B_0::AbstractSymbol
  I_P::AbstractSymbol

  mode_scaling::Dict

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
  :rho_m => default_rho_m
)

function Reactor(; raw_kwargs...)
  cur_kwargs = Dict(raw_kwargs)
  cur_inputs = deepcopy(reactor_defaults)

  for cur_key in keys(cur_inputs)
    haskey(cur_kwargs, cur_key) || continue

    cur_inputs[cur_key] = cur_kwargs[cur_key]
  end

  cur_reactor = Reactor(
    reactor_symbols...,
    values(cur_inputs)...
  )

  cur_reactor
end
