source("~/Dropbox/my/dev/R/Rprofile")

# a.load()
setwd("~/Dropbox/my/dev/al3xandr3.github.com")
f = read.csv(file="./quotes.csv", head=TRUE, sep=",")

# add time of week
f$day = weekdays(as.Date(f$date))

png('./img/quotes_frequency.png', width=300,height=200)
f$day2 = factor(f$day, levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
ggplot(f, aes(day2)) + geom_histogram(aes_string(y="..count..",fill="..count.."), alpha=0.6) + 
                                      xlab(NULL) + ylab(NULL) + opts(legend.position = "none") +
                                     opts(panel.border = theme_blank(), panel.background = theme_blank(),
                                    axis.text.x=theme_text(size=12,angle=65, hjust=0.5), strip.background = theme_blank())
dev.off()

# wordcloud
d = a.word.freq(f$content)
png('./img/quotes_cloud.png', width=500,height=500)
wordcloud(d$word
          ,d$freq
          ,min.freq=2
          ,scale=c(4,.5)
          ,max.words=50
          ,random.order=FALSE
          ,colors=brewer.pal(9,"Blues")
          )
dev.off()