

#datos inicio
Seasons <- c("2005","2006","2007","2008","2009","2010","2011","2012","2013","2014")

Players <- c("KobeBryant","JoeJohnson","LeBronJames","CarmeloAnthony","DwightHoward","ChrisBosh","ChrisPaul","KevinDurant","DerrickRose","DwayneWade")

KobeBryant_FT <- c(696,667,623,483,439,483,381,525,18,196)
JoeJohnson_FT <- c(261,235,316,299,220,195,158,132,159,141)
LeBronJames_FT <- c(601,489,549,594,593,503,387,403,439,375)
CarmeloAnthony_FT <- c(573,459,464,371,508,507,295,425,459,189)
DwightHoward_FT <- c(356,390,529,504,483,546,281,355,349,143)
ChrisBosh_FT <- c(474,463,472,504,470,384,229,241,223,179)
ChrisPaul_FT <- c(394,292,332,455,161,337,260,286,295,289)
KevinDurant_FT <- c(209,209,391,452,756,594,431,679,703,146)
DerrickRose_FT <- c(146,146,146,197,259,476,194,322,27,152)
DwayneWade_FT <- c(629,432,354,590,534,494,235,308,189,284)



#creamos la matriz
FreeThrows <- rbind(KobeBryant_FT, JoeJohnson_FT, LeBronJames_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, ChrisPaul_FT, KevinDurant_FT, DerrickRose_FT, DwayneWade_FT)
#eliminamos antiguo
rm(KobeBryant_FT, JoeJohnson_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, LeBronJames_FT, ChrisPaul_FT, DerrickRose_FT, DwayneWade_FT, KevinDurant_FT)
#asignamos nombres
colnames(FreeThrows) <- Seasons
rownames(FreeThrows) <- Players

FreeThrows






#igual que antes
KobeBryant_FTA <- c(819,768,742,564,541,583,451,626,21,241)
JoeJohnson_FTA <- c(330,314,379,362,269,243,186,161,195,176)
LeBronJames_FTA <- c(814,701,771,762,773,663,502,535,585,528)
CarmeloAnthony_FTA <- c(709,568,590,468,612,605,367,512,541,237)
DwightHoward_FTA <- c(598,666,897,849,816,916,572,721,638,271)
ChrisBosh_FTA <- c(581,590,559,617,590,471,279,302,272,232)
ChrisPaul_FTA <- c(465,357,390,524,190,384,302,323,345,321)
KevinDurant_FTA <- c(256,256,448,524,840,675,501,750,805,171)
DerrickRose_FTA <- c(205,205,205,250,338,555,239,512,32,187)
DwayneWade_FTA <- c(803,535,467,771,702,652,297,425,258,370)



FreeThrowAttempts <- rbind(KobeBryant_FTA, JoeJohnson_FTA, LeBronJames_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, ChrisPaul_FTA, KevinDurant_FTA, DerrickRose_FTA, DwayneWade_FTA)
rm(KobeBryant_FTA, JoeJohnson_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, LeBronJames_FTA, ChrisPaul_FTA, DerrickRose_FTA, DwayneWade_FTA, KevinDurant_FTA)
colnames(FreeThrowAttempts) <- Seasons
rownames(FreeThrowAttempts) <- Players

FreeThrowAttempts






#funcion para crear grafico
myplot <- function(z, who=1:10) {
  matplot(t(z[who,,drop=F]), type="b", pch=15:18, col=c(1:4,6), 
          main="Basketball Players Analysis")
  legend("bottomleft",text.font = 1, cex = 0.5, inset=0.01, 
         legend=Players[who], col=c(1:4,6), pch=15:18, horiz=F)
}



print(class(FreeThrows))
#traspone la matriz
FreeThrows
t(FreeThrows[1:10,,drop=F])




#diferentes graficos
myplot(FreeThrows)
myplot(FreeThrowAttempts)

ratio<-FreeThrowAttempts/Games
ratio

myplot(FreeThrowAttempts/Games)

myplot(FreeThrows/FreeThrowAttempts)

myplot(FieldGoals/FieldGoalAttempts)

myplot((Points-FreeThrows)/FieldGoals)






#buscar jugador con mas ratio de acierto en free throws
print(class(FreeThrows))
print(class(FreeThrowAttempts))
ratio_free<-FreeThrows/FreeThrowAttempts
ratio_free


medias_ratio <- rowMeans(ratio_free)
medias_ratio


maximo_ratio<-names(medias_ratio)[which.max(medias_ratio)]
print(paste("Jugador con mayor ratio de acierto en tiros libres:", maximo_ratio))


