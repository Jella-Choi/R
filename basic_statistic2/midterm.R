## 1
# H0: mu = 8.5 vs. H1: mu != 8.5
n = 42
xbar = 8.79
sd = 1.27
se = sd/sqrt(n)
mu0 = 8.5
Z = (xbar-mu0)/se

#(1)
Z
alpha = 0.1
z0.05 = qnorm(alpha/2,lower.tail=F)
abs(Z) >= z0.05
# FALSE

#(2)
p_value = 2*pnorm(abs(Z), lower.tail=F); p_value


## 2
n = 2000
x = 165

#(1)
phat = x/n; phat

#(2)
alpha = 0.05
z0.025 = qnorm(alpha/2,lower.tail=F)
se = sqrt(phat*(1-phat)/n)
c(phat-z0.025*se,phat+z0.025*se) 


# 3
# H0: p=0.25 vs H1: p>0.25
n = 130
x = 38
phat = x/n
p0 = 0.25
Z = (phat-p0) / sqrt(p0*(1-p0)/n)
p_value = pnorm(Z,lower.tail=F); p_value


## 4
# H0: mu = 3.5 vs H1: mu > 3.5
n = 18
xbar = 4.1
sd = 1.6
se = sd/sqrt(n) 
mu0 = 3.5
alpha = 0.05

T = (xbar-mu0)/se
t0.05 = qt(p = alpha, df = n-1, lower.tail=F)
T > t0.05
#FALSE


## 5
# H0: mu = 3.5 vs H1: mu != 3.5 
n = 18
xbar = 4.1
sd = 1.6
se = sd/sqrt(n) 
alpha = 0.05
t0.025 = qt(p = alpha/2, df = n-1, lower.tail=F)
c(xbar-t0.025*se, xbar+t0.025*se)


## 6
n = 25
xbar = (106.8+115.2)/2
alpha = 0.05
t0.025 = qt(p = alpha/2, df = n-1, lower.tail=F)

#(1)
s = (115.2-xbar)*sqrt(n)/t0.025; s

#(2)
# H0: sigma = 8.0 vs. H1: sigma > 8.0
sigma0 = 8.0
df = n-1
chi = (n-1)*(s^2)/(sigma0^2)
chi0.05 = qchisq(0.05,df,lower.tail=F)
chi >= chi0.05
# TRUE


## 7
# H0: mu_A - mu_B = 0 vs. H1: mu_A - mu_B > 0
n_A = 12
n_B = 15
xbar_A = 73.9
xbar_B = 62.4
s_A = 3.7
s_B = 5.5
s_A/s_B 
s_A/s_B >= 0.5 & s_A/s_B <=2
s_p = sqrt(((n_A-1)*s_A^2+(n_B-1)*s_B^2)/(n_A+n_B-2))
se = s_p*sqrt(1/n_A+1/n_B)
df = n_A+n_B-2

delta = 0
T = ((xbar_A-xbar_B)-delta)/se; 
t_0.05 = qt(0.05,df,lower.tail=F);t_0.05
T >= t_0.05
# TRUE


## 8
# H0: p1 = p2 vs. H1: p1 > p2 
n1 = 42
n2 = 38
x = 27
y = 14
phat_1 = x/n1
phat_2 = y/n2
phat = (x+y)/(n1+n2)
Z = ((phat_1-phat_2)-0)/sqrt(phat*(1-phat)*(1/n1+1/n2))
p_val = pnorm(Z,lower.tail=F);p_val
