### week 2

## vector : 하나의 데이터 유형만 가능
vec = c(1,2,'a')

vec1 = vector()
vec1[1]=1; vec1[2]=2

vec2=seq(length=5,from=-5,to=3)

## matrix : 하나의 데이터 유형만 가능
vec=1:6
mat1 = matrix(vec,3,2,byrow=T)

rownames(mat1) = c('r1','r2','r3')
colnames(mat1) = c('c1','c2')

rname = c('r1','r2')
cname = c('c1','c2','c3')
mat2 = matrix(vec,2,3,dimnames=list(rname,cname))

mat2[1,2] # 하나의 원소 선택
mat2[1,]; mat2[,2]  # 하나의 행, 열 선택
mat2[c(1,2),]; mat2[,c(1,3)]  # 여러개의 행, 열 선택
mat2[,-2]  # 해당 열 제외


## list : (키,값)형태, 여러 개의 객체 유형 가능
# $ - key 값 호출
# [] - 리스트 객체(key,value)반환
# [[]] - 리스트의 원소 반환

list_dat = list(a=c(rep(1,5),4),b=matrix(1:10,2,5))
list_dat
list_dat$a
list_dat[1]
list_dat[[1]]
list_dat[[1]][6]

## data frame : 구조는 행렬과 동일, 각 열에 대해 다른 유형 가능
# 각 column의 길이 같아야 함
# data.frame(col1=data1, col2=data2, ..., stringAsFactors=T)
# stringAsFactors - 문자형 데이터가 들어오면 factor로 인식할지, character로 인식할지 명시

# str(변수) - 해당 변수의 정보 확인
# dim(DataFrame) - 데이터 프레인의 행/열 개수 리턴
# Dataframe$column - 데이터 프레임의 clumn에 접근

x1 = c('one','two','three')
x2 = c(1,2,3)

a = data.frame(x1 = x1, x2 = x2);a
a$x1
a[1,]
a[,2]
a[1]

str(a)
dim(a)
nrow(a)
ncol(a)
length(a)

## 객체 유형 변환
df = data.frame(x1=1:4, x2=rep(c(5,6),2), x3=c('a','b','c','d')); df
df_to_mat = as.matrix(df); df_to_mat
is.matrix(df_to_mat)
mat_to_df = as.data.frame(df_to_mat); mat_to_df

## working directory
getwd() # 현재 주소 반환

#setwd('주소') - 주소 변경
