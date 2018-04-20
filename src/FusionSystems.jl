__precompile__()

module FusionSystems

  using DataStructures
  using Parameters
  using SymEngine
  using Unitful
  using QuadGK
  using Roots

  include("abstracts.jl")
  include("defaults.jl")

  include("utils/index.jl")

  include("structs/index.jl")
  include("methods/index.jl")

  include("decks/index.jl")

  export Reactor

  function __init__()
    global const rho_sym = symbols(:rho)

    global const bootstrap_gamma_sym = symbols(:bootstrap_gamma)

    global const symbol_scaling = Dict(
      zip(
        scaling_keys,
        map(cur_key -> symbols("alpha_$cur_key"), scaling_keys)
      )
    )
  end

end
