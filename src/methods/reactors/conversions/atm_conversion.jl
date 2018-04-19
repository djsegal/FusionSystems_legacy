@symbol_func function atm_conversion(cur_reactor::AbstractReactor)
  cur_conversion = uconvert(
    Unitful.atm, 1e20 * Unitful.keV / Unitful.m^3
  ) / Unitful.atm

  cur_conversion
end
