rm(list=ls())

args = (commandArgs(trailingOnly = TRUE))
setwd(args[1])
name = list.files()
data <- read.csv(name[1])
obj <- glm(data[,16] ~ data[,4]+data[,17]+data[,13]+data[,14]+data[,21]+data[,27],family=binomial())
s <- summary(obj)
ss <- data.frame(s$coefficients)
file_name=paste("../",args[1],".csv",sep="")
write.csv(ss,file_name,row.names=c("(Intercept)","data$gamemodeHOSTAGE","data$gamemodeSECURE_AREA","data$operatorBOPE-CAVEIRA","data$operatorG.E.O.-JACKAL" ,              "data$operatorG.E.O.-MIRA"                
                                             ,"data$operatorGIGN-DOC"                   , "data$operatorGIGN-MONTAGNE"        ,       "data$operatorGIGN-RESERVE"               
                                             ,"data$operatorGIGN-ROOK"                  , "data$operatorGIGN-TWITCH"           ,      "data$operatorGSG9-BANDIT"                
                                             ,"data$operatorGSG9-BLITZ"                 , "data$operatorGSG9-IQ"                ,     "data$operatorGSG9-JAGER"                 
                                             ,"data$operatorGSG9-RESERVE"               , "data$operatorJTF2-BUCK"               ,    "data$operatorJTF2-FROST"                 
                                             ,"data$operatorNAVYSEAL-BLACKBEARD"        , "data$operatorNAVYSEAL-VALKYRIE"        ,   "data$operatorSAS-MUTE"                   
                                             ,"data$operatorSAS-RESERVE"                , "data$operatorSAS-SLEDGE"                ,  "data$operatorSAS-SMOKE"                  
                                             ,"data$operatorSAS-THATCHER"               , "data$operatorSAT-ECHO"                   , "data$operatorSAT-HIBANA"                 
                                             ,"data$operatorSPETSNAZ-FUZE"              , "data$operatorSPETSNAZ-GLAZ"              , "data$operatorSPETSNAZ-KAPKAN"            
                                             ,"data$operatorSPETSNAZ-RESERVE"           , "data$operatorSPETSNAZ-TACHANKA"          , "data$operatorSWAT-ASH"                   
                                             ,"data$operatorSWAT-CASTLE"                , "data$operatorSWAT-PULSE"                 , "data$operatorSWAT-RESERVE"               
                                             ,"data$operatorSWAT-THERMITE"              , "data$skillrankCopper"                    , "data$skillrankDiamond"                   
                                             ,"data$skillrankGold"                     ,  "data$skillrankPlatinum"                  , "data$skillrankSilver"                    
                                             ,"data$skillrankUnranked"                ,   "data$roleDefender"                       , "data$primaryweapontypeLight_Machine_Guns"
                                             ,"data$primaryweapontypeMarksman_Rifles",    "data$primaryweapontypeShield"             ,"data$primaryweapontypeShotguns"          
                                             ,"data$primaryweapontypeSubmachine_Guns"    ,"data$secondaryweapontypeShotguns"        , "data$secondaryweapontypeSubmachine_Guns"))
