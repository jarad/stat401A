/* Displays from Chapter 5 */
DATA mice;  
  INFILE 'U:\401A\Sleuth Datasets\CSV\case0501.csv' DELIMITER=',' FIRSTOBS=2;  
  INPUT lifetime diet $;  
  RUN;

PROC PRINT DATA=mice (OBS=10); RUN;

PROC BOXPLOT DATA=mice;
  PLOT lifetime*diet;
  TITLE 'Compare to Display 5.1';
  RUN;

PROC MEANS DATA=mice MAXDEC=1 N MIN MAX MEAN STDDEV CLM;  
  CLASS diet;   
  VAR lifetime;  
  TITLE 'Compare to Display 5.2';
  RUN;


DATA spock;
  INFILE 'U:\401A\Sleuth Datasets\CSV\case0502.csv' DELIMITER=',' FIRSTOBS=2;
  INPUT percent judge $;
  RUN;

PROC PRINT DATA=spock (OBS=10); RUN;

PROC BOXPLOT DATA=spock;
  PLOT percent*judge;
  TITLE 'Compare to Display 5.5';
  RUN;

PROC ANOVA DATA=spock;
  CLASS judge;
  MODEL percent = judge;
  TITLE 'Compare to Display 5.10';
  RUN;

PROC GLM DATA=spock;
  CLASS judge;
  MODEL percent=judge;
  RUN;

DATA spock; SET spock;
  others = 1;
  IF judge="Spock's" THEN others=0;
  RUN;

PROC PRINT DATA=spock (OBS=15); RUN;

PROC ANOVA DATA=spock;
  CLASS judge others;
  MODEL percent = others judge(others);
  TITLE 'Compare to Display 5.12';
  RUN;

