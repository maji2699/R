###############SUBMISSION: R FILE##Individual Predictive Analytics Assignment## R
###############The submission should be formatted in the following way:
############# First Name: Sunny (Jihyun) / Last Name: Ma
##############Professor: Emily Ko

       #Q1_1. Assign numeric value 4 to A and compute (A – 4*√𝐴)/(A+ 5*√𝐴)

A <-4   # In R, when assigning, have to use '<-' , not equal sign!!
sqrt(A) #Square root: √ : sqrt()
4*sqrt(A)

(A - 4*sqrt(A))/(A + 5*sqrt(A))  #Answer:  -0.2857143


        #Q1_2. Create sequence of numbers that count up by 4 from 0 to 48

seq(0,48)  #<- answer using the 'sequence' function.
-------------------------------------

seq(0:2) #1,2,3
seq(1:3) #1,2,3

seq_len(3) #1,2,3
   
x <- 0:48     
x
-----------------------------------
  #Q1_3. Use R to compute followings (2^77 = 2^7 in R)

2^7/ (2^7 - 1)      #answer: -1.007874


{(1 - (1/2^7))}^-1  #answer: 1.007874


e^0.4               #answer:1.551846

 y <- 0.3
 
 1 + y + y^2 + y^3  #answer: 1.417
 
 z <- 1 + y + y^2 + y^3 
z 

(1 + z + y^5) / 5   #answer: 0.483886


#Q1_4. Create a matrix that consists of eight country names(number of rows = 4, number of columns = 2)
#and convert the matrix into data frame. 
#Make sure if the matrix successfully changes into data frame.

country <- matrix(c("South Korea", "USA", "Japan", "France", "UK", "India", "Brazil", "Peru"), nrow=4, ncol=2)
country             # I named the matrix as 'country'

df = as.data.frame(country)  #assigned name = as.data.frame(input data)
df
class(df)    #By using 'class' function, we can make sure it's data frame. 



#Q1_5. Create two vectors that consist of four integer values for each and multiply the vectors.
#Example code: a <- c(2L, 4L, 8L, 10L) have to have ‘L’ after each number to indicate an integer value.

a <- c(2L, 3L, 4L, 55L)
b <- c(5L, 7L, 8L, 10L)
a * b                    #result: 10  21  32 550


#If I want to make a matrix those two vectors, use 'cbind' 

ab_matrix = cbind(a, b)
print(ab_matrix)
ab_matrix * 2



#Q1_6. Create a data frame (named friend) that includes following variables.

# name consists of four friends' names
# age consists of their ages
# momAge consists of their mothers' ages (You can make up the age)
# dadAge consists of their fathers' ages (You can make up the age)


name <- c("Jason", "Ain", "Jenny", "John")
age <- c(35, 29, 20, 39 )
momage <- c(59, 55, 49, 64)
dadage <- c(58, 60, 53, 64)

friend <- cbind(name, age, momage, dadage)
frienddf <- as.data.frame(friend)

frienddf

#Example code:
# Create vectors
#  name <- c("Lucy", "Junga", "Mike", "Jason")
#   age <- c(35, 24, 55, 43)
#momAge <- c(64, 55, 76, 68)
#dadAge <- c(62, 57, 77, 76)
# Cbind the vectors:  friend <- cbind(name, age, momAge, dadAge)
# Convert to a data frame: frienddf <- as.data.frame(friend)




#Q1_7. Create an additional column in the data frame (friend) that results in the total ages 
#for the three persons in each family (= friend + mother + father).


frienddf$age <- as.numeric(as.character(frienddf$age))
frienddf$momage <- as.numeric(as.character(frienddf$momage))
frienddf$dadage <- as.numeric(as.character(frienddf$dadage))

# Add a column for total age
frienddf$totalAge <- frienddf$age + frienddf$momage + frienddf$dadage


frienddf


#Example code:
  # Convert character value to numeric to add
#  frienddf$age <- as.numeric(as.character(frienddf$age))
#frienddf$momAge <- as.numeric(as.character(frienddf$momAge))
#frienddf$dadAge <- as.numeric(as.character(frienddf$dadAge))
# Add a column for total age
#frienddf$totalAge <- frienddf$age + frienddf$momAge + frienddf$dadAge




#Q1_8. Install and load R packages ‘ggplot2’ and ‘psych’.

install.packages("ggplot2")
install.packages("psych")


#Q1_9. Download ‘demand1.csv’ data file from Pace Class Portal and save it in a desired folder. 
      #Import the data file into R using syntax in R script.


demand1 <- read.csv(file = "C:/Users/majihyun/Desktop/demand1.csv", sep = ",", head = T)
demand1

#Example code:
#  demand1 <- read.csv(file = "~/demand1.csv", sep = ",", header = T)


#Q1_10. Download ‘adSpend.csv’ data from Pace Class Portal and save it in a desired folder. 
#Import the data file into R using syntax in R script and cbind it with ‘demand1.csv’ 
#and name the new data frame ‘demand2.csv’. 
#Export the ‘demand2.csv’ to a desired folder.

adSpend <- read.csv(file = "C:/Users/majihyun/Desktop/adSpend.csv", head = T)
adSpend


demand2 <- cbind(demand1, adSpend)
demand2


write.csv(demand2, file = "C:/Users/majihyun/Desktop/demand2.csv", row.names = T)


#Example code:
#  demand2 <- cbind(demand1, adSpend)
#write.csv(demand2, “~/demand2.csv", sep=",")





