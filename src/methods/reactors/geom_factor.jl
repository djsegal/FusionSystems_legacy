@symbol_func function geom_factor(cur_reactor::AbstractReactor)
  cur_delta = cur_reactor.delta_95

  cur_factor = 9.0

  cur_factor -= 2 * cur_delta

  cur_factor -= _x_aa_of_pi(cur_delta)

  cur_factor /= 8

  cur_factor
end

function _x_aa_of_pi(cur_delta::AbstractSymbol)
  cur_x_aa_of_pi = 1.0

  cur_x_aa_of_pi -= cur_delta ^ 2

  cur_x_aa_of_pi *= 0.3

  cur_x_aa_of_pi
end
