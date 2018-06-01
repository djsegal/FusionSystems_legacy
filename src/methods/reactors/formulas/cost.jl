function cost(cur_reactor::AbstractReactor)
  cur_cost = 1000.0

  cur_cost *= ( W_M(cur_reactor) / 30 )

  cur_cost /= ( f_duty(cur_reactor) * P_F(cur_reactor) )

  cur_cost
end
