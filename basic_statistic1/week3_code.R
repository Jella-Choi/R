### 3주차 기초통계실습
# 1. 조건문 / 반복문 

grade<- 75
if (grade>=70){
  print('합격')
} else {
  print('불합격')
}

grade2 <- 65
if (grade2 >=80){
  print('A')
} else if(grade2>=70){
  print('B')
} else if(grade2>=60){
  print('C')
} else{
  print('D')
}

for ( i in 1:5){
  print(i)
}
for (i in c('a','b','c')){
  print(i)
}
c<- c(10,22,3,15,8,5)
for( i in c){
  if(i >=10){
    print('10이상 !')
  } else {
    print('10 미만 !')
  }
}

var <- 1
while(var<10){
  print(var)
  var <- var+1
}

i <- 1
while(i <=10){
  if(i %% 2 !=0){
    print(i)
  }
  i <- i+1
}

i <- 0
while(i <=10){
  
  i <- i+1
  if(i %% 2 !=0){
    next
  }
  print(i)
}

i <- 0
while(i <=10){
  
  if(i %% 2 !=0){
    next
  }
  i <- i+1
  
  print(i)
}

for(i in 1:10){
  if(i == 5){
    break
  }
  print(i)
}


# 2. 벡터와 행렬 연산
x<- c(1,2,3,4,5)
x+2
x/3
x * 2
x+x

x == c(1,2,3,4,6)
x == c(1,2,3,4,6,7)

c(T,F,F) & c(T,F,F)

sum(x)
mean(x)
median(x)

y <- matrix(c(1,2,3,4,5,6),2,3)
y+1 
y-2
y + y
y == matrix(c(3,2,4,5,5,6),2,3)
t(y)
y %*% t(y)
z <-matrix(c(1,2,3,4),2,2)
solve(z)

# 3. NA 처리

NA & TRUE
NA + 1

a = c(1,2,3,4,NA)
sum(a)
sum(a,na.rm=T)
is.na(a)
which(is.na(a)) 
na.omit(a)
a[which(is.na(a))] =5 ; a


# 4. 기초통계 함수

# 5. function 정의
s <- function(a,b){
  return( a+ b)
}
ss <- s(3,4)
ss 

# 6. apply 함수 
mat <- matrix(c(1,2,3,4,5,6,7,8),2,4)
apply(mat, MARGIN = 1, FUN = sum)
apply(mat, MARGIN = 2, FUN = sum)


# 7. 파일 입/출력 
setwd("C:/Users/User/Desktop/기통실")
dset <- read.table('./dataset_1.txt',
                   header=T,
                   sep=',',
                   stringsAsFactor=FALSE,
                   na.strings="") ; dset

dset2 <- read.table('C:/Users/User/Desktop/기통실/dataset_1.txt',
                   header=T,
                   sep=',',
                   stringsAsFactor=FALSE,
                   na.strings="") ; dset2

write.table(dset,
            'C:/Users/User/Desktop/기통실/test_q_T.txt',
            row.names=F,
            col.names=T,
            quote=T,
            na='NA')

write.table(dset,
            'C:/Users/User/Desktop/기통실/test_q_F.txt',
            row.names=F,
            col.names=T,
            quote=F,
            na='NA')


wset <- read.table("./test_q_T.txt",
                   header=T,
                   sep=",",
                   stringsAsFactors = F,
                   na.strings=""); wset

train_df <- read.csv('./train_users_2.csv',
                     header=T,
                     stringsAsFactor=T)
head(train_df)
write.csv(head(train_df),'./train.csv')
