install.packages("plotrix")
library(plotrix)
CvT <- c(Clinton,Trump)
piepercent<- round(100*CvT/sum(CvT), 1)
pie3D(
    CvT,
    labels=paste(piepercent, "%", sep=""),
    col=c("Blue","Red"),
    main="Money Raised by Candidates"
)
legend(
    "topright",
    c("Clinton: $153,190,071", "Trump: $15,082,546"),
    fill=c("Blue","Red"),
    cex = 0.8
)