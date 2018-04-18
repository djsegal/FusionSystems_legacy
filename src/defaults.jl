const sigma_v_sym = symbols(:sigma_v)

const bootstrap_gamma_sym = symbols(:bootstrap_gamma)

const integral_offset = 1e-8

const integral_zero = 0.0 + integral_offset
const integral_one = 1.0 - integral_offset

const h_mode_scaling = Dict(
  :constant => 0.145,
  :I => 0.93,
  :R => 1.39,
  :a => 0.58,
  :kappa => 0.78,
  :n => 0.41,
  :B => 0.15,
  :A => 0.19,
  :P => 0.69
)

const atm_conversion = uconvert(
  Unitful.atm, 1e20 * Unitful.keV / Unitful.m^3
) / Unitful.atm

const wb_conversion = uconvert(
  Unitful.Wb, Unitful.µ0 * Unitful.MA * Unitful.m
) / Unitful.Wb

const scaling_keys = keys(h_mode_scaling)

const symbol_scaling = Dict(
  zip(
    scaling_keys,
    map(cur_key -> symbols("alpha_$cur_key"), scaling_keys)
  )
)

const reduced_mass = 1.124656e6

const gamov_const = 34.3827

const bosch_hale_coeffs = [
  +1.17302e-9,
  +1.51361e-2,
  +7.51886e-2,
  +4.60643e-3,
  +1.35000e-2,
  -1.06750e-4,
  +1.36600e-5
]
