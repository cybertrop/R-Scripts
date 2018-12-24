# R script to create a bar-chart of the number of times a host was infected 

#!/bin/r

library(ggplot2)

tbl <- read.csv("file.csv")
colnames(tbl) <- c("MD5","Host","Time")

host.top30 <- names(summary(tbl$Host))[1:30]

gg <- ggplot(data=subset(tbl,Host %in% host.top30), aes(x=reorder(Host, Host, length)))

gg <- gg + geom_bar(fill="#000099")

gg <- gg + labs(title="Host Count", x="Host", y="Count")

gg <- gg + coord_flip()

gg <- gg + theme(panel.grid=element_blank(),
                 panel.background=element_blank())

print(gg)
