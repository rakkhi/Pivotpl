# Req: Here is how your Department X compares with all other Department X's across the Pivot dataset

#instaling package to allow easy read of a properties file containing file names
install.packages("properties")
library(properties)

#read in properties file
myProps <- read.properties("properties.yaml")

#read in data file
RespData <- read.csv(myProps$datafile)

# Create a new column to store the answer data as numeric
RespData$answer_num<-NA

# Convert responses to numeric
RespData$answer_num <-
  ifelse(RespData$answer == 'Strongly disagree', 1,
         ifelse(RespData$answer == 'Disagree', 2,
                ifelse(RespData$answer == 'Neither agree nor disagree', 3,
                       ifelse(RespData$answer == 'Agree', 4,
                              ifelse(RespData$answer == 'Strongly agree', 5, 0)
                       )
                )
         )
  )

#calculate the average response score per department across the dataset
MeanDeptScore <- aggregate(RespData$answer_num, by = list(RespData$cluster_tag), mean)

# Set column names
colnames(MeanDeptScore) <- c("cluster_tag", "MeanDeptScore")

# Merge the mean per dept into the main data set
RespData <- merge(x = RespData, y = MeanDeptScore, by = c("cluster_tag"), all.x = TRUE)

#show column headers test
#colnames(RespData)

#calculate the average response score per department per school
MeanDeptScorePerSchool <- aggregate(RespData$answer_num, by = list(RespData$acara_id, RespData$school_name, RespData$cluster_tag, RespData$MeanDeptScore ), mean)

# Set column names
colnames(MeanDeptScorePerSchool) <- c("ACARA School ID", "School Name", "Department", "Overall Average for Department", "Average for Dept for School")

# Write this the output file
write.csv(MeanDeptScorePerSchool, file = myProps$outputfile)

#Loop through all schools in dataset producing a plot for each
for(i in unique(MeanDeptScorePerSchool$`ACARA School ID`)) {
  
  ## alternative run for single school
  ## i = 40309
  
  #select a single school
  SingleSchool <- subset(MeanDeptScorePerSchool, MeanDeptScorePerSchool$`ACARA School ID` == i)

  #remove school id and name columns
  SingleSchool<-SingleSchool[,3:length(SingleSchool)]
  
  #reshape data to be in long format
  library(reshape2)
  SingleSchoolLong <- melt(SingleSchool, id.var = "Department")
  
  #create graph
  library(ggplot2)
  SingleSchoolPlot <- ggplot(SingleSchoolLong, aes(x = Department, y = value, fill = variable)) +
    scale_fill_discrete(name="Legend:",
                         labels=c("Average across Pivot", "Average for School"),
                         guide = guide_legend()) +
    theme(legend.position="bottom",
          axis.text.x = element_text(angle = 90, hjust = 1)) + 
    labs(y = "Average Response") +
    labs(title = "Student Response per Department vs. Pivot Average ") + 
    geom_bar(stat = "identity", position = "dodge")
  
  #write plot to file
  ggsave(paste(i,"DeptComp.png", sep="_"), plot=SingleSchoolPlot, path=myProps$imageDir, device="png")
}



