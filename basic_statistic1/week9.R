### class 9

## Probability Distribution(확률 분포)
df_x <- data.frame(x=c(rep(0,20),rep(1,50),rep(2,30)));df_x
i <- table(df_x); i # 확률 분포표
df_x_i <- as.data.frame(i); df_x_i

df_x_i$prop <- df_x_i$Freq/sum(i); df_x_i$prop # 상대 도수로 표현
mean(df_x$x)
sum(unique(df_x$x)* df_x_i$prop)

# Joint Probability Distribution(이변량 결합 확률 분포)
df <- data.frame(x=c(rep(0,20),rep(1,50),rep(2,30)),
                 y=c(rep(0,5),rep(1,5),rep(2,10),rep(0,5),rep(1,10),
                     rep(2,25),rep(3,10),rep(1,15),rep(2,10),rep(3,5)));df

j <- table(df);j
df_j <- as.data.frame(j);df_j
df_j$prop <- df_j$Freq/sum(j);df_j

# Marginal Probability Distribution (주변 확률 분포)
#margin.table(table, 1:행기준/ 2:열기준)
margin.table(j,1)
margin.table(j,1)/sum(j) # x의 주변확률 분포
margin.table(j,2)/sum(j) # y의 주변확률분포

# 기댓값 E(X): mu_x / E(Y): mu_y / E(XY): mu_xy
mu_x <- sum(unique(df$x)*margin.table(j,1)/100);mu_x
mean(df$x)

mu_y <- sum(unique(df$y)*margin.table(j,2)/100);mu_y
mean(df$y)

# x,y에 대한 평균
str(df_j)
# factor가 0 1 2로 들어갔는데 as.numeric 바로 해주면 1 2 3으로 인식됨(잘못된 방법)
df_j$x
as.numeric(df_j$x) 

# 올바른 방식
as.numeric(as.character(df_j$x))
df_j$xy <- as.numeric(as.character(df_j$x))*as.numeric(as.character(df_j$y));df_j
mu_xy <- sum(df_j$xy*df_j$prop);mu_xy

# 분산 Var(X): var_x / Var(Y): var_y
var_x <- sum(unique(df$x)^2*margin.table(j,1)/100) - mu_x^2;var_x # 모분산
var(df$x) # 표본 분산
sum((df$x-mean(df$x))^2)/(length(df$x)-1)

var_y <- sum(unique(df$y)^2*margin.table(j,2)/100) - mu_y^2;var_y # 모분산
var(df$y) # 표본 분산
sum((df$y-mean(df$y))^2)/(length(df$y)-1)
