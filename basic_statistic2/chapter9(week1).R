## week1
# 중심극한정리 예제

# 지수분포 
par(mfrow = c(1, 2))
hist(rexp(10000,10))
curve(dexp(x,10))

#30회의 평균
par(mfrow = c(1, 2))
no <- 30
m <- rep(NA, no)
for(i in 1:no){
  m[i] <- mean(rexp(30, 10))
}
hist(m, prob= T, col = 'wheat')
hist(scale(m), prob= T, col = 'skyblue')
curve(dnorm(x, 0, 1), -3, 3, col = 'red', add = TRUE)

#100회의 평균
par(mfrow = c(1, 2))
no <- 100
m <- rep(NA, no)
for(i in 1:no){
  m[i] <- mean(rexp(30, 10))
}
hist(m, prob= T, col = 'wheat')
hist(scale(m), prob= T, col = 'skyblue')
curve(dnorm(x, 0, 1), -3, 3, col = 'red', add = TRUE)


#10000개의 평균
par(mfrow = c(1, 2))
no <- 10000
m <- rep(NA, no)
for(i in 1:no){
  m[i] <- mean(rexp(30, 10))
}
hist(m, prob= T, col = 'wheat')
hist(scale(m), prob= T, col = 'skyblue')
curve(dnorm(x, 0, 1), -3, 3, col = 'red', add = TRUE)


# 예제 1 ] 복원추출 10회 반복, 10개의 표본평균 히스토그램 생성
set.seed(319)
xbar = c()
for(i in 1:10){
  xbar[i] = mean(sample(1:10,5,replace=T))
}
hist(xbar)

## 각 분포에서 난수 추출 함수
# 정규분포: rnorm(표본수, 평균, 표준편차)
rnorm(5,0,1)

# 이항분포: rbinom(표본수, 전체시행수, 성공확률)
rbinom(5,2,0.5)

# 포아송분포: rpois(표본수, 평균)
rpois(5,5)

# 카이제곱분포: rchisq(표본수, 자유도)
rchisq(5,1)


### 중심극한정리(CLT)
# 예제 2] 정규 모집단에서 표본평균 분포
x_norm = c()
for(i in 1:1000){
  x_norm[i] = mean(rnorm(5,5,2))
}
hist(x_norm)

x_norm = c()
for(i in 1:1000){
  x_norm[i] = mean(rnorm(30,5,2))
}
hist(x_norm)

# 예제 3] 비대칭형 모집단에서 표본평균 분포
x_pois = c()
for(i in 1:1000){
  x_pois[i] = mean(rpois(5,1))
}
hist(x_pois)

x_pois = c()
for(i in 1:1000){
  x_pois[i] = mean(rpois(30,1))
}
hist(x_pois)  

# 예제 4] 카이제곱분포(모집단)에서 표본평균 분포
x_chi = c()
for (i in 1:1000){
  x_chi[i] = mean(rchisq(5,1))
}
hist(x_chi)

x_chi = c()
for (i in 1:1000){
  x_chi[i] = mean(rchisq(100,1))
}
hist(x_chi)

## 결론 - [CLT] 모집단이 정규분포 따르지 않아도 n 이 충분히 클때 표본평균이 정규분포 따름

