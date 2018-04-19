function wb_conversion(cur_reactor::AbstractReactor)
  cur_reactor.is_symbolic && return symbols("mu_0")

  cur_conversion = uconvert(
    Unitful.Wb, Unitful.µ0 * Unitful.MA * Unitful.m
  ) / Unitful.Wb

  cur_conversion
end
