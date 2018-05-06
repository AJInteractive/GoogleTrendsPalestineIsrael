######LOAD DEPENDENCIES
#https://github.com/PMassicotte/gtrendsR
#https://datascienceplus.com/analyzing-google-trends-data-in-r/
#https://cran.r-project.org/web/packages/gtrendsR/gtrendsR.pdf

install.packages("gtrendsR")
install.packages("openxlsx")

library(gtrendsR)
library(openxlsx)

#########RUN THE API CALLS TO GET ALL THE DATA
fivetopics <- gtrends(c("Gaza","Israel","Palestine","Jerusalem","facebook"), time = "all")
plot(fivetopics)

toptopics <- gtrends(c("Trump","Facebook","Football"), time = "all")
plot(toptopics)

keyword1 <- gtrends(c("One state solution","Two state solution"), time = "all")
plot(keyword1)

keyword2 <- gtrends(c("Israel Independence","Nakba"), time = "all")
plot(keyword2)

keyword3 <- gtrends(c("Intifada"), time = "all")
plot(keyword3)

keyword4 <- gtrends(c("Israel flag","Palestine flag"), time = "all")
plot(keyword4)

keyword5 <- gtrends(c("Jerusalem","??????????","??????????????"), time = "all")
plot(keyword5)

#2004-11-11
ArafatDeath <- gtrends("Arafat", time = "2004-10-12 2004-12-11")
#2006-07-12	2006-08-14
LebanonWar <- gtrends(c("Lebanon", "Israel", "Hezbollah"), time = "2006-06-12 2006-09-13")
#2007-06-10	2007-06-18
HamasGaza <- gtrends(c("Gaza", "Hamas", "Fatah", "Palestine"), time = "2007-05-11 2007-07-18")
#2008-12-27	2009-01-21
FirstGazaWar <- gtrends(c("Gaza", "Israel", "Hamas", "Palestine"), time = "2008-11-27 2009-02-20")
#2010-05-31
MaviMarmara <- gtrends(c("Gaza", "Israel", "Flotilla", "Palestine"), time = "2010-05-01 2010-06-30")
#2012-11-14	2012-11-21
SecondGazaWar <- gtrends(c("Gaza", "Israel", "Hamas", "Palestine"), time = "2012-10-15 2012-12-21")
#2012-11-29
UNPalestineVote <- gtrends(c("Gaza", "Israel", "Palestine", "UN vote"), time = "2012-10-30 2012-12-29")
#2014-07-08	2014-08-26
ThirdGazaWar <- gtrends(c("Gaza", "Israel", "Hamas", "Palestine"), time = "2014-06-08 2014-09-25")
#2016-12-23
USSettlement <- gtrends(c("Settlements", "Israel", "Palestine", "UN vote"), time = "2016-11-23 2017-01-22")
#2017-12-06
TrumpJerusalem <- gtrends(c("Trump", "Israel", "Palestine", "Jerusalem"), time = "2017-11-06 2018-01-05")
AllData<-c(fivetopics,ArafatDeath,LebanonWar,HamasGaza,FirstGazaWar,MaviMarmara,SecondGazaWar,UNPalestineVote,ThirdGazaWar,USSettlement)

########Clean up data for values that return <1
fivetopics$interest_over_time$hits[fivetopics$interest_over_time$hits=="<1"]<-0
fivetopics$interest_over_time$hits <- as.numeric(fivetopics$interest_over_time$hits)

toptopics$interest_over_time$hits[toptopics$interest_over_time$hits=="<1"]<-0
toptopics$interest_over_time$hits <- as.numeric(toptopics$interest_over_time$hits)

ArafatDeath$interest_over_time$hits[ArafatDeath$interest_over_time$hits=="<1"]<-0
ArafatDeath$interest_over_time$hits <- as.numeric(ArafatDeath$interest_over_time$hits)

LebanonWar$interest_over_time$hits[LebanonWar$interest_over_time$hits=="<1"]<-0
LebanonWar$interest_over_time$hits <- as.numeric(LebanonWar$interest_over_time$hits)

HamasGaza$interest_over_time$hits[HamasGaza$interest_over_time$hits=="<1"]<-0
HamasGaza$interest_over_time$hits <- as.numeric(HamasGaza$interest_over_time$hits)

FirstGazaWar$interest_over_time$hits[FirstGazaWar$interest_over_time$hits=="<1"]<-0
FirstGazaWar$interest_over_time$hits <- as.numeric(FirstGazaWar$interest_over_time$hits)

