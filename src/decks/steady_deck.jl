function steady_deck()
  Reactor(
    is_pulsed = false,

    H = 1.0,
    Q = 25.0,
    epsilon = 0.25,
    kappa_95 = 1.8,
    delta_95 = 0.4,
    nu_n = 0.4,
    nu_T = 1.1,
    Z_eff = 1.5,
    f_D = 0.9,
    A = 2.5,
    N_G = 0.9,
    rho_m = 0.7,
    eta_CD = 0.2359,

    eta_T = 0.352,

    max_beta_N = 0.026,
    max_q_95 = 10.0,
    max_P_E = 2500.0
  )
end
