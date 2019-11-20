summary()
str()
dim()
names()
dimnames()
class()
length()
attributes()
factor()
table()
unclass()
attr()
vector()
list(1, "a", TRUE, 1+4i)
c()
vector("numeric",length=10)
m <- matrix(nrow=2,ncol=3) # creates a matrix full of NA values
m <- matrix(1:6,nrow=2,ncol=3)
n <- 1:10
dim(n) <- c(2,5) # creates a matrix using n and 2,5
## factors
lm()
glm()
#m/f etc
x <- factor(c("yes", "yes", "no"))
x <- factor(c("yes", "yes", "no"), levels = c("yes","no")) # sets order to yes then no rather than alphabetic
## data.frame
x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
nrow(x)
ncol(x)
## names
x <- 1:3
names(x) <- c("foo","bar","norf")
x <- list(a=1,b=2,c=3)
m <- matrix(1:4), nrow=2, ncol=3)
dimnames(m) <- list(c("a","b"),c("c","d")
## reading data
read.table()
data.matrix() # converts data.frame to matrix format
read.csv()
read.xlsx()
readLines # reads lines of a txt file
data <- read.table("foo.txt") # makes a data.frame
# figure out column classes to speed up data reading
initial <- read.table("datatable.txt",nrows=100) # a mild overestimation on nrows won't be too bad
classes <- sapply(initial, class)
tabAll <- read.table("datatable.txt",colClasses=classes)
# unix tool wc will calculate number of lines in a file

## SWIRL
#Vectors
num_vect <- c(0.5,55,-10,6)
tf <- num_vect<1
tf
[1]  TRUE FALSE  TRUE FALSE
num_vect>=6
[1] FALSE  TRUE FALSE  TRUE
(3 > 5) & (4 == 4)

1: FALSE
2: TRUE

Selection: 1
##--
(TRUE == TRUE) | (TRUE == FALSE)

1: TRUE
2: FALSE

Selection: 1
##--
((111 >= 111) | !(TRUE)) & ((4 + 1) == 5)

1: TRUE
2: FALSE

Selection: 1
##--
my_char <- c("My", "name", "is")
paste(my_char, collapse = " ")
my_name <- c(my_char, "Sharon")
paste(my_name, collapse = " ")
[1] "My name is Sharon"
paste(c(1:3),c("X", "Y", "Z"), sep="")
[1] "1X" "2Y" "3Z"




set.seed(12)
x <- rnorm(100,2,4)
rpois
rbinom
plot(x,y)
lapply() # loop over list # applies a function to a subset of a vector
sapply() # simple lapply
apply()
tapply()
mapply() # multivariate
split # takes a vector or objects and splits it into groups
data <- read.xlsx("file.xlsx",sheetIndex=1,header=TRUE)
head(data)
file <- "webaddress.xml"
doc <- xmlTreeParse(file)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
system.time()
Rprof() # only works if system.time() >= 0.025
summaryRprof() # only works if system.time() >= 0.025
by.total
by.self
table()
gl() # generate factor levels
x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)
tapply(x,f,mean)
split(x,f)
lapply(split(x,f),mean) # same as tapply(x,f,mean)
s <- split(airquality, airquality$Month)
str(s) # split for each month so monthly summaries
lapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
sapply(s,function(x) colMeans(x[,c("Ozone","Solar,R","Wind")], na.rm=TRUE))
sample(1:10,4) # picks 4 (different) numbers between 1 & 10 ## -- ## It is possible to set it to reuse numbers
sample(letters,5) # picks 5 alphabetical letters
getwd()
setwd()
invisible() # won't return final value
is.na()
is.nan()
na.omit()
swirl()
# calculate ave mpg by # cyl
sapply(split(mtcars$mpg,mtcars$cyl),mean)
tapply(mtcars$mpg,mtcars$cyl,mean)
with(mtcars,tapply(mpg,cyl,mean))
#
log()
print()
##
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1)) ## is the same as the next line
mapply(rep,1:4,4:1)
x <- list(a=matrix(1:4,2,2), b=matrix(1:6,3,2))
x <- matrix(rnorm(200),20,10)
apply(x,2,mean) # gives mean of each of 10 cols
apply(x,1,mean) # sums all 20 rows individually
apply(x,1,quantile,probs=c(0.25,0.75))
rowSums = apply(x,1,sum)
rowMeans
colSums
colMeans
complete.cases # finds complete cases
as.character
as.numeric
as.matrix
as.logical
as.integer
as.complex
as.vector
as.list
list.files()
do.call()
seq_along()
mean()
subset()
length()
data.frame
cor()
solve() # inverts a matrix
rbind() # binds rows
cbind()
if(!x%in%y) stop("invalid")
dat$add <- x # adds column x to dataframe dat with heading "add"
order() # re-orders dataframe
unique() # lists only unique values of a vector/list
head()
tail()
library(XML)
library(RCurl)
fileUrl <- "stuff.xml"
xData <- getURL(fileUrl)
doc <- cmlParse(xData)
library(data.table)
?fread
data5 <- fread(q5url)
zips <- xpathSApply(rootNode,"//zipcode",xmlValue)
head(zips)
countzip <- table(zips)
sort()
rank()
order()
set.seed(13435)
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X <- X[sample(1:5),]
X <- X$var2[c(1,3)]=NA
X[,1]
X[,"var1"]
X[1:2,"var2"]
X[(X$var1 <= 3 & X$var3 > 11),] # and
X[(X$var1 <= 3 | X$var3 > 15),] # or
X[which(X$var2>8),] # filters out NA values
sort(X$var1)
sort(X$var1,decreasing=TRUE)
sort(X$var2,na.last=TRUE)
X[order(X$var1),]
X[order(X$var1,X$var3),]
##
library(plyr)
arrange(X,var1) #does same as above
arrange(X,desc(var1)) #descending order
X$var4 <- rnorm(5) # adds new column
Y <- cbind(X,rnorm(5)) # another way to add a new column - this gives the col name rnorm(5)
quantile(X$var2,na.rm=TRUE)
quantile(X$varname,probs=c(0.5,0.75,0.9)) # gives 50%, 75% and 90%
table(restData$zipCode,useNA="ifany")
table(restData$councilDistrict,restData$zipCode)
sum(is.na(restData$councilDistrict)) # returns number
any(is.na(restData$councilDistrict)) # returns TRUE/FALSE
all(restData$zipCode > 0) # returns TRUE/FALSE
colSums(is.na(restData)) # returns number of NAs for each column
all(colSums(is.na(restData))==0) # returns TRUE/FALSE about whether there are ANY missing values in restData
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212","21213"),]
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq~Gender+Admit,data=DF)
warpbreaks$replicate <- rep(1:9,len=54)
xt = xtabs(breaks ~.,data=warpbreaks)
ftable(xt)
fakeData=rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb")
abs(x)
sqrt(x)
ceiling(x)
floor(x)
round(x,digits=n)
signif(x,digits=n)
cos(x)
sin(x) # etc
log(x)
log2(x)
log10(x)
exp(x)
library(reshape2)
head(mtcars)
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)
cylData <- dcast(carMelt, cyl~variable) # default length of each thing
cylData <- dcast(carMelt, cyl~variable,mean) # picks the mean for each thing
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)
spIns = split(InsectSprays$count,InsectSprays$spray)
sprCount = lapply(spIns,sum)
unlist(sprCount)
sapply(spIns,sum)
ddply(InsectSprays,.(spray),summarize,sum=sum(count))
spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
dim(spraySums)
head(spraySums)
