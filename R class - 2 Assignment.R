#########SunnyMa_Individual Predictive Analytics Assignment2.R #########################
###FirstName: Sunny (Jihyun) 
  #LastName_: Ma
  #ProfessorName:Emily Ko

########### Assignment Mission #################
#Conduct at least ONE exploratory data analysis for the FOUR types of EDA 
#(BOTH for categorical AND quantitative; this means you should create EIGHT exploratory data analyses) 
#using the ‘marketing_campaign.csv’ data set AND explain at least ONE interesting finding from the analysis.
#•Refer to Appendix below to differentiate a categorical variable and a quantitative variable.
#•Appendix contains definitions of the variables in the ‘marketing_campaign.csv’ data set.



     ######Appendix: Variables

#• Dt_Customer (Date) - date of customer’s enrolment with the company

#• ID: Customer unique identifier (this is a customer unique identifier and thus shouldn’t be used for any analysis)
#• Year_Birth:                   The customer birth year
#• Education (Categorical):       Education levels
#• Marital_Status (Categorical) - customer’s marital status
#• AcceptedCmp1 (Categorical) - 1 if customer accepted the offer in the 1st campaign, 0 otherwise
#• AcceptedCmp2 (Categorical) - 1 if customer accepted the offer in the 2nd campaign, 0 otherwise
#• AcceptedCmp3 (Categorical) - 1 if customer accepted the offer in the 3rd campaign, 0 otherwise
#• AcceptedCmp4 (Categorical) - 1 if customer accepted the offer in the 4th campaign, 0 otherwise
#• AcceptedCmp5 -(Categorical)  1 if customer accepted the offer in the 5th campaign, 0 otherwise
#• Complain (Categorical)     - 1 if customer complained in the last 2 years
#• Response (Categorical)     - 1 if customer accepted the offer in the last campaign, 0 otherwise


#• Kidhome (Quantitative or Categorical)  - number of small children in customer’s household
#• Teenhome (Quantitative or Categorical) - number of teenagers in customer’s household

#• Income (Quantitative)-             customer’s yearly household income
#• Recency (Quantitative) -           number of days since the last purchase
#• MntWines (Quantitative) -          amount spent on wine products in the last 2 years
#• MntFruits (Quantitative)         - amount spent on fruits products in the last 2 years
#• MntMeatProducts (Quantitative)   - amount spent on meat products in the last 2 years
#• MntFishProducts (Quantitative)   - amount spent on fish products in the last 2 years
#• MntSweetProducts (Quantitative)  - amount spent on sweet products in the last 2 years
#• MntGoldProds (Quantitative)      - amount spent on gold products in the last 2 years
#• NumDealsPurchases (Quantitative) - number of purchases made with discount
#• NumCatalogPurchases (Quantitative)-number of purchases made using catalogue
#• NumStorePurchases (Quantitative) - number of purchases made directly in stores
#• NumWebPurchases (Quantitative)   - number of purchases made through company’s web site
#• NumWebVisitsMonth (Quantitative) - number of visits to company’s web site in the last month



#<START>

###1. Importing ‘marketing_campaign.csv’ dataset using 'read.csv(file="path")

library(ggplot2)
marketing <- read.csv(file="C:/Users/majihyun/Desktop/Predictive Class Material/10032023 R assignment 2/marketing_campaign.csv")
marketing 
#print the dataset in R

#The dataset has lots of columns/variables. 

####2.Univariate 
###### 2.1 Univariate Non-graphical Categorical Variable EDA 
                                                 #Qeustion: I followed this code: data <- as.data.frame(ggplot2::data), why didnt it work?

##2.1.1. Prop.table
str(marketing) #To see variables structure of the 'marketing' dataset 
Edu <- table(marketing$Education) #one categorical variable 
Mat <- table(marketing$Marital_Status)

prop.table(Edu)
prop.table(Mat)

Edu
Mat


###### 2.2 Univariate Graphical Categorical Variable EDA 
##2.2.1. Histogram
ggplot(marketing, aes(x = factor(Education))) +
  geom_bar() # Most basic bar chart

#Result: on the X axis, it shows 'factor(Education) without the title of the histogram.
#aes(x= x축에 들어갈 이름)

