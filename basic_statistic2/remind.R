# sequence : seq(from, to, length, by)
vec1 = seq(from=1, to= 10)
vec1

seq(from=-5, to=5, by=2)

# repeat : rep(vector, times) or rep(vector, each)
rep(c(1,2), times=3)
rep(c(3,4), each=3)

# sort(x, decreasing)
x = c(1,5,3,2,4)
sort(x); sort(x, decreasing = TRUE)

# order(x, decreasing)
order(x); order(x, decreasing = TRUE)

install.packages('ggplot2')
library(ggplot2)

# mode(x)
x=1; mode(x)
is.integer(x)
as.integer(x)

## factor(요인): 범주형 자료(명목, 순서형 자료)
grade = c('B0','C+','F','A+','A0','B+')
factor(grade)
factor(grade, order=T) # order = T:순서형, F:명목형

lev = c('F','C+','B0','A+','A0')
factor(grade, levels=lev) # levels : 자료의 벡터 값들에 대한 level(순서)
factor(grade, levels=lev, order=T)

# 논리 연산자
# &, | :  모든 원소에 대해 
# &&, || : 첫 원소에 대해
 
# 비교 연산자
# all(논리값) :전체 확인 - any(논리값) :하나라도 TRUE
a = c(1,2); b = c(2,2); c = c(3,4)
a==b
all(a==b)
any(a==b)

# 행렬(matrix)
mat1 = matrix(1:6,2,3,byrow=T); mat1
mat2 = matrix(1:6,2,3); mat2
rownames(mat1) = c('r1','r2')
colnames(mat1) = c('c1','c2','c3')
mat1

rname = c('r1','r2','r3')
cname = c('c1','c2')
matrix(7:12,3,2,dimnames=list(rname,cname))

# 리스트(list)
list_dat = list(a=c(rep(1,5),4), b=matrix(1:10,2,5))
list_dat
list_dat$a
list_dat[2]
list_dat[[2]]

# 데이터 프레임  *모든 변수의 길이 동일
df = data.frame(x1=1:4, x2=rep(c(5,6),2), x3=c('a','b','c','d'))
df
df[1,]
