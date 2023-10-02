#---
#title: "Exploratoy analysis and data manipulation"
#author: "Emily Ko"
#output: html_document
#---
## Univariate non-graphical EDA: categorical data
mpg <- as.data.frame(ggplot2::mpg)
str(mpg)
mTable <- table(mpg$manufacturer) #one variable: manufacturer
cTable <- table(mpg$class)

prop.table(mTable)
prop.table(cTable)

## Univariate non-graphical EDA: quantitative data
summary(mpg$displ)
library(psych)
describe(mpg$displ)

## Univariate graphical EDA: categorical data: histogram
library(ggplot2)
ggplot(mpg, aes(x = factor(cyl))) +
  geom_bar() # Most basic bar chart

ggplot(mpg, aes(x = factor(manufacturer))) +
  geom_bar() # Most basic bar chart

ggplot(mpg, aes(x = factor(manufacturer))) + geom_bar()
#이렇게 한칸 안내리고도 똑같이나옴.

## Univariate graphical EDA: categorical data: Pie chart
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")

#pie에는 slices는 그냥값, labels = 해줄 벡터이름, main ='차트이름) 이런갑다.
 # 값, 레이블, 메인제목 이렇겐갑다.

#혼자하는 응용놀이~
sales <- c(10,20,39,40)
fruits <- c("banana","mango","berry","lemon")
pie(sales, fruits, main = "Fruits Sales")

#labels= fruits 안했는데도, 레이블 안붙여도 그냥 레이블 자리라서 나오나봄

# ## Univariate graphical EDA: categorical data: Pie Chart with Percentages
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pct <- round(slices/sum(slices)*100)  #pct로 이 나눈 퍼센트 숫자만 걸어놓음
#the line of code calculates the percentage contribution of each element 
#in the slices vector to the total sum and stores these percentages in the 'pct' vector.
lbls <- paste(lbls, pct) # add percents to labels// 기존 lbls에 pct벡터를 옆에 붙일거야
#즉, 이 라인은 US옆에 나눈 퍼센트 숫자가 붙게하는것이고
lbls <- paste(lbls,"%",sep="") # ad % to labels
#이 라인은 그 옆으로 다시 리얼 %를 붙이는데, 연속하는거에 "" 즉, 띄우기가 없을거다.
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Countries")

pie(slices,labels = lbls, col=rainbow(lbls),
    main="Pie Chart of Countries")   #d이렇게 length 없애니까 오류뜸.


# 퍼센트없이 숫자만 나오는 경우
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Countries")

# ## Univariate graphical EDA: categorical data: Pie Chart with Percentages
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Countries")





## Univariate graphical EDA: quantitative data: histogram
# Create an 'eda1' data vector
eda1 <- c(3,5,4,9,3,5,3,7,6,4,8,5,1,4,5,4,3,4,1,3,5,5,5,7,1,5,6,2,1,
          7,5,9,1,2,1,5,3,3,3,5,4,6,7,3)

hist(eda1)

# Different numbers of bins
eda2 <- c(4.12,7.05,1.31,6.64,3.46,4.88,7.56,7.25,1.11,4.19,10.72,-0.95,0.29,3.05,0.64,2.83,2.41,4.97,7,5.8,11.73,
          1.94,7.99,3.84,4.87,3.13,2.17,7.87,4.52,7.32,3.3,1.79,8.38,0.42,5.28,6.94,3.55,6.61,5.44,7.74,12.71,13.29,
          12.29,12.58,10.63,15.53,18.28,13.32,10.06,20.4,11.12,12.61,4.97,7.96,13.27,12.01,13.79,15.04,13.88,15.51,
          11.66,16.23,13.58,13.53,11.4,11.86,13.68,15.53,9.69,9.06,14.65,7.71,15.45,6.77,15.72,15.15,7.59,14.7,12.94,10.01)

hist(eda2)
hist(eda2, breaks = 5)
hist(eda2, breaks = 3) #히스토그램 바 간격이 더 커짐. 즉, 나누는개수가 더 작아서 더 넓어짐

## Univariate graphical EDA: quantitative data: boxplot
# Create an 'eda1' data vector
eda1 <- c(3,5,4,9,3,5,3,7,6,4,8,5,1,4,5,4,3,4,1,3,5,5,5,7,1,5,6,2,1,
          7,5,9,1,2,1,5,3,3,3,5,4,6,7,3)

## Boxplot
boxplot(eda1)
 
## Multivariate non-graphical EDA: cross-tabulation for categorical
table(mpg$fl, mpg$class)  #fl 이 c,d,e,p,r로 분류돼있음. class도 아래처럼 나눠져있고
View(mpg) #이건 다시 mpg dataset보는거
data(mpg)

## In-class exercise: bank data
bank <- read.csv(file = "C:/Users/majihyun/Desktop/Predictive Analytics FALL 2023 73884 - 9282023 - 856 AM/bank.csv")
bankT <- table(bank$marital, bank$loan)
bankT2 <- table(bank$housing, bank$loan)

