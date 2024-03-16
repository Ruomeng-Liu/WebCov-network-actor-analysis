library(igraph)


## read the data ----

file_path_user <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/user.csv"
file_path_201912 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2019-12.csv"
file_path_202001 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-12.csv"
file_path_201912 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-12.csv"
file_path_201912 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-12.csv"
file_path_201912 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-12.csv"
file_path_201912 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-12.csv"
file_path_201912 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-12.csv"
file_path_201912 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-12.csv"
file_path_201912 <- "/Users/liuruomeng/Desktop/COV-Weibo2.0/2020-12.csv"



data_201912 <- read.csv(file_path_201912)

data_user <- read.csv(file_path_user)


head(data_user)
head(data_201912)

## test the network code ----


# 模拟您的数据
data <- data_201912

# 假设每条记录是一个“事件”，我们根据like_num, repost_num, comment_num创建边
# 这里简化处理，仅使用repost_num > 0作为边的条件
# 注意：实际分析中可能需要更复杂的逻辑来定义节点间的关系
edges <- subset(data, repost_num > 0)

# 创建图对象，这里仅使用了存在repost的数据
g <- graph_from_data_frame(edges[, c("user_id", "X_id")], directed=TRUE)

# 将有向图转换为无向图
g_undirected <- as.undirected(g, mode = "mutual")

# 使用Louvain算法进行社区检测，确保使用无向图
community <- cluster_louvain(g_undirected)

# 打印社区结果
print(community)

# 可视化网络和社区
plot(community, g_undirected)
