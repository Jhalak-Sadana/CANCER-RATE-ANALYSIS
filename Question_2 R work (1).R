df <- read_xlsx("V:/Cancer.xlsx")
df1 = select(df, c(State,medIncome))
medians <- df1 %>% group_by(State) %>% 
      summarise(median_income=median(medIncome),
                       .groups = 'drop')
df1 <- medians  %>% as.data.frame()

quantile(df1$median_income, prob=c(.25,.5,.75), type=1) 

df1 <- 
  mutate(df1,
         IncomeLevel = case_when(
           median_income <= 41806 ~ "Very Low",
           median_income > 41806 & median_income <= 47723 ~ "Low",
           median_income > 47723  &  median_income <= 52623 ~ "High",
           median_income > 52623 ~ "Very High"
           )
  )
df <- inner_join(df , df1, by = "State")  

library("writexl")
write_xlsx(df, "V:\\final.xlsx")