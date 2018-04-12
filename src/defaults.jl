const n_bar_sym = symbols(:n_bar)
const T_bar_sym = symbols(:T_bar)

const R_0_sym = symbols(:R_0)
const B_0_sym = symbols(:B_0)

const I_P_sym = symbols(:I_P)

const sigma_v_sym = symbols(:sigma_v)

const bootstrap_gamma_sym = symbols(:bootstrap_gamma)

const default_Q = 39.86

const default_epsilon = 0.3226
const default_kappa_95 = 1.590
const default_delta_95 = 0.333

const default_nu_n = 1.00
const default_nu_T = 1.45

const default_f_D = 0.9

const default_Z_eff = 2.584

const default_A = 2.5

const default_l_i = 1.155

const default_rho_m = 0.6

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

const atm_conversion =
  uconvert(u"atm", 1e20u"keV/m^3") / 1u"atm"