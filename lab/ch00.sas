/* Calculate distribution probabilities and quantiles */
PROC IML;  
  /* For finding pvalues */
  p1 = 1-cdf('NORMAL',2);            /* P(Z       >  2 ) */  
  p2 = 1-cdf('T',3,5);               /* P(t_5     >  3 ) */  
  p3 = 1-cdf('T',3,5)+cdf('T',-3,5); /* P(t_5     > |3|) */ 
  p4 = 1-cdf('F',5,25,26);           /* P(F_25,26 >  5 ) */  

  /* For constructing confidence intervals */ 
  q1 = quantile('NORMAL',.975);      /* 0.975=P(Z < q1)     */  
  q2 = quantile('T',.975,5);         /* 0.975=P(t_5 < q2)   */  
  PRINT p1, p2, p3, p4, q1, q2; 
  QUIT; 


