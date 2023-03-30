

#Question1

Ireland_Crime <- read.csv("IrelandCrime.csv", na = "")  #Loading dataset 
head(Ireland_Crime, 10) #showing first 10 rows from dataframe
#find missing values and encode it with NA
Ireland_Crime


#Question 2 


names(Ireland_Crime) #display column names of df
#displaying figures from 2015 to 2019

Ireland_Crime <- Ireland_Crime[,c(54:73)]
#renaming columns by index value
colnames(Ireland_Crime)[1] <- "Region" 
colnames(Ireland_Crime)[2] <- "Division"
colnames(Ireland_Crime)[3] <- "OffenceCode"
colnames(Ireland_Crime)[4] <- "Offence"
colnames(Ireland_Crime)[5] <- "OffenceType"
str(Ireland_Crime)

#Question 3 


Ireland_Crime$OffenceType[ Ireland_Crime$OffenceType == "ATTEMPTS/THREATS TO MURDER/ASSAULTS/HARASSMENTS AND RELATED OFFENCES"] <- "Murder/assault/harassment"
Ireland_Crime$OffenceType[ Ireland_Crime$OffenceType == "DANGEROUS OR NEGLIGENT ACTS" ] <- "Dangerous acts"
Ireland_Crime$OffenceType[ Ireland_Crime$OffenceType == "KIDNAPPING AND RELATED OFFENCES"] <- "Kidnapping"
Ireland_Crime$OffenceType[ Ireland_Crime$OffenceType == "ROBBERY/EXTORTION AND HIJACKING OFFENCES"] <- "Robbery"
Ireland_Crime$OffenceType[ Ireland_Crime$OffenceType == "THEFT AND RELATED OFFENCES"] <- "Theft"
Ireland_Crime$OffenceType[ Ireland_Crime$OffenceType == "FRAUD/DECEPTION AND RELATED OFFENCES"] <- "Fraud"
Ireland_Crime$OffenceType[ Ireland_Crime$OffenceType == "PUBLIC ORDER AND OTHER SOCIAL CODE OFFENCES"] <- "Public order"
Ireland_Crime$OffenceType[ Ireland_Crime$OffenceType == "OFFENCES AGAINST GOVERNMENT/ JUSTICE PROCEDURES AND ORGANISATION OF CRIME"] <- "Offences against government"

Ireland_Crime$OffenceType


nrow(Ireland_Crime$OffenceType == "Murder/assault/harassment")
nrow(Ireland_Crime$OffenceType == "Offences against government")

#Question 4
str(Ireland_Crime)
#CrimeSummary <- sum(complete.cases(Ireland_Crime$OffenceType))
#CrimeSummary <- colSums(Ireland_Crime[, c(4:9,11:12)], na.rm = TRUE)
CrimeSummary <- Summary(Ireland_Crime[, c(6:73)], na.rm = TRUE)


#Question 5
library(VIM)
missing_values <- aggr(Ireland_Crime,prop = FALSE,numbers = TRUE)
summary(missing_values)
matrixplot(Ireland_Crime)
#The data here is Missing Completely At Random (MCAR) – as missing offence data is 
#unrelated to any other observed or unobserved variable.

#Question 7
Donegal_crime <- subset(Ireland_Crime, Division == "DONEGAL" , select =c("Division"))
nrow(Donegal_crime)
#The number of record in new subset is 58 for Donegal_crime.
plot(Donegal_crime,type = 'o', col ='blue' )
