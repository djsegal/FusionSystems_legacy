@symbol_func function perimeter(cur_reactor::AbstractReactor)
  cur_perimeter = 2.0

  cur_perimeter *= cur_reactor.pi

  cur_perimeter *= a(cur_reactor)

  cur_perimeter *= sqrt(
    _perimeter_shape_factor(cur_reactor)
  )

  cur_perimeter
end

function _perimeter_shape_factor(cur_reactor::AbstractReactor)
  cur_kappa = cur_reactor.kappa_95

  cur_delta = cur_reactor.delta_95

  cur_factor = 1.0

  cur_factor += 2 * cur_delta ^ 2

  cur_factor -= 1.2 * cur_delta ^ 3

  cur_factor *= cur_kappa ^ 2

  cur_factor += 1

  cur_factor /= 2

  cur_factor
end
