function default_deck(cur_T_bar::AbstractSymbol)
  BaseReactor(
    T_bar = cur_T_bar,
    H = 1.1,
    Q = 39.86,
    epsilon = 0.3226,
    kappa_95 = 1.590,
    delta_95 = 0.333,
    nu_n = 0.27,
    nu_T = 1.094,
    nu_n_offset = 0.73,
    nu_T_offset = 0.356,
    Z_eff = 2.584,
    f_D = 0.7753,
    A = 2.735,
    l_i = 1.155,
    N_G = 1.2,
    eta_CD_sat = 0.35,
    T_CD_sat = 30.0,
    eta_T = 0.3531,
    tau_FT = 7273.0,
    C_saw = 1.0,
    C_ejima = 0.3,
    B_OH = 12.77,
    R_OH = 2.483,
    dR_OH = 0.8181,
    max_beta_N = 0.02591,
    max_q_95 = 3.247,
    max_P_E = 1000.0,
    max_P_W = 2.5,
    max_q_DV = 10.0
  )
end
