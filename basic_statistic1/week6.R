# 데이터 불러오기
rm(list=ls())

iris <- read.csv('C:/Users/User/Desktop/기통실/code/iris123.csv',header=T,stringsAsFactors=T)

## 두 범주형 자료의 요약
# 분할표
colnames(iris)
mean(iris$Sepal.Length, na.rm=T)
iris$Sepal.Length[is.na(iris$Sepal.Length)] <- mean(iris$Sepal.Length, na.rm=T)
iris$Sepal.Width[is.na(iris$Sepal.Width)] <- mean(iris$Sepal.Width, na.rm=T)
iris$Petal.Length[is.na(iris$Petal.Length)] <- mean(iris$Petal.Length, na.rm=T)
iris$Petal.Width[is.na(iris$Petal.Width)] <- mean(iris$Petal.Width, na.rm=T)


iris$Sepal.Length_6 <- 'High'
iris$Sepal.Length_6[iris$Sepal.Length<6] <- 'Low'  
head(iris)
tab<-table(iris$Species,iris$Sepal.Length_6)
tab
prop.table(tab)

# 모자이크 플롯
mosaicplot(tab, main='Species vs. Sepal.Length_6', color=c('grey','black'))
mosaicplot(tab,  color=rainbow(2))

## 두 연속형 자료의 요약
# 산점도
plot(iris$Sepal.Length, iris$Sepal.Width)
plot(iris$Sepal.Length, iris$Petal.Width)
plot(iris$Petal.Length, iris$Petal.Width)
plot(iris$Petal.Length, iris$Sepal.Width)

par(mfrow=c(3,2)) # 여러 그림을 한 페이지에 그리는 방법 
plot(iris$Sepal.Length, iris$Sepal.Width)
plot(iris$Sepal.Length, iris$Petal.Width)
plot(iris$Petal.Length, iris$Petal.Width)
plot(iris$Petal.Length, iris$Sepal.Width)

par(mfrow=c(1,1)) # 복구 

# 산점도 행렬
iris <- read.csv('C:/Users/User/Desktop/기통실/code/iris123.csv',header=T,stringsAsFactors=T)
iris$Sepal.Length[is.na(iris$Sepal.Length)] <- mean(iris$Sepal.Length, na.rm=T)
iris$Sepal.Width[is.na(iris$Sepal.Width)] <- mean(iris$Sepal.Width, na.rm=T)
iris$Petal.Length[is.na(iris$Petal.Length)] <- mean(iris$Petal.Length, na.rm=T)
iris$Petal.Width[is.na(iris$Petal.Width)] <- mean(iris$Petal.Width, na.rm=T)


pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=iris)
pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=iris, pch=21)
pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=iris, pch=21,col=c(1,2,3))
pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=iris, pch=21,col=c(1,2,3)[unclass(iris$Species)])
?pairs

# 상관계수
summary(iris)
cor(iris$Sepal.Length,iris$Petal.Width)

a <- iris$Sepal.Length-mean(iris$Sepal.Length)
Sxx <- sum(a*a);Sxx
b <- iris$Petal.Width-mean(iris$Petal.Width)
Syy <- sum(b*b);Syy
Sxy <- sum(a*b);Sxy
r <- Sxy/(sqrt(Sxx*Syy));r
plot(iris$Sepal.Length,iris$Petal.Width)
