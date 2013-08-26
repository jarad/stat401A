---
layout: page
title: Lab 1
tagline: 
---
{% include JB/setup %}

1. Sign up for [CyBox](https://iastate.box.com/).
    - If you do not see a `401A' folder, please let me know.
2. Download the [Sleuth Data Sets](http://www.science.oregonstate.edu/~schafer/Sleuth/files/sleuth3csv.zip) and extract to CyFiles U:/401A/sleuth3csv.
3. Use the SAS or R instructions below to check and make sure you have downloaded to the correct location.



SAS instructions
---
1. Start SAS 9.3.
2. Paste the following into the editor window.

    DATA case0101;

      INFILE 'U:/401A/sleuth3csv/case0101.csv' DSD FIRSTOBS=2;

      INPUT score treatment $;
    
    PROC MEANS DATA=case0101;

      VAR score;

      BY treatment;

      RUN;

3. Click on the Run button (looks like a person running).

R instructions
---

1. Start R.
2. File > New Script.
3. Paste the following into the editor window.

    case0101 = read.csv("U:401A/sleuth3csv/case0101.csv")

    names(case0101) = tolower(names(case0101))

    by(case0101$score, case0101$treatment, summary)

4. Edit > Run all.  