MaviMarmara$interest_over_time$hits[MaviMarmara$interest_over_time$hits=="<1"]<-0
MaviMarmara$interest_over_time$hits <- as.numeric(MaviMarmara$interest_over_time$hits)

SecondGazaWar$interest_over_time$hits[SecondGazaWar$interest_over_time$hits=="<1"]<-0
SecondGazaWar$interest_over_time$hits <- as.numeric(SecondGazaWar$interest_over_time$hits)

UNPalestineVote$interest_over_time$hits[UNPalestineVote$interest_over_time$hits=="<1"]<-0
UNPalestineVote$interest_over_time$hits <- as.numeric(UNPalestineVote$interest_over_time$hits)

ThirdGazaWar$interest_over_time$hits[ThirdGazaWar$interest_over_time$hits=="<1"]<-0
ThirdGazaWar$interest_over_time$hits <- as.numeric(ThirdGazaWar$interest_over_time$hits)

USSettlement$interest_over_time$hits[USSettlement$interest_over_time$hits=="<1"]<-0
USSettlement$interest_over_time$hits <- as.numeric(USSettlement$interest_over_time$hits)

TrumpJerusalem$interest_over_time$hits[TrumpJerusalem$interest_over_time$hits=="<1"]<-0
TrumpJerusalem$interest_over_time$hits <- as.numeric(TrumpJerusalem$interest_over_time$hits)

#######Store Data In XLSX
fivetopicsData <- list("interest_over_time" = fivetopics$interest_over_time, "interest_by_country" = fivetopics$interest_by_country, "interest_by_region" = fivetopics$interest_by_region, "interest_by_city" = "fivetopics$interest_by_city", "related_topics" = fivetopics$related_topics, "related_queries" = fivetopics$related_queries)
write.xlsx(fivetopicsData, file = "fivetopicsData.xlsx")
ArafatDeathData <- list("interest_over_time" = ArafatDeath$interest_over_time, "interest_by_country" = ArafatDeath$interest_by_country, "interest_by_region" = ArafatDeath$interest_by_region, "interest_by_city" = "ArafatDeath$interest_by_city", "related_topics" = ArafatDeath$related_topics, "related_queries" = ArafatDeath$related_queries)
write.xlsx(ArafatDeathData, file = "ArafatDeathData.xlsx")
LebanonWarData <- list("interest_over_time" = LebanonWar$interest_over_time, "interest_by_country" = LebanonWar$interest_by_country, "interest_by_region" = LebanonWar$interest_by_region, "interest_by_city" = "LebanonWar$interest_by_city", "related_topics" = LebanonWar$related_topics, "related_queries" = LebanonWar$related_queries)
write.xlsx(LebanonWarData, file = "LebanonWarData.xlsx")
HamasGazaData <- list("interest_over_time" = HamasGaza$interest_over_time, "interest_by_country" = HamasGaza$interest_by_country, "interest_by_region" = HamasGaza$interest_by_region, "interest_by_city" = "HamasGaza$interest_by_city", "related_topics" = HamasGaza$related_topics, "related_queries" = HamasGaza$related_queries)
write.xlsx(HamasGazaData, file = "HamasGazaData.xlsx")
FirstGazaWarData <- list("interest_over_time" = FirstGazaWar$interest_over_time, "interest_by_country" = FirstGazaWar$interest_by_country, "interest_by_region" = FirstGazaWar$interest_by_region, "interest_by_city" = "FirstGazaWar$interest_by_city", "related_topics" = FirstGazaWar$related_topics, "related_queries" = FirstGazaWar$related_queries)
write.xlsx(FirstGazaWarData, file = "FirstGazaWarData.xlsx")
MaviMarmaraData <- list("interest_over_time" = MaviMarmara$interest_over_time, "interest_by_country" = MaviMarmara$interest_by_country, "interest_by_region" = MaviMarmara$interest_by_region, "interest_by_city" = "MaviMarmara$interest_by_city", "related_topics" = MaviMarmara$related_topics, "related_queries" = MaviMarmara$related_queries)
write.xlsx(MaviMarmaraData, file = "MaviMarmaraData.xlsx")
SecondGazaWarData <- list("interest_over_time" = SecondGazaWar$interest_over_time, "interest_by_country" = SecondGazaWar$interest_by_country, "interest_by_region" = SecondGazaWar$interest_by_region, "interest_by_city" = "SecondGazaWar$interest_by_city", "related_topics" = SecondGazaWar$related_topics, "related_queries" = SecondGazaWar$related_queries)
write.xlsx(SecondGazaWarData, file = "SecondGazaWarData.xlsx")
UNPalestineVoteData <- list("interest_over_time" = UNPalestineVote$interest_over_time, "interest_by_country" = UNPalestineVote$interest_by_country, "interest_by_region" = UNPalestineVote$interest_by_region, "interest_by_city" = "UNPalestineVote$interest_by_city", "related_topics" = UNPalestineVote$related_topics, "related_queries" = UNPalestineVote$related_queries)
write.xlsx(UNPalestineVoteData, file = "UNPalestineVoteData.xlsx")
ThirdGazaWarData <- list("interest_over_time" = ThirdGazaWar$interest_over_time, "interest_by_country" = ThirdGazaWar$interest_by_country, "interest_by_region" = ThirdGazaWar$interest_by_region, "interest_by_city" = "ThirdGazaWar$interest_by_city", "related_topics" = ThirdGazaWar$related_topics, "related_queries" = ThirdGazaWar$related_queries)
write.xlsx(ThirdGazaWarData, file = "ThirdGazaWarData.xlsx")
USSettlementData <- list("interest_over_time" = USSettlement$interest_over_time, "interest_by_country" = USSettlement$interest_by_country, "interest_by_region" = USSettlement$interest_by_region, "interest_by_city" = "USSettlement$interest_by_city", "related_topics" = USSettlement$related_topics, "related_queries" = USSettlement$related_queries)
write.xlsx(USSettlementData, file = "USSettlementData.xlsx")
TrumpJerusalemData <- list("interest_over_time" = TrumpJerusalem$interest_over_time, "interest_by_country" = TrumpJerusalem$interest_by_country, "interest_by_region" = TrumpJerusalem$interest_by_region, "interest_by_city" = "TrumpJerusalem$interest_by_city", "related_topics" = TrumpJerusalem$related_topics, "related_queries" = TrumpJerusalem$related_queries)
write.xlsx(TrumpJerusalemData, file = "TrumpJerusalemData.xlsx")