ggplot(marketing, aes(x = factor(Marital_Status))) +
  geom_bar() # Most basic bar chart


##2.2.1. Histogram with the number of values above the histogram bars.
library(ggplot2)

# Adding 'geom_test' and 'labs'
education_plot <- ggplot(marketing, aes(x = factor(Education))) +
  geom_bar() +
  geom_text(stat = 'count', aes(label = ..count..), vjust = -0.1) +  # Add count labels above bars
  labs(title = "Education Levels Distribution", x = "Education", y = "Count")

print(education_plot)


marital_plot <- ggplot(marketing, aes(x = factor(Marital_Status))) +
  geom_bar() +
  geom_text(stat = 'count', aes(label = ..count..), vjust = -0.1) +  # Add count labels above bars
  labs(title = "Marital Status Distribution", x = "Marital Status", y = "Count")

print(marital_plot)





##2.2.2. Pie Chart
pie(Edu,labels = Edu,main = "Education")


##2.2.2. Pie Chart with name and the number of values in Education
name_edu <- names(Edu)
eduu <- paste(name_edu," (", Edu, ")", sep = "")  #without, in (", Edu, "), it'd be an error.
pie(Edu, labels = eduu, main = "Education")


##2.3 Univariate non-graphical EDA: quantitative data: 'summary()'and 'describe()'

summary(marketing$Income)
library(psych)
describe(marketing$Income)


###2.4 Univariate graphical EDA: quantitative data: 

#2.4.1.Univariate graphical EDA: quantitative data: histogram

income

hist(marketing$Income) #If i use this=> i can't udnerstand any info.




hist(marketing$Income, 
     main = "Income Distribution", 
     xlab = "Income",
     ylab = "Frequency",
     col = "lightblue")  # Adjust the color if needed


#####2.4.2.Univariate graphical EDA: quantitative data: boxplot

boxplot(income)

# Create a boxplot for the "Income" variable
boxplot(marketing$Income, 
        main = "Income Distribution",
        ylab = "Income",
        col = "lightblue")



##3. Multivariate

##3.1. ## Multivariate Non-graphical EDA: cross-tabulation for Categorical

table(marketing$Education, marketing$Marital_Status)



##3.2 ##Multivariate non-graphical EDA: quantitative variables 
#Covariance and correlation

print(cov(marketing$Recency,marketing$Income))
print(cor(marketing$Recency,marketing$Income))


#Insight: Income and the number of purchase don't have a relationship.

print(cov(marketing$NumDealsPurchases,marketing$NumWebPurchases))
print(cor(marketing$NumDealsPurchases,marketing$NumWebPurchases)) #positive

#insight: Discounts impacts on the number of purchase through the website.




###3.3 Multivariate graphical categorical variables: bar plots

#Purpose of the analysis: How does Education level impact their marital status.
#Result: Graduation people are accounting for all the numbers. but it is not enough to know if there's a relationship.

table(marketing$Marital_Status)

library(dplyr)

# Filter and select the desired categories
result <- marketing %>%
  filter(Marital_Status %in% c("Divorced", "Married", "Single")) %>%
  select(Marital_Status, Education)

# View the result
View(result)



 #If I select use only "Divorced, Married,Single"
#the total number would be changed to 2126 to 1560. 


table(result)
daa <- table(result)
categories <- rownames(daa)  # Get the row names as categories        
        
# Create the barplot without the legend
barplot(daa, main = "Relationship between Education and Marriage",
        xlab = "Education", col = c("darkblue","red", "darkgreen"), beside = TRUE)
        
        # Add the legend to the right side with a smaller size
legend("topright", legend = categories, fill = c("darkblue","red", "darkgreen"), cex = 0.5)
        

#Insight: 1. A lot of people has graduation education level.
# Most of them are married. Surprisingly, people with a Basic education level
#their gap between married and divorced status isn't that huge.
#I thought higher education level people will stay in single, which is not on the result.



####I wanted to know if there's a relationship between Education and Marriage.
##It seems hard to conclude there's a correlation.


## 3.4 Multivariate graphical Quantitative variables

## Multivariate graphical EDA: quantitative variables
marketing #marketing data

plot(marketing$Income, marketing$Kidhome)

#result: lower income has a tendency to have more kids




