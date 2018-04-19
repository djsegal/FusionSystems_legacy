mutable struct Sweep <: AbstractSweep
  T_bar_list::Vector{AbstractFloat}

  beta_reactors::Vector{AbstractReactor}
  kink_reactors::Vector{AbstractReactor}
  pcap_reactors::Vector{AbstractReactor}
end

function Sweep(cur_T_bar_list::Any)
  cur_sweep = Sweep(
    cur_T_bar_list, [], [], []
  )

  for cur_limit in keys(secondary_limits)
    cur_field_symbol = Symbol("$(cur_limit)_reactors")

    cur_reactor_list = getfield(cur_sweep, cur_field_symbol)

    for cur_T_bar in cur_sweep.T_bar_list
      push!(
        cur_reactor_list,
        solve!(Reactor(cur_T_bar), cur_limit)
      )
    end
  end

  cur_sweep
end