bankT
bankT2

prop.table(bankT)


## Multivariate non-graphical EDA: Covariance and correlation for two quantitative variables
print(cov(mpg$displ, mpg$hwy)) 
print(cor(mpg$displ, mpg$hwy)) 

## Multivariate non-graphical EDA: Covariance and correlation for more than two quantitative variables
# import cpg data
CPG <- read.csv(file = "C:/Users/majihyun/Desktop/Predictive Analytics FALL 2023 73884 - 9282023 - 856 AM/cpg.csv")
print(cov(CPG)) #이건 전체
print(cor(CPG)) 
CPG

# In-class exercise:new product data
nProduct <- read.csv(file = "C:/Users/majihyun/Desktop/Predictive Analytics FALL 2023 73884 - 9282023 - 856 AM/new_product.csv")
names(nProduct) #Column네임들 보여줌. 
#The names(nProduct) command in R 
#is used to retrieve and display the names of the variables (columns) 
#within a data frame or object called nProduct. 

print(cov(nProduct$Sales, nProduct$DWBconcept)) 
print(cor(nProduct$Sales, nProduct$DWBconcept))

print(cov(nProduct$Sales, nProduct$Uniqueness)) 
print(cor(nProduct$Sales, nProduct$Uniqueness))

print(cov(nProduct$Sales, nProduct$DWBproto)) 
print(cor(nProduct$Sales, nProduct$DWBproto))

## Multivariate graphical EDA: bar plots for categorical variables
data(mtcars)

# Simple Bar Plot for one categorical variable
counts <- table(mtcars$gear)
counts
barplot(counts, main="Car Distribution",
        xlab="Number of Gears")   #x에 gears가 3,4,5로 나뉜거 적은거고
#y값이 바로 몇개를 의미함.
counts <- table(mtcars$vs)
barplot(counts, main="Car Distribution",
        xlab="Number of VSs")  #VSs는 0또는 1의 카테고리컬 변수
#x만 써도 y값은 자동으로 나옴.

# Stacked Bar Plot for two categorical variables
counts <- table(mtcars$vs, mtcars$gear) #vs=0,1 세로 / gear =3,4,5 가로
counts
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts))



################################TABLE 안에 순서바꿔보기
##순서를 이번엔 vs가 x축에 오도록해서 1,2가 오고
counts <- table(mtcars$gear,mtcars$vs) #vs=0,1 세로 / gear =3,4,5 가로
counts
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of VS", col=c("darkblue","red","Yellow"),
        legend = rownames(counts))


#이번엔 rowname말고 column네임나오게 하기 using 'colnames'
counts <- table(mtcars$gear,mtcars$vs) #vs=0,1 세로 / gear =3,4,5 가로
counts
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of VS", col=c("darkblue","red","Yellow"),
        legend = colnames(counts)) 

#이걸 보니까, table만 순서를 다르게 생각하자 (y,x)라 생각하는게 더 나을듯. 열->행
#vs에 값 두개만 가지고있고, 자연스레 y가 3,4,5 세개라 칼라하나 더 추가했음
#레전드는 또 신기하게 원래 가로축이름인 gear가 들어오네. rownames으로?
########################


####나혼자 해보기 1. 칼라를 레인보우로 바꾸기
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=rainbow(length(counts)))

### vs 가 0,1 이고,gear가 3,4,5다 
        

####나혼자 해보기 2. legend 붙이기
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=rainbow(length(counts)),
        legend = rownames(counts))
######################



# Grouped Bar Plot for two categorical variables
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts), beside=TRUE)

## In-class exercise: bank data
counts <- table(bank$marital, bank$housing)
counts
barplot(counts, main="Marital Status Distribution by Housing",
        xlab="Housing", col=c("darkblue","red", "darkgreen", "yellow"),
        legend = rownames(counts))

barplot(counts, main="Marital Status Distribution by Housing",
        xlab="Housing", col=c("darkblue","red", "darkgreen", "yellow"),
        legend = rownames(counts), beside=F)

barplot(counts, main="Marital Status Distribution by Housing",
        xlab="Housing", col=c("darkblue","red", "darkgreen", "yellow"),
        legend = rownames(counts), beside=T)


## Multivariate graphical EDA: quantitative variables
CPG #CPG data






plot(CPG$AdSpend, CPG$Price)

## Multivariate graphical EDA: quantitative variables and categorical variables
# Enhanced Scatterplot of MPG vs. Weight
# by Number of Car Cylinders
 
plot(mtcars$wt, mtcars$mpg, col=as.factor(mtcars$cyl), pch=2)

#pch 뒤의 숫자에 따라서 point들 모양이 바뀌네..

# Box plot by group
boxplot(mtcars$wt ~ mtcars$cyl)

## Basic data manipulation: select, filter, add, remove, or rename column, complete.cases
# Using dplyr
# Read data
library(dplyr)
bank <- read.csv(file = "C:/Users/majihyun/Desktop/Predictive Analytics FALL 2023 73884 - 9282023 - 856 AM/bank.csv")
#View(influencers)
str(bank) #no issue

