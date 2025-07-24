# Analysis of Sleep Processes by using Personal Data from a Smartwatch for Detecting the Type of Biorhythm

## Overview

Some people suffer from sleep disorders due to confusion about their type of biorhythms. Running an A/B test using personal sleep data collected by a smartwatch can help identify the type of biorhythm (late, early, or middle) to prevent sleep deficiency. Moreover, the lack of understanding of the nature of biorhythm can lead to an unhealthy sleep attitude (incorrect time to go bad) and negatively affect the sleep process of partners or family as a consequence.

This analysis was conducted in response to a request to find out the cause of sleep disorders in one of the partners(she). The main problem is that one of the partners (he) prefers to go to bed late, which leads to sleep disorders in the other partner(she). It was noted that if the partners go to bed earlier, the sleep problems disappear. Therefore, it is not entirely clear whether his preference for late bedtime is related to habit or late biorhythm.
The A/B test showed that there are no signs of the late type of the biorhythm for him. It's a preference for a late bedtime.

### Question for the analysis
Question: The person used to go to bed late or does he have a late type of biorhythms?


### Practical task:
1. Collect data about sleep procecec from his personal smart watch
2. Diagnose data for the presence of late type of biorhythm:
-- Late to bed - wake up late
-- The average time of falling asleep between 01:00 and 03:00
-- Lack of early falling asleep time, up to 00:00

### Check the hypotheses:
##### Hypothesis 1
H1: The time of falling asleep affects the average duration of his sleep.
H0: The time of falling asleep does not affect the average duration of his sleep.
##### Hypothesis2
H1: The time of falling asleep affects the average time of his awakening.
H0: The time of falling asleep does not affect the average time of his awakening.

### Data

Data with the dynamics of sleep are taken from the account of his personal smartwatch. 
They are weekly average values. That is, one value corresponds to the average value of data collected in 7 days. The table contains 52 observations from August, 30, 2023 to September, 14, 2024.

### Variables used in the analysis:
1. «Avg Bedtime» - is the average time of falling asleep. Continuous variable. 
2. «AVBTK» is the average time of falling asleep. Factor variable, 2 levels: early (e) and late (l) going to bed. Early time of falling asleep (E) - until 00:00:00. Late (l) - after 00:00:00. Transformed from «Avg Bedtime».
3. «Avg Wake Time» - a dependent variable, is the average awakening time. Continuous variable. 
4. «Minutes» - a dependent variable, continuous variable, expressed a minute. Displays the duration of sleep in minutes. Transformed and variable «Avg Duration», average time of sleep.

## Analysis. 

### Descriptive statistics. 

#### Diagnose data for the presence of late type of biorhythm: Late to bed - got up late; The average time of falling asleep between 01:00 and 03:00; Lack of early falling asleep, up to 00:00

##### Avg Bedtime:
Average time- 00:04 AM
Minimum – 23:40 PM
Maximum – 00:47 AM
Median – 00:26 AM

##### Avg Wake Time:
Average time- 7:59:53 AM
Minimum – 7:13 AM
Maximum – 8:47 AM
Median – 8:01 AM

##### Minutes:
Average time- 451.31 min
Minimum – 347 min
Maximum – 500 min
Median – 455 min


### Independent T-Test (comparing two means, A/B test) for checking the Hypothesis 1.
##### H1: (μ minutes)E≠(µ minutes)L 
The time of falling asleep affects the average duration of his sleep. The sooner He falls asleep, the longer he sleeps. The later, the less sleeping.

ind.t.test<-t.test(Minutes ~ AVBTK, data = FilteredSleep)
Welch Two Sample t-test
data:  Minutes by AVBTK
t = 3.4203, df = 22.337, p-value = 0.002411
95 percent confidence interval:
           9.920385 40.412949
sample estimates: 
        mean in group E mean in group L 
         471.4444          446.2778 


![alt text](image.png)

### Independent T-Test (comparing two means, A/B test) for checking the Hypothesis 2. 
##### H0: (μ Avg Wake Time)E=(µ Avg Wake Time)L 
The time of falling asleep does not affect the average time of the awakening of his. There is no trend: Late fall asleep - got up late. He can wake up both before 8:00 AM in the morning, and later 8:00 AM. 

ind.t.test2<-t.test(`Avg Wake Time` ~ AVBTK, data = FilteredSleep)
ind.t.test2
Welch Two Sample t-test
data:  Avg Wake Time by AVBTK
t = -1.3092 secs, df = 13.379, p-value = 0.2125 secs
95 percent confidence interval:
   -1300.6507 secs   317.3173 secs
sample estimates:
 Time differences in secs 
 mean in group E mean in group L 
       28400.00          28891.67 


![alt text](image-3.png)

### Results
##### Diagnosis of the data revealed:
-- Late/early falling asleep - wake up at the same time in the morning
-- If the parthner (he) is falling asleep early, he sleeps longer (sleep deficiency/need for a long dream)
-- The time when his falls asleep is between 23:40 and 00:47
-- There are early periods of falling asleep in the data, until 00:00

### Conclusion
There were no signs of the late type of biorhythm. The parthner(he) belongs to the middle type. 
Sleep deficiency is detected.

### Recomandations

##### 1. To go to bed earlier.
This will help improve the quality of sleep of both partners and his sleep duration will be improved.

##### 2. Get up before 08:00 AM.
It can lead to the creation of a healthier habit of going to bed earlier.




