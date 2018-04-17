__precompile__()

module FusionSystems

  using DataStructures
  using Unitful
  using QuadGK
  using SymEngine

  include("abstracts.jl")
  include("defaults.jl")

  include("utils/index.jl")

  include("structs/index.jl")
  include("methods/index.jl")

  export Reactor

end
