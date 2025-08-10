# Visualizing Conditional Probability

This code is designed by inputting the probabilities of events at each level, the visualization of the target conditional probability event is depicted through an annulus chart.

## Packages
### Install the `R` package `YanXu_cycle` from [GitHub](https://github.com/yxxzxxy/YZYBOX)
```R
# install.packages('devtools')
devtools::install_github("yxxzxxy/YZYBOX")
```

## Example
This is a basic example which shows you how to use the functions in this package to visualizing conditional probability

```R
# Data 

{
  p_A1=1/3
  p_A2=1/3
  p_A3=1/3
  
  p_B1_givenA1=3/10
  p_B1_givenA2=7/15
  p_B1_givenA3=9/25 
  
  p_B2_givenA1B1 = 2/9
  p_B2_givenA2B1 = 6/14
  p_B2_givenA3B1 = 8/24
  
  p1 = p_A1*p_B1_givenA1*p_B2_givenA1B1 #P(A1B1B2)
  p2 = p_A1*p_B1_givenA1 - p1 #P(A1B1NB2)
  p3 = p_A1*(1-p_B1_givenA1)*p_B2_givenA1B1 #P(A1NB1B2)
  p4 = p_A1 - p_A1*p_B1_givenA1 - p3 #P(A1NB1NB2)
  
  p5 = p_A2*p_B1_givenA2*p_B2_givenA2B1 #P(A2B1B2)
  p6 = p_A2*p_B1_givenA1 - p5 #P(A2B1NB2)
  p7 = p_A2*(1-p_B1_givenA2)*p_B2_givenA2B1 #P(A2NB1B2)
  p8 = p_A2 - p_A2*p_B1_givenA1 - p7 #P(A2NB1NB2)
  
  p9 = p_A3*p_B1_givenA3*p_B2_givenA3B1 #P(A3B1B2)
  p10 = p_A3*p_B1_givenA1 - p9 #P(A2B1NB2)
  p11 = p_A3*(1-p_B1_givenA3)*p_B2_givenA3B1 #P(A1NB1B2)
  p12 = p_A3 - p_A3*p_B1_givenA1 - p11
}

data <- data.frame(category = c("A[1]~B[1]~B[2]", "A[1]~B[1]~bar(B)[2]",
                                "A[1]~bar(B)[1]~B[2]", "A[1]~bar(B)[1]~bar(B)[2]",
                                "A[2]~B[1]~B[2]", "A[2]~B[1]~bar(B)[2]",
                                "A[2]~bar(B)[1]~B[2]", "A[2]~bar(B)[1]~bar(B)[2]",
                                "A[3]~B[1]~B[2]", "A[3]~B[1]~bar(B)[2]",
                                "A[3]~bar(B)[1]~B[2]", "A[3]~bar(B)[1]~bar(B)[2]"),
                   fraction = c(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12))

#The innermost annulus representing the sought conditional probability.
Candidate = YanXu_cycle(data, color_ca1 = c("B\\[2\\]"), color_ca2 = c("B\\[1\\]~B\\[2\\]"), 
                 max_location = 6, min_location = 4.5)


```
