mutable struct Sweep <: AbstractSweep
  T_bar_list::Vector{AbstractFloat}

  deck::Union{Void, Symbol}

  beta_reactors::Vector{AbstractReactor}
  kink_reactors::Vector{AbstractReactor}
  pcap_reactors::Vector{AbstractReactor}
end

function Sweep(cur_T_bar_list::Any; cur_kwargs...)
  cur_dict = Dict(cur_kwargs)

  cur_deck = haskey(cur_dict, :deck) ?
    cur_dict[:deck] : nothing

  cur_sweep = Sweep(
    cur_T_bar_list, cur_deck,
    [], [], []
  )

  for cur_limit in keys(secondary_limits)
    cur_field_symbol = Symbol("$(cur_limit)_reactors")

    cur_reactor_list = getfield(cur_sweep, cur_field_symbol)

    for cur_T_bar in cur_sweep.T_bar_list
      cur_reactor = Reactor(cur_T_bar, cur_dict)

      push!(
        cur_reactor_list,
        solve!(cur_reactor, cur_limit)
      )
    end
  end

  cur_sweep
end
