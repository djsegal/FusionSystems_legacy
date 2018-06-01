mutable struct Sweep <: AbstractSweep
  T_bar_list::Vector{AbstractFloat}

  deck::Union{Void, Symbol}

  beta_reactors::Vector{AbstractReactor}
  kink_reactors::Vector{AbstractReactor}
  pcap_reactors::Vector{AbstractReactor}
  wall_reactors::Vector{AbstractReactor}
  heat_reactors::Vector{AbstractReactor}

  main_reactors::Vector{AbstractReactor}
  main_limits::Vector{Symbol}
end

function Sweep(cur_T_bar_list::Any; cur_kwargs...)
  cur_dict = Dict()

  merge!(cur_dict, Dict(cur_kwargs))

  cur_deck = haskey(cur_dict, :deck) ?
    cur_dict[:deck] : nothing

  cur_sweep = Sweep(
    cur_T_bar_list, cur_deck,
    [], [], [], [], [], [], []
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

  cur_dict[:is_solved] = true
  cur_dict[:is_good] = false

  ignored_limits = [:pcap, :heat]

  for (cur_index, cur_T_bar) in enumerate(cur_sweep.T_bar_list)
    has_valid_reactor = false

    for cur_limit_sym in keys(secondary_limits)
      in(cur_limit_sym, ignored_limits) && continue

      cur_field_symbol = Symbol("$(cur_limit_sym)_reactors")

      cur_reactor_list = getfield(cur_sweep, cur_field_symbol)

      cur_reactor = cur_reactor_list[cur_index]

      cur_reactor.is_good || continue

      is_main_limit = true

      for (cur_sub_limit_sym, cur_sub_limit_param) in secondary_params
        in(cur_sub_limit_sym, ignored_limits) && continue

        cur_norm_symbol = Symbol("norm_$(cur_sub_limit_param)")

        cur_norm_value = getfield(cur_reactor, cur_norm_symbol)

        cur_norm_value <= 1.001  && continue

        is_main_limit = false
        break
      end

      is_main_limit || continue

      has_valid_reactor = true

      push!(cur_sweep.main_limits, cur_limit_sym)
      push!(cur_sweep.main_reactors, cur_reactor)

      break
    end

    has_valid_reactor && continue

    push!(cur_sweep.main_limits, :none)
    push!(cur_sweep.main_reactors, NanReactor(cur_T_bar, cur_dict))
  end

  cur_sweep
end
