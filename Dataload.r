#2017 data
# Read in the data files
S12017RespData <- read.csv("C:/users/rakkhi/documents/pivotpl_data/acara_exports/all_responses_2017-01-01_2017-07-23.csv")

#show rowcount
nrow(S12017RespData)

#Remove test data for Fake high school and Australia High School 
S12017RespData <- S12017RespData[!(S12017RespData$acara_id==110),]
S12017RespData <- S12017RespData[complete.cases(S12017RespData$acara_id),]

#show rowcount
nrow(S12017RespData)

#show column headers test
colnames(S12017RespData)

# Remove the meta columns:
S12017RespData <- S12017RespData[ -c (21:42)]

#show column headers test
colnames(S12017RespData)

# Create a new column to store the answer data as numeric
S12017RespData$answer_num<-NA

# Convert responses to numeric
S12017RespData$answer_num <-
  ifelse(S12017RespData$answer == 'Strongly disagree', 1,
         ifelse(S12017RespData$answer == 'Disagree', 2,
                ifelse(S12017RespData$answer == 'Neither agree nor disagree', 3,
                       ifelse(S12017RespData$answer == 'Agree', 4,
                              ifelse(S12017RespData$answer == 'Strongly agree', 5, 0)
                       )
                )
         )
  )

#show column headers test
colnames(S12017RespData)

#show response_num data test
S12017RespData$answer_num


#2018 data
# Read in the data files
Q12018RespData <- read.csv("C:/users/rakkhi/documents/pivotpl_data/all_responses_2018-01-01_2018-04-12.csv")

# Remove the meta columns:
Q12018RespData <- Q12018RespData[ -c (17:40)]

# Create a new column to store the answer data as numeric
Q12018RespData$answer_num<-NA

# Convert responses to numeric
Q12018RespData$answer_num <-
  ifelse(Q12018RespData$answer == 'Strongly disagree', 1,
    ifelse(Q12018RespData$answer == 'Disagree', 2,
      ifelse(Q12018RespData$answer == 'Neither agree nor disagree', 3,
        ifelse(Q12018RespData$answer == 'Agree', 4,
          ifelse(Q12018RespData$answer == 'Strongly agree', 5, 0)
        )
      )
    )
  )

#show column headers test
colnames(Q12018RespData)

#show response_num data test
Q12018RespData$answer_num

#show rowcount
nrow(Q12018RespData)