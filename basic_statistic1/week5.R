### 중심위치의 측도
x <- c(89,74,91,88,72,84);x

sort(x) # 정렬 함수 : sort()

## 표본평균
mean(x)
## 중앙값
median(x)
## 최빈값 - 따로 builtin 함수 없음
y1 <- c(rep('a',10),rep('b',5),rep('c',2));y1
table(y1)
table(y1)[3]
max(table(y1))
#1)
table(y1)==max(table(y1))
table(y1)[table(y1)==max(table(y1))]

#2)
which(table(y1)==max(table(y1)))
table(y1)[which(table(y1)==max(table(y1)))]

#3)
which.max(table(y1))
table(y1)[which.max(table(y1))]

###
y2 <- c(rep('a',5),rep('b',5),rep('c',2));y2
table(y2)
max(table(y2))

#1)
table(y2)[table(y2)==max(table(y2))]

#2)
which(table(y2)==max(table(y2)))
table(y2)[which(table(y2)==max(table(y2)))]

#3)
which.max(table(y2)) # 주의! 여러 개여도 앞에꺼만 출력해줌.

names(table(y2))

table(x)
max(table(x))

### 퍼진 정도의 측도
## 표본분산
x <- c(89,74,91,88,72,84);x
# 방법1
var(x)

# 방법2 (분산 식 구현)
x_bar <- mean(x);x_bar
dev <- x-x_bar
sum(dev) # 편차의 합 =0
x*x;sum(x*x) # 벡터의 크기1
x^2;sum(x^2) # 벡터의 크기2
x %*% x # 벡터의 크기3

sum(dev*dev)/(length(dev)-1)
sum(dev^2)/(length(dev)-1)
(dev %*% dev)/(length(dev)-1)
# 방법3
(sum(x*x)-length(x)*(x_bar)^2)/(length(x)-1)
(sum(x^2)-length(x)*(x_bar)^2)/(length(x)-1)
((x %*% x)-length(x)*(x_bar)^2)/(length(x)-1)
# 방법4
(sum(x*x)-(sum(x))^2/length(x))/(length(x)-1)
(sum(x^2)-(sum(x))^2/length(x))/(length(x)-1)
(x %*% x-(sum(x))^2/length(x))/(length(x)-1)


## 표본표준편차
# 방법1
sd(x)
# 방법2
sqrt(var(x))
# 방법3
# 위에서 여러 방법들로 구한 값의 제곱근을 구함
sqrt((sum(x*x)-(sum(x))^2/length(x))/(length(x)-1))


## 범위
x <- c(89,74,91,88,72,84);x
# 방법1
max(x);min(x);max(x)-min(x)
# 방법2
range(x);range(x)[2]-range(x)[1]


## 백분위수
x <- c(89,74,91,88,72,84);x
x_sort <- sort(x);x_sort 
quantile(x)
quantile(x,prob=0.1)
quantile(x,prob=c(0.1,0.2,0.3))
## 사분위수
quantile(x)[2]
quantile(x,prob=c(0.25,0.5,0.75))
## 사분위수 범위(IQR)
IQR(x)
quantile(x)[1]
quantile(x)[4]-quantile(x)[2]
quantile(x,prob=0.75)-quantile(x,prob=0.25)
## 변동계수(CV)
x1 <- c(170,180,175,188,177,173);x1 # 키(cm)
x2 <- c(1.70,1.80,1.75,1.88,1.77,1.73);x2 # 키(m)
x3 <- c(60,68,67,80,77,70);x3 # 몸무게(kg)
CV_x1 <- (sd(x1)/mean(x1))*100;CV_x1
CV_x2 <- (sd(x2)/mean(x2))*100;CV_x2
CV_x3 <- (sd(x3)/mean(x3))*100;CV_x3

### 상자그림(Boxplot)
head(iris)
## boxplot(formula,data, col,xlim,ylim,main,xlab,ylab,names)
## formula : ex. y ~ grp : y는 분포를 그릴 값 
##                         grp는 값들을 그룹짓는 변수
## data : formula를 적용할 데이터 프레임 
## col : 상자그림 색깔
## xlim : x축 범위
## ylim : y축 범위
## main : 상자 그림 제목
## xlab : x축 이름
## ylab : y축 이름 
## names : 각 그룹의 이름
## horizontal : T면 가로로, F면 세로로 그림 
x <- c(89,74,91,88,72,84);x
boxplot(x)
boxplot(iris$Sepal.Width, horizontal=T)
box <- boxplot(iris$Sepal.Width);box
box <- boxplot(iris$Sepal.Width,notch=TRUE);box

# stats : 이상치를 제외한 사분위수
# n : 각 그룹마다의 관측값 수를 저장한 벡터
# conf : notch 구간을 저장한 행렬
# out : 이상치
# group : 이상치가 속한 그룹
# names : 각 그룹의 이름을 저장한 벡터 

# notch란 ? : 중앙값에 대한 신뢰구간으로, 여러 boxplot의 중앙값이 다른지 확인 가능.

range(iris$Sepal.Width, na.rm=T)

box<-boxplot(Sepal.Width ~ Species, data=iris, col=c(1,2,3),
             main='Boxplot of Sepal.Width by Species', 
             ylim=c(0,5), ylab='Sepal.Width',
             names=c('Setosa','Versicolor','Virginica')) ; box

