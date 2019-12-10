folder=read.table("folder.txt")
data=list(folder[,1])

allscore=c()
a <- NULL
for(i in 1:length(folder[,1])){
  d=read.csv(paste(as.character(folder[i,1]),".csv",sep=""))
  #gamemode=HOSTAGE,operator=BOPE-CAVEIRA,skillrank=Gold,role=attacker,primaryweapon=Shotgun,secondaryweapon=Submachine_Guns
  score=d[1,2]+d[2,2]+d[18,2]+d[41,2]+d[51,2]
  allscore=c(allscore,score)
}
a <- cbind(a,1/(1+exp(1)^(-allscore)))
for(j in c(45,46,47,48,49)){
  allscore=c()
  for(i in 1:length(folder[,1])){
    d=read.csv(paste(as.character(folder[i,1]),".csv",sep=""))
    #gamemode=HOSTAGE,operator=BOPE-CAVEIRA,skillrank=Gold,role=attacker,primaryweapon=Shotgun,secondaryweapon=Submachine_Guns
    score=d[1,2]+d[2,2]+d[18,2]+d[41,2]+d[j,2]+d[51,2]
    allscore=c(allscore,score)
  }
  a <- cbind(a,1/(1+exp(1)^(-allscore)))
}
a <- data.frame(a)
colnames(a) <- c("pistol","Light_MGuns","Rifles","Shield","Shotguns","Sub_MGuns")

## Compare with platform
plot(1:16,a[1:16,1],xlim = c(1,48),ylim = c(0.5,0.8),pch = 18,xlab = 'map',ylab = 'Prob',xaxt="n")
title('Platfrom V.S Prob of win')
points(17:32,a[17:32,1],col = 'blue',pch = 18)
points(33:48,a[33:48,1],col = 'red',pch = 18)
legend("topright",pch=18,col=c("red","blue","black"),legend = c("XONE","PS4","PC"),cex = 0.5)

##Compare with weapons
plot(1:6,a[1,],xlim = c(1,6),ylim = c(0.5,0.7),pch = 18,xlab = '',ylab = 'Prob',xaxt="n")
title("Weapons V.S Prob of win")
points(1:6,a[17,],col = 'blue',pch = 18)
points(1:6,a[33,],col = 'red',pch = 18)
axis(1,at=1:6,labels=colnames(a),las = 3,cex.axis=0.7) 
legend("topright",pch=18,col=c("red","blue","black"),legend = c("XONE_COASTLINE","PS4_COASTLINE","PC_COASTLINE"),cex = 0.5)

allscore=c()
a <- NULL
for(i in 1:length(folder[,1])){
  d=read.csv(paste(as.character(folder[i,1]),".csv",sep=""))
  #gamemode=HOSTAGE,operator=BOPE-CAVEIRA,skillrank=Gold,role=attacker,primaryweapon=Shotgun,secondaryweapon=Submachine_Guns
  score=d[1,2]+d[2,2]+d[18,2]+d[41,2]+d[49,2]+d[51,2]
  allscore=c(allscore,score)
}
a <- cbind(a,1/(1+exp(1)^(-allscore)))
for(j in c(2,3)){
  allscore=c()
  for(i in 1:length(folder[,1])){
    d=read.csv(paste(as.character(folder[i,1]),".csv",sep=""))
    #gamemode=HOSTAGE,operator=BOPE-CAVEIRA,skillrank=Gold,role=attacker,primaryweapon=Shotgun,secondaryweapon=Submachine_Guns
    score=d[1,2]+d[j,2]+d[18,2]+d[41,2]+d[j,2]+d[51,2]
    allscore=c(allscore,score)
  }
  a <- cbind(a,1/(1+exp(1)^(-allscore)))
}
a <- data.frame(a)
colnames(a) <- c("BOMB","HOSTAGE","SECURE_AREA")


##Compare with gomode
plot(1:3,a[1,],xlim = c(1,3),ylim = c(0.5,0.7),pch = 18,xlab = '',ylab = 'Prob',xaxt="n")
title("GameMode V.S Prob of win")
points(1:3,a[17,],col = 'blue',pch = 18)
points(1:3,a[33,],col = 'red',pch = 18)
axis(1,at=1:3,labels=colnames(a),las = 3,cex.axis=0.7) 
legend("topright",pch=18,col=c("red","blue","black"),legend = c("XONE_COASTLINE","PS4_COASTLINE","PC_COASTLINE"),cex = 0.5)


## operator
allscore=c()
a <- NULL
for(i in 1:length(folder[,1])){
  d=read.csv(paste(as.character(folder[i,1]),".csv",sep=""))
  #gamemode=HOSTAGE,operator=BOPE-CAVEIRA,skillrank=Gold,role=attacker,primaryweapon=Shotgun,secondaryweapon=Submachine_Guns
  score=d[1,2]+d[2,2]+d[41,2]+d[49,2]+d[51,2]
  allscore=c(allscore,score)
}
a <- cbind(a,1/(1+exp(1)^(-allscore)))
for(j in c(4:37)){
  allscore=c()
  for(i in 1:length(folder[,1])){
    d=read.csv(paste(as.character(folder[i,1]),".csv",sep=""))
    #gamemode=HOSTAGE,operator=BOPE-CAVEIRA,skillrank=Gold,role=attacker,primaryweapon=Shotgun,secondaryweapon=Submachine_Guns
    score=d[1,2]+d[2,2]+d[j,2]+d[41,2]+d[49,2]+d[51,2]
    allscore=c(allscore,score)
  }
  a <- cbind(a,1/(1+exp(1)^(-allscore)))
}
a <- data.frame(a)

plot(1:35,a[1,],xlim = c(1,35),ylim = c(0.45,0.7),pch = 18,xlab = '',ylab = 'Prob')
lines(1:35,a[1,])
title("Operators V.S Prob of win")
points(1:35,a[17,],col = 'blue',pch = 18)
lines(1:35,a[17,],col = "blue")
points(1:35,a[33,],col = 'red',pch = 18)
lines(1:35,a[33,],col = 'red')
legend("topright",pch=18,col=c("red","blue","black"),legend = c("XONE_COASTLINE","PS4_COASTLINE","PC_COASTLINE"),cex = 0.5)



## rank
allscore=c()
a <- NULL
for(i in 1:length(folder[,1])){
  d=read.csv(paste(as.character(folder[i,1]),".csv",sep=""))
  #gamemode=HOSTAGE,operator=BOPE-CAVEIRA,skillrank=Gold,role=attacker,primaryweapon=Shotgun,secondaryweapon=Submachine_Guns
  score=d[1,2]+d[2,2]+d[4,2]+d[49,2]+d[51,2]
  allscore=c(allscore,score)
}
a <- cbind(a,1/(1+exp(1)^(-allscore)))
for(j in c(38:43)){
  allscore=c()
  for(i in 1:length(folder[,1])){
    d=read.csv(paste(as.character(folder[i,1]),".csv",sep=""))
    #gamemode=HOSTAGE,operator=BOPE-CAVEIRA,skillrank=Gold,role=attacker,primaryweapon=Shotgun,secondaryweapon=Submachine_Guns
    score=d[1,2]+d[2,2]+d[4,2]+d[j,2]+d[49,2]+d[51,2]
    allscore=c(allscore,score)
  }
  a <- cbind(a,1/(1+exp(1)^(-allscore)))
}
a <- data.frame(a)
colnames(a) <- c("Bronze","Copper", "Diamond","Gold", "Platinum","Silver","Unranked") 

plot(1:7,(a[1,])[c(7,1,2,6,4,5,3)],xlim = c(1,7),ylim = c(0.45,0.7),pch = 18,xlab = '',ylab = 'Prob',xaxt="n")
#lines(1:7,a[1,])
title("Rank V.S Prob of win")
points(1:7,(a[17,])[c(7,1,2,6,4,5,3)],col = 'blue',pch = 18)
#lines(1:7,a[17,],col = 'blue')
points(1:7,(a[33,])[c(7,1,2,6,4,5,3)],col = 'red',pch = 18)
#lines(1:7,a[33,],col = 'red')
axis(1,at=1:7,labels=(colnames(a))[c(7,1,2,6,4,5,3)],las = 3,cex.axis=0.7) 
legend("topright",pch=18,col=c("red","blue","black"),legend = c("XONE_COASTLINE","PS4_COASTLINE","PC_COASTLINE"),cex = 0.5)