#######Plot all the data
plot(fivetopics)
plot(ArafatDeath)
plot(LebanonWar)
plot(HamasGaza)
plot(FirstGazaWar)
plot(MaviMarmara)
plot(SecondGazaWar)
plot(UNPalestineVote)
plot(ThirdGazaWar)
plot(USSettlement)
plot(TrumpJerusalem)

######FILTER COUNTRY DATA
countries<-c("AF","AL","DZ","AO","AR","AM","AU","AT","AZ","BH","BD","BY","BE","BJ","BM","BT","BO","BA","BW","BR","BN","BG","BF","BI","KH","CM","CA","CF","TD","CL","CN","CO","KM","CG","CD","CR","CI","HR","CU","CY","CZ","DK","DJ","DO","EC","EG","SV","GQ","EE","ET","FI","FR","GA","GM","GE","DE","GH","GR","GL","GT","GN","GW","HT","HN","HK","HU","IS","IN","IR","IQ","IE","IL","IT","JM","JP","JO","KZ","KE","KW","KG","LA","LV","LB","LS","LR","LY","LT","LU","MK","MG","MW","MY","ML","MT","MR","MX","MD","MC","MN","ME","MA","MZ","MM","NP","NL","NZ","NI","NE","NG","KP","NO","OM","PK","PS","PA","PY","PE","PH","PL","PT","PR","QA","RO","RU","RW","SA","SN","RS","SC","SL","SG","SK","SI","SO","ZA","KR","SS","ES","LK","SD","SZ","SE","CH","SY","TW","TJ","TZ","TH","TG","TT","TN","TR","TM","UG","UA","AE","GB","US","UY","UZ","VA","VE","VN","YE","ZM","ZW")
length(countries)
countriesIsrael<- vector(mode="numeric", length=0)
countriesPalestine<- x <- vector(mode="numeric", length=0)

for (i in countries[1:166]){
  counts<-gtrends(c("Israel","Palestine"), geo = i, time = "all")
  if (!is.null(counts$interest_over_time)){
    counts$interest_over_time$hits[counts$interest_over_time$hits=="<1"]<-1
    counts$interest_over_time$hits <- as.numeric(counts$interest_over_time$hits)
    tempvarIS <- subset(counts$interest_over_time, keyword=="Israel")
    countriesIsrael[i] <- mean(tempvarIS$hits)
    tempvarPS <- subset(counts$interest_over_time, keyword=="Palestine")
    countriesPalestine[i] <- mean(tempvarPS$hits)
  }else{
    countriesIsrael[i] <- 0
    countriesPalestine[i] <- 0
  }
}

unname(countriesPalestine)
unname(countriesIsrael)