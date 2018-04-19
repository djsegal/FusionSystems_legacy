function get_limit_vars(cur_sweep::AbstractSweep, cur_limit::Symbol, cur_field::Symbol)
  cur_field_symbol = Symbol("$(cur_limit)_reactors")

  cur_reactor_list = getfield(cur_sweep, cur_field_symbol)

  cur_values = []

  for cur_reactor in cur_reactor_list
    cur_reactor.is_good || continue

    push!(
      cur_values,
      getfield(cur_reactor, cur_field)
    )
  end

  cur_values
end
