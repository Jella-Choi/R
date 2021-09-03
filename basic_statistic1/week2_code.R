

### 벡터 (vector)

# 1) 벡터 내에는 하나의 데이터 타입만이 허용됨.
x1 <- c(1,2,3,4,5)
x1
mode(x1)

x2 <- c( 'a','b','c','d')
x2
mode(x2)

x3 <- c(1,2,'a','b')
x3

x4 <- c(1,2,3)
x5 <- c(4,5,6)
x4+x5
x4/x5
x1/x4
# 2) 벡터 생성 - 4가지

a<-vector()
a[3] <-3
a
a1 <- c(1,2,3)
a2 <- 1:3
a3 <- seq(1,3,1) # seq(from, to, by)
a4 <- rep(1,3) # rep()
a5 <- rep(1:2, 3)
a6 <- rep(1:2, each=3)
a1
a2
a3
a4
a5
a6

# 3) 벡터 내 데이터 접근 및 수정 (indexing and slicing)
x <- c(1,2,3)
x[1]
x[1]=5
x

x[-1]
x[-2] =1
x

x[1:2]
x[1:3]
## 3-1) names(vector)를 통해 벡터의 각 원소에 이름을 지정
names(x) <- c('a','b','c')
x[c('a','c')]

# 4) 벡터의 길이 (원소 개수) 확인
length(x)


### 행렬 (matrix)
# 1)행렬 생성
mat1 <- matrix(c(1,2,3,4,5,6),nrow=2,ncol=3, byrow=T); mat1
mat2 <- matrix(c(1,2,3,4,5,6),nrow=2,ncol=3, byrow=F); mat2
mat3 <-matrix(c(1,2,3,4,5,6),nrow=3,ncol=2); mat3

# 2)행렬 내 행과 열의 이름 설정
# 2-1) rownames / colnames
rownames(mat3) <- c('n1','n2','n3')
colnames(mat3) <- c('x1','x2')
mat3
# 2-2) dimnames 인자 사용
rname <- c('n1','n2','n3')
cname <- c('x1','x2')
mat4 <- matrix(c(1,2,3,4,5,6),3,2,dimnames = list(rname,cname))
mat4

# 3) 행렬 내 원소 접근
# 3-1) 하나의 원소 접근
mat3;
mat3[1,2] # 행렬[row,col]
# 3-2) 하나의 행 or 열 접근
mat3[1,]
mat3[,2]
# 3-3) 복수의 행 or 열 접근
mat3[c(1,2),]
mat3[,c(1,2)]


### 리스트 (list)
list_dat <- list(a=c(rep(1,5),4), b=matrix(1:10,2,5))
list_dat
list_dat$a
list_dat$b
list_dat[1]
list_dat[[1]]
is.vector(list_dat[[1]])
is.matrix(list_dat[[2]])

# 데이터프레임 (dataframe)
# 1) 데이터 프레임 생성
vec1<- c('one','two','three')
vec2<- c(1,2,3)
a <- data.frame(x1 = vec1, x2= vec2); a

# 2) 객체 및 차원 확인
str(a)
dim(a)
nrow(a)
ncol(a)
length(a)
# 3) 원소 접근

a$x1
a[1,]
a[,1]
a[1] # 주의 ! dataframe[n] : n번째 열 참조.
a[2]
a[[1]] # dataframe[[n]] : n번째 열의 value들을 참조
a[[2]]
a[1:2,2]

# R내 연산들

# 기본 연산
a <- 4 ; b<-2 ; c<-2+3
a+b
c-b
a/c
c%%b
a^b

# 논리 연산
A <- TRUE ; B <- FALSE ; C<-c(T,T) ; D<- c(T,F) ; E<- c(F,F)
A & B
A | B
C & D
C && D
D | E
D || E

# 비교 연산자
a <-c(1,2); b<-c(2,2); c<-c(3,4)
a < c
a >= c
a == b
a != b

all( a != b)
any( a != b)

# 객체 유형 확인 및 변환
df <- data.frame(x1=1:4, x2=rep(c(5,6),2), x3= c('a','b','c','d'));df
df_to_mat <- as.matrix(df); df_to_mat
is.matrix(df_to_mat)

mat_to_df <- as.data.frame(df_to_mat); mat_to_df

# 현재 Environment내 변수 확인 및 변수 삭제
ls()
rm(a); ls()
rm(list=ls())
