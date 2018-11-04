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