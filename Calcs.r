# Mean of responses by school

aggregate(Q12018RespData$answer_num, by = list(Q12018RespData$school_name), mean)

# Mean of responses by school by question grouping (standard)

aggregate(Q12018RespData$answer_num, by = list(Q12018RespData$school_name, Q12018RespData$question_group_id), mean)

# Mean of responses by school by year level

aggregate(Q12018RespData$answer_num, by = list(Q12018RespData$school_name, Q12018RespData$year_level), mean)