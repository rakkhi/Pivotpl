#2017 data

# Mean of responses by school by Department
###################

S12017MeanSchoolCluster <- aggregate(S12017RespData$answer_num, by = list(S12017RespData$acara_id, S12017RespData$cluster_tag), mean)

## Set column names
colnames(S12017MeanSchoolCluster) <- c("acara_id", "cluster_tag", "answer_num_cluster_mean_school")

## Write this to a file
write.csv(S12017MeanSchoolCluster, file = "C:/users/rakkhi/documents/pivotpl_data/S12017MeanSchoolCluster.csv")

# Merge the mean per dept per school into the main data set
S12017RespData <- merge(x = S12017RespData, y = S12017MeanSchoolCluster, by = c("acara_id", "cluster_tag"), all.x = TRUE)

#####################


# Mean of responses Department
###################

S12017MeanCluster <- aggregate(S12017RespData$answer_num, by = list(S12017RespData$cluster_tag), mean)

## Set column names
colnames(S12017MeanCluster) <- c("cluster_tag", "answer_num_cluster_mean")

## Write this to a file
write.csv(S12017MeanCluster, file = "C:/users/rakkhi/documents/pivotpl_data/S12017MeanCluster.csv")

# Merge the mean per dept into the main data set
S12017RespData <- merge(x = S12017RespData, y = S12017MeanSchoolCluster, by = c("cluster_tag"), all.x = TRUE)

#####################

# Mean of responses Department by Education Standard
###################

S12017MeanClusterEdustd <- aggregate(S12017RespData$answer_num, by = list(S12017RespData$cluster_tag, S12017RespData$question_group_id), mean)

## Set column names
colnames(S12017MeanClusterEdustd) <- c("cluster_tag", "question_group_id", "answer_num_cluster_mean_edustd")

## Write this to a file
write.csv(S12017MeanClusterEdustd, file = "C:/users/rakkhi/documents/pivotpl_data/S12017MeanClusterEdustd.csv")

# Merge the mean per dept into the main data set
S12017RespData <- merge(x = S12017RespData, y = S12017MeanClusterEdustd, by = c("cluster_tag", "question_group_id"), all.x = TRUE)

#####################


# Mean of responses by school by Teacher
####################

#aggreagte by teacher ID
S12017MeanSchoolTeacher <- aggregate(S12017RespData$answer_num, by = list(S12017RespData$acara_id, S12017RespData$school_name, S12017RespData$teacher_id), mean)

# Set column names
colnames(S12017MeanSchoolTeacher) <- c("acara_id", "School Name", "teacher_id", "answer_num_teacher_mean")

## Write this to a file
write.csv(S12017MeanSchoolTeacher, file = "C:/users/rakkhi/documents/pivotpl_data/S12017MeanSchoolTeacher.csv")

################


# Mean of responses by school by Teacher with Dept Mean
####################

#aggreagte by teacher ID
S12017MeanSchoolTeacherDeptComp <- aggregate(S12017RespData$answer_num, by = list(S12017RespData$acara_id, S12017RespData$school_name, S12017RespData$cluster_tag, S12017RespData$teacher_id, S12017RespData$answer_num_cluster_mean), mean)

# Set column names
colnames(S12017MeanSchoolTeacherDeptComp) <- c("acara_id", "School Name", "Dept_Name", "teacher_id", "Dept mean", "answer_num_teacher_mean")

## Write this to a file
write.csv(S12017MeanSchoolTeacherDeptComp, file = "C:/users/rakkhi/documents/pivotpl_data/S12017MeanSchoolTeacherDeptComp.csv")

################


# Mean of responses by school by Teacher with Dept Mean by Education Standard
####################

#aggreagte by teacher ID
S12017MeanSchoolTeacherDeptCompEdustd <- 
  aggregate(S12017RespData$answer_num, by = list(S12017RespData$acara_id, S12017RespData$school_name, S12017RespData$cluster_tag, S12017RespData$teacher_id, S12017RespData$question_group_id, S12017RespData$answer_num_cluster_mean_edustd), mean)

# Set column names
colnames(S12017MeanSchoolTeacherDeptCompEdustd) <- c("acara_id", "School Name", "Dept_Name", "teacher_id", "Edu Std Group", "Edu Std Group Dept mean", "answer_num_teacher_mean")

## Write this to a file
write.csv(S12017MeanSchoolTeacherDeptCompEdustd, file = "C:/users/rakkhi/documents/pivotpl_data/S12017MeanSchoolTeacherDeptCompEdustd.csv")

################


#2018 data

# Mean of responses by school

aggregate(Q12018RespData$answer_num, by = list(Q12018RespData$school_name), mean)

# Mean of responses by school by question grouping (standard)

aggregate(Q12018RespData$answer_num, by = list(Q12018RespData$school_name, Q12018RespData$question_group_id), mean)

# Mean of responses by school by year level

aggregate(Q12018RespData$answer_num, by = list(Q12018RespData$school_name, Q12018RespData$year_level), mean)