__precompile__()

module FusionSystems

  using DataStructures
  using Parameters
  using SymEngine
  using Unitful
  using QuadGK

  include("abstracts.jl")
  include("defaults.jl")

  include("utils/index.jl")

  include("structs/index.jl")
  include("methods/index.jl")

  export Reactor

  function __init__()
    global const sigma_v_sym = symbols(:sigma_v)

    global const bootstrap_gamma_sym = symbols(:bootstrap_gamma)

    global const symbol_scaling = Dict(
      zip(
        scaling_keys,
        map(cur_key -> symbols("alpha_$cur_key"), scaling_keys)
      )
    )
  end

end
