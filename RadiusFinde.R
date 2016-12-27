###DopeSchoolFinder 
# Lets grab the school and district information to find all schools
# and subsequent districts near a given school! ###

NcesSchools <- read.csv(file.choose(), header = TRUE)

#insert School LEAID that you would like to test distance

schoolLEAID <- as.numeric(readline(prompt = "LEAID? :: "))

# find school and extract longlat
school <- subset(NcesSchools, NCESSCH %in% schoolLEAID)

NcesSchools$goLong <- abs(NcesSchools$LONGCODE - school$LONGCODE)*69
NcesSchools$niceLats <- abs(NcesSchools$LATCODE - school$LATCODE)*69
NcesSchools$distance <- NcesSchools$goLong + NcesSchools$niceLats

# get schools within radius
radius <- as.numeric(readline(prompt = "Distance from school :: "))
ListoSchools <- subset(NcesSchools, distance <= radius)

write.csv(ListoSchools, "schoolsCloseBy.csv")

