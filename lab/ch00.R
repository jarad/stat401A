# For calculative pvalues
(p1 = 1-pnorm(2))         # P(Z > 2)
(p2 = 1-pt(3,5))          # P(t_5 > 3)
(p3 = 1-pt(3,5)+pt(-3,5)) # P(t_5 > |3|)
(p4 = 1-pf(5,25,26))      # P(F_25,26 > 5)

# For constructing confidence intervals
(q1 = qnorm(.975))        # 0.975 = P(Z<q1)
(q2 = qt(.975,5))         # 0.975 = P(t_5 > q2)

