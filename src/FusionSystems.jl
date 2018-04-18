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

end
