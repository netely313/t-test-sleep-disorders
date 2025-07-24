# Analysis of Sleep Patterns Using Personal Data from a Smartwatch for Detecting Biorhythm Type

## Overview

Some people suffer from sleep disorders due to confusion about their biorhythm type. Running an A/B test using personal sleep data collected by a smartwatch can help identify the biorhythm type (late, early, or middle) to prevent sleep deficiency. Moreover, a lack of understanding of biorhythm nature can lead to unhealthy sleep habits (incorrect bedtime) and negatively affect the sleep patterns of partners or family members as a consequence.

This analysis was conducted in response to a request to find out the cause of sleep disorders in one of the partners (she). The main problem is that one partner (he) prefers to go to bed late, which leads to sleep disorders in the other partner (she). It was noted that if the partners go to bed earlier, the sleep problems disappear. Therefore, it is not entirely clear whether his preference for late bedtime is related to habit or a late biorhythm type.

The A/B test showed that there are no signs of a late biorhythm type for him. It's a preference for late bedtime rather than a biological predisposition.

### Research Question
Question: Does the person habitually go to bed late, or does he have a late biorhythm type?

### Practical Tasks:
1. Collect sleep process data from his personal smartwatch
2. Diagnose data for the presence of late biorhythm type:
   - Late to bed - wake up late
   - Average time of falling asleep between 01:00 and 03:00
   - Lack of early falling asleep times (before 00:00)

### Hypotheses Testing:
##### Hypothesis 1
H1: The time of falling asleep affects the average duration of his sleep.
H0: The time of falling asleep does not affect the average duration of his sleep.

##### Hypothesis 2
H1: The time of falling asleep affects the average time of his awakening.
H0: The time of falling asleep does not affect the average time of his awakening.

### Data

Sleep dynamics data were taken from his personal smartwatch account. These are weekly average values, meaning one value corresponds to the average data collected over 7 days. The table contains 52 observations from August 30, 2023, to September 14, 2024.

### Variables Used in the Analysis:
1. **"Avg Bedtime"** - the average time of falling asleep. Continuous variable.
2. **"AVBTK"** - the average time of falling asleep. Factor variable with 2 levels: early (e) and late (l) bedtime. Early bedtime (E) - before 00:00:00. Late (L) - after 00:00:00. Transformed from "Avg Bedtime."
3. **"Avg Wake Time"** - a dependent variable representing the average awakening time. Continuous variable.
4. **"Minutes"** - a dependent variable, continuous variable expressed in minutes. Displays sleep duration in minutes. Transformed from the "Avg Duration" variable, which represents average sleep time.

## Analysis

### Descriptive Statistics

#### Diagnosis of data for the presence of late biorhythm type: Late to bed - wake up late; Average time of falling asleep between 01:00 and 03:00; Lack of early bedtime (before 00:00)

##### Avg Bedtime:
- Average time: 00:04 AM
- Minimum: 23:40 PM
- Maximum: 00:47 AM
- Median: 00:26 AM

##### Avg Wake Time:
- Average time: 7:59:53 AM
- Minimum: 7:13 AM
- Maximum: 8:47 AM
- Median: 8:01 AM

##### Minutes (Sleep Duration):
- Average: 451.31 minutes
- Minimum: 347 minutes
- Maximum: 500 minutes
- Median: 455 minutes

### Independent T-Test (A/B test) for Hypothesis 1
##### H1: (μ minutes)E ≠ (μ minutes)L
The time of falling asleep affects the average duration of his sleep. The earlier he falls asleep, the longer he sleeps. The later he falls asleep, the less he sleeps.

```
ind.t.test <- t.test(Minutes ~ AVBTK, data = FilteredSleep)
Welch Two Sample t-test
data: Minutes by AVBTK
t = 3.4203, df = 22.337, p-value = 0.002411
95 percent confidence interval:
    9.920385 40.412949
sample estimates:
    mean in group E mean in group L
         471.4444          446.2778
```

### Independent T-Test (A/B test) for Hypothesis 2
##### H0: (μ Avg Wake Time)E = (μ Avg Wake Time)L
The time of falling asleep does not affect the average awakening time. There is no trend of "fall asleep late - wake up late." He can wake up both before and after 8:00 AM regardless of bedtime.

```
ind.t.test2 <- t.test(`Avg Wake Time` ~ AVBTK, data = FilteredSleep)
ind.t.test2
Welch Two Sample t-test
data: Avg Wake Time by AVBTK
t = -1.3092, df = 13.379, p-value = 0.2125
95 percent confidence interval:
    -1300.6507   317.3173
sample estimates:
Time differences in secs
mean in group E mean in group L
      28400.00         28891.67
```

### Results
##### Data diagnosis revealed:
- Late/early falling asleep - wake up at the same time in the morning
- If the partner (he) falls asleep early, he sleeps longer (indicating sleep deficiency/need for longer sleep)
- His bedtime ranges between 23:40 and 00:47
- There are early bedtime periods in the data (before 00:00)

### Conclusion
There were no signs of a late biorhythm type. The partner (he) belongs to the middle biorhythm type. Sleep deficiency was detected.

### Recommendations

##### 1. Go to bed earlier
This will help improve sleep quality for both partners, and his sleep duration will be improved.

##### 2. Wake up before 08:00 AM
This can lead to the creation of healthier habits and encourage going to bed earlier.