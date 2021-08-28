## 3주차

## if
grade = 75
if(grade >=90){
  print('A')
} else if(grade >= 80){
  print('B')
} else {
  print('C')
}

## for
vec = c('a','b','c','d')
for (n in vec){
  print(n)
}


for (i in 1:5){
  print(i)
}

## while
var = 1
while(var<10){
  print(var)
  var = var+1
}

i = 1
while(i <= 10){
  if(i %% 2 != 0){ 
    print(i)
  }
  i = i+1
}

# next : 현재 반복 종료, 다음 반복 실행
# break : break가 포함된 가장 가까운 반복 중단

i = 0
while(i <= 10){
  i = i+1
  if(i %% 2 != 0){ 
    next
  }
  print(i)
}


## 무한 loop (i가 증가하지 않은 채로 whlie 돌아감)
i = 0
while(i <= 10){
  if(i %% 2 != 0){ 
    next
  }
  i = i+1
  print(i)
}

for (i in 1:10){
  if (i == 5){
    break
  }
  print(i)
}

## 벡터 연산 - 사칙연산(두 벡터의 원소 개수가 동일해야 가능)
x = c(1,2,3,4,5)
x+2
x+x
x == c(1,2,3,4,6)

sum(x)
mean(x)
median(x)

## 행렬 연산
# - 사칙 연산 : 두 행렬이 동일한 차원일 때
# - 행렬 곱(%*%) : (m*n) %*% (n*p)
# - 역행렬(solve) : 정방행렬(n*n)만 가능

y = matrix(c(1,2,3,4,5,6),2,3)
y+1
y+y
y == matrix(c(3,2,3,4,2,6),2,3)

t(y)
y %*% t(y)

x=matrix(c(1,2,3,4),2,2)
solve(x)

## 결측치 (NA) - 데이터에 결측치 포함 -> 연산 결과가 NA로 바뀜
# is.na(객체)
# which(is.na(객체)) : TRUE 인 index 리턴
# na.omit(객체) : NA 가 포함된 행 제외
# (파라미터) na.rm : NA 값이 있을 때 해당 값을 제거후 함수를 실행할 지 결정

a = c(1,2,3,4,NA,NA)
sum(a)
sum(a,na.rm=T)
is.na(a)
which(is.na(a))
na.omit(a)   ## na.action : n번 째 원소가 NA / class : 함수에 대한 클래스
a[which(is.na(a))] = 10; a


## 기초통계 함수
# sum / mean / median / max / min 
# sd 표준편차 / var 분산 / summary 기술,요약 통계량

x = c(1,2,3,4,5)
summary(x)

## 사용자 정의 함수(function)
s = function(a,b){
  return (a+b)
}
ss = s(3,4); ss


## Apply 함수
# 행 , 열 별로 함수 적용할 떄 유용
# apply(행렬, MARGIN = 1 or 2, FUN = 사용할 계산 함수)
# MARGIN = 1 : 행 별로 함수 적용
#  ``    = 2 : 열 별로 함수 적용
mat = matrix(1:8, 2, 4, byrow = T); mat
apply(mat, 1, sum)
apply(mat, 2, mean)

## 자료 입,출력(txt file)

# 입력 - read.table(file='', header = T or F, sep = '구분형태')
# header = T : 변수명 있다고 판단, 첫 행을 변수명으로 설정 (스키마 있는 경우)
#   ''   = F :   ''    없다고 판단, 첫 행을 변수 값으로 설정
# sep = '\t',',','' 등 여러가지 구분 기호
# stringAsFactors = T : 문자열을 factor형 설정 / F : 문자열을 character형 설정

# 출력 - write.table(객체, file, row.names, col.names, ... )
# file ; 파일을 저장하고자 하는 위치
# row.names = T or F ;  행 이름 출력 여부
# col.names = T or F ;  열 이름 출력 여부
# quote = T or F ; 문자열에 따옴표 표기 여부
# sep = '\n','\t',' ' 개행 문자, 변수의 구분

# ___________________________________

## 자료 입,출력(csv file)

# 입력 - read.csv(file='', header = T or F ) 
# header = T : 변수명 있다고 판단, 첫 행을 변수명으로 설정 (스키마 있는 경우)
#   ''   = F :   ''    없다고 판단, 첫 행을 변수 값으로 설정
# sep = '\t',',','' 등 여러가지 구분 기호
# stringAsFactors = T : 문자열을 factor형 설정 / F : 문자열을 character형 설정

# 출력 - write.csv(객체, file, row.names, col.names, ... )
# file ; 파일을 저장하고자 하는 위치
# row.names = T or F ;  행 이름 출력 여부
# col.names = T or F ;  열 이름 출력 여부
# quote = T or F ; 문자열에 따옴표 표기 여부
# sep = '\n','\t',' ' 개행 문자, 변수의 구분

setwd('C:/Users/ewqaz/Desktop/R(3-1)/기초통계실습/week3')
dset = read.table('./dataset_1.txt',
           header = T,
           sep = ',',
           stringsAsFactors = F,
           na.string = ' '); dset

dset2 = read.table('C:/Users/ewqaz/Desktop/R(3-1)/기초통계실습/week3/dataset_1.txt',
                   header = T,
                   sep = ',',
                   stringsAsFactors = F,
                   na.string = ' '); dset2
write.table(dset,
            'C:/Users/ewqaz/Desktop/R(3-1)/기초통계실습/week3/text_q_T.txt',
            row.names=F,
            col.names=T,
            quote=T,
            na='NA')

write.table(dset,
            'C:/Users/ewqaz/Desktop/R(3-1)/기초통계실습/week3/text_q_F.txt',
            row.names=F,
            col.names=T,
            quote=F,
            na='NA')

wset = read.table('./text_q_T.txt',
                  header=T,
                  sep = ',',
                  stringsAsFactors = F,
                  na.strings='');wset

getwd()

train_df = read.csv('./train_users_2.csv',
                    header = T,
                    stringsAsFactors = T)

head(train_df) # 6개만 출력
write.csv(head(train_df),'./train.csv')
