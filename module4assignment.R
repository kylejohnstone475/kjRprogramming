install.packages("ggplot2")
library("ggplot2")

# variables
frequency <- c(0.6,0.3,0.4,0.4,0.2,0.6,0.3,0.4,0.9,0.2)
bloodp <- c(103,87,32,42,59,109,78,205,135,176)
first <- c(1,1,1,1,0,0,0,0,NA,1)
second <- c(0,0,1,1,0,0,1,1,1,1)
finalDecision <- c(0,1,0,1,0,1,0,1,1,1)

# dataframe
hospitalData <- data.frame(frequency, bloodp, first, second, finalDecision)
hospitalData

# boxplot
hospitalData2 <- hospitalData
hospitalData2$finalDecision <- as.factor(hospitalData$finalDecision)
ggplot(hospitalData2, aes(x=frequency, y=bloodp, group=finalDecision, fill=finalDecision)) + 
  geom_boxplot() + labs(title="Frequency of Visits and Blood Pressure Relative to Severity
                        to Final Medical Decison",
                        x = "Frequency of Visits",
                        y= "Blood Pressure") +
  scale_fill_manual(values = c("0"= "lightblue", "1"= "orange"), 
  labels = c("low", "high")) + theme_light()

#histograms
ggplot(hospitalData, aes(x=bloodp)) + geom_histogram(binwidth=50, color = "black", 
  fill="lightblue") + theme_light() + labs(title="Blood Pressure",
                                           x="Blood Pressure",
                                           y="Count")
ggplot(hospitalData, aes(x=finalDecision)) + geom_histogram(binwidth=1, color = "black", 
  fill="lightblue") + theme_light() + labs(title="Medical Decision",
                                           x="Medical Decision",
                                           y="Count")
ggplot(hospitalData, aes(x=frequency)) + geom_histogram(binwidth=0.1, color = "black", 
  fill="lightblue") + theme_light() + labs(title="Frequency of Visits",
                                           x="Frequency",
                                           y="Count")

 
 
