library(readxl)


s1 = read_excel("AT1 banche europee.xlsx", sheet=1)
str(s1)

s1=subset(s1, select = -c(4, 7,14))
s1=na.omit(s1)

s1$`Issue Date`=as.Date(s1$`Issue Date`)
s1$Coupon=as.numeric(s1$Coupon)
s1$`Amount Issued (EUR)`=as.numeric(s1$`Amount Issued (EUR)`)
s1=na.omit(s1)

#plot of coupons of every bank
plot(s1$`Issue Date`,s1$Coupon)
filtered_dates <- s1[as.Date(s1$`Issue Date`) >= as.Date("2018-01-01") & as.Date(s1$`Issue Date`) <= Sys.Date(),]
plot(filtered_dates$`Issue Date`,filtered_dates$Coupon, main='Coupons of AT1 bonds', xlab = 'Date', ylab='Coupon')

#s2 = read_excel("AT1 banche europee.xlsx", sheet=2, skip=5)
#str(s2)
#s2=subset(s2, select = -c(1,2,3,12,24))
#s2[, -1]=lapply(s2[, -1], as.numeric)
#s2=na.omit(s2)

s3 = read_excel("AT1 banche europee.xlsx", sheet=3, skip=5)
str(s3)
s3=subset(s3, select = -c(9,21))
s3[, -1]=lapply(s3[, -1], as.numeric)
s3=na.omit(s3)

#plot of some YtM of CS's AT1
plot(s3$Dates, s3$YLD_YTM_MID...2, type = 'l', main = "YtM of 5 CS's AT1", xlab = 'Date', ylab = 'Yield to maturity', ylim = c(0, 200))
lines(s3$Dates, s3$YLD_YTM_MID...3, col = 'red')
lines(s3$Dates, s3$YLD_YTM_MID...4, col = 'blue')
lines(s3$Dates, s3$YLD_YTM_MID...5, col = 'green')
lines(s3$Dates, s3$YLD_YTM_MID...6, col = 'orchid2')
legend("topleft", legend = c('US22546DAB29 Corp', 'US225401AX66 Corp', 'XS1076957700 Corp', 'USH3698DBZ62 Corp', 'US225401AR98 Corp'), fill = c('black', 'red', 'blue', 'green', 'orchid2'))

#Datasets from Investing about the main EU index
it=na.omit(read.csv('FTSE MIB Dati Storici.csv'))
uk=na.omit(read.csv('FTSE 100 Dati Storici.csv'))
fr=na.omit(read.csv('CAC 40 Dati Storici.csv'))
ge=na.omit(read.csv('DAX Dati Storici.csv'))
sv=na.omit(read.csv('SMI Dati Storici.csv'))

r_it=rev(as.numeric(gsub(",",".",gsub("%","",it$Var...))))
r_uk=rev(as.numeric(gsub(",",".",gsub("%","",uk$Var...))))
r_fr=rev(as.numeric(gsub(",",".",gsub("%","",fr$Var...))))
r_ge=rev(as.numeric(gsub(",",".",gsub("%","",ge$Var...))))
r_sv=rev(as.numeric(gsub(",",".",gsub("%","",sv$Var...))))


plot(s3$Dates[-41],r_it,type='l',main='FTSE MIB',xlab = 'Date', ylab = 'Performance(%)') #41 is the line of 26/12
abline(h=0)
plot(s3$Dates[-c(41,42,46)],r_uk,type='l',main='FTSE 100',xlab = 'Date', ylab = 'Performance(%)') #42 is the line of 27/12,46 of 02/01
abline(h=0)
plot(s3$Dates[-41],r_fr,type='l',main='CAC 40',xlab = 'Date', ylab = 'Performance(%)')
abline(h=0)
plot(s3$Dates[-41],r_ge,type='l',main='DAX',xlab = 'Date', ylab = 'Performance(%)')
abline(h=0)
plot(s3$Dates[-c(41,46)],r_sv,type='l',main='SMI',xlab = 'Date', ylab = 'Performance(%)')
abline(h=0)

 
