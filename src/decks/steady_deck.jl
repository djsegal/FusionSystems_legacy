function steady_deck(cur_T_bar::AbstractSymbol)
  BaseReactor(
    T_bar = cur_T_bar,
    is_pulsed = false,

    H = 1.0,
    Q = 25.0,
    epsilon = 0.25,
    kappa_95 = 1.8,
    delta_95 = 0.4,
    nu_n = 0.4,
    nu_T = 1.1,
    nu_n_offset= 0.0,
    nu_T_offset= 0.0,
    Z_eff = 1.5,
    f_D = 0.9,
    A = 2.5,
    N_G = 0.9,
    eta_CD_sat = 0.35,
    T_CD_sat = 30.0,

    eta_T = 0.352,

    max_beta_N = 0.026,
    max_q_95 = 10.0,
    max_P_E = 2500.0
  )
end