####str= structure = display the structure of an R object, 
#such as a data frame or any other R data structure. 
#provides information about the internal structure of the object.

# Load dplyr
library(dplyr)

# Select columns
bank %>% 
  select(age, job, marital, education, housing, loan, contact)

# Filter rows based on a condition
bank %>%  
  filter(age <=55)

# Select columns and Filter rows based on a condition
bank %>%  
  select(age, job, marital, education, housing, loan, contact) %>% 
  filter(age <=55)

# Select columns and Filter rows based on multiple conditions
bank %>%    
  select(age, job, marital, education, housing, loan, contact) %>%   
  filter(age <=55 & marital !="married")

## Create new columns
# Create mean of age by marriage status
bank %>% 
  group_by(marital) %>%  #그룹바이하니까 개체들만 뜸 낱개아니고
  summarise(mean_age = mean(age)) #써머리를 한번해줌.그룹바이하고

bank_new <- bank %>% 
             group_by(marital) %>%   
             mutate(mean_age = mean(age))

# Remove columns
bank %>%    
  select(-age, -job, -marital)    

# Rename columns 이름바꾸기
bank_new2 <- bank_new %>%    
               rename(day.of.week = day_of_week, mean.age = mean_age)    

bank_new2

## Join tables
# Create data frames 
employee <- data.frame(Name = c("Dave Smith", "Julie Jones", "Scott Tanner", "Ted Connors", "Margaret Lane", "Mary Martin"),
                       DepartmentID = c(001, 002, 001, 002, 001, 004),
                       Role = c("Product Marketing Manager", "Software Engineer",
                                "Director of Demand Gen", "Software Engineer",
                                "VP of Marketing", "Receptionist"))
department <- data.frame(DepartmentName = c("Marketing", "Engineer", "Accounting"),
                         DepartmentID = c(001, 002, 003))

employee
department
# Left join
LJtable <- merge(employee, department, by = "DepartmentID", all.x=T) #멀지할 데이터 프레임 두개 각각 넣어주고 공통된 벡터 넣음 그게 먼저시작
LJtable

LJtable <- merge(employee, department, by = "DepartmentID", all.x=F) #T는 NA도 다 띄우네.. f는 밸류없으면 생략. 6개아니고 5개만뜸.
LJtable

# Right join
RJtable <- merge(employee, department, by = "DepartmentID", all.y=T) 
RJtable
RJtable <- merge(employee, department, by = "DepartmentID", all.y=F) 
RJtable

# Inner join
IJtable <- merge(employee, department, by = "DepartmentID")
IJtable

# Outer join
OJtable <- merge(employee, department, by = "DepartmentID", all=T)
OJtable
## Create a categorical variable from a numerical variable
# create sample data frame
data <- data.frame(age=c(10, 23, 13, 41, 15, 11, 23, 45, 95, 23, 75),
                 name=c("Mary", "Sonya", "Nate", "Joe", "Minho", "John", "Taeho", "Sarah", "Mathew", "EJ", "Jiwoo"))

data #다시한번말하지만 새로 샘플데이터 프레임만들면, vertical로 쭈루룩 감.

# Add categorical variable to the data frame #data 프레임에 에이지그룹을 만든다. as.factor로 
data$agegroup <- as.factor(ifelse(data$age<20, 'age1',
                             ifelse(data$age<30, 'age2',
                                    ifelse(data$age<50, 'age3',
                                           ifelse(data$age<90, 'age4', 'age5')))))
#데이터이름$새로만들 컬럼 <- as.factor(ifelse 조건절 (data중에 age라는 컬럼이 <20이면, 'age1'이라 불러라)
#마지막은 50보다 크고 90보다 작 으면 4인데, 나머지는 90보다 크면 age5라 한다. 

#data&agegroup 추가해서, 아래보면 agegroup이라는 컬럼이 하나 새로 생김.


# print data frame
data

##여기서 이름바꾸고싶으면? 참고해서 바꿔보까


##rename방법2 이름바꾸기 2:위에서 언급된 rename 펑션
library(dplyr)

data <- data %>%
  rename(new_agegroup = agegroup)

data



######what if i want to see the new_agegroup in ascending order?
library(dplyr)

data <- data %>%
  arrange(new_agegroup)

# Print the data frame with 'agegroup' in ascending order
data

#descending

library(dplyr)

data <- data %>%
  arrange(desc(new_agegroup))

# Print the data frame with 'agegroup' in descending order
data


###번외: what is 'as.factor'?

# Create a vector of gender data
gender <- c("Male", "Female", "Female", "Male", "Male")

# Convert the vector into a factor
g <- as.factor(gender)

# Display the factor
g




# Configure Git with your GitHub username and email
system("git config --global user.name 'Your GitHub Username'")
system("git config --global user.email 'Your GitHub Email'")
