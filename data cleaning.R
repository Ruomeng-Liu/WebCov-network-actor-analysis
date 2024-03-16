library(dplyr)
library(tidyr)
library(readr)
library(igraph)

file_path_user <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/user.csv"
file_path_201912 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2019-12.csv"
file_path_202001 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-01.csv"
file_path_202002 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-02.csv"
file_path_202003 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-03.csv"
file_path_202004 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-04.csv"
file_path_202005 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-05.csv"
file_path_202006 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-06.csv"
file_path_202007 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-07.csv"
file_path_202008 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-08.csv"
file_path_202009 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-09.csv"
file_path_202010 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-10.csv"
file_path_202011 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-11.csv"
file_path_202012 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-12.csv"




data_201912 <- read.csv(file_path_201912)
data_202001 <- read.csv(file_path_202001)
data_202002 <- read.csv(file_path_202002)
data_202003 <- read.csv(file_path_202003)
data_202004 <- read.csv(file_path_202004)
data_202005 <- read.csv(file_path_202005)
data_202006 <- read.csv(file_path_202006)
data_202007 <- read.csv(file_path_202007)
data_202008 <- read.csv(file_path_202008)
data_202009 <- read.csv(file_path_202009)
data_202010 <- read.csv(file_path_202010)
data_202011 <- read.csv(file_path_202011)
data_202012 <- read.csv(file_path_202012)



data_user <- read.csv(file_path_user)





# 循环读取并合并月度数据
monthly_data <- lapply(201912:202012, function(x) read_csv(paste0(x, ".csv")))
all_data <- bind_rows(monthly_data)

# 合并用户数据（根据具体情况调整）
full_data <- left_join(all_data, user_data, by = "user_id")
