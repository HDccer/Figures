# install packages

install.packages(c(
  "colorBlindness", "directlabels", "dplyr", "gameofthrones", "ggforce", 
  "gghighlight", "ggnewscale", "ggplot2", "ggraph", "ggrepel", 
  "ggtext", "ggthemes", "hexbin", "Hmisc", "mapproj", "maps", 
  "munsell", "ozmaps", "paletteer", "patchwork", "rmapshaper", "scico", 
  "seriation", "sf", "stars", "tidygraph", "tidyr", "wesanderson" 
))

library(ggplot2)
library(patchwork)




ggplot(mpg,aes(displ,hwy))+
  geom_point()
ggplot(economics,aes(date,unemploy/pop))+
  geom_line()

data(Oxboys,package="nlme")

ggplot(Oxboys,aes(age,height))+
  geom_line(aes(group=Subject))+
  geom_smooth(method="lm",se=FALSE)


ggplot(Oxboys,aes(Occasion,height))+
  geom_line(aes(group=Subject),alpha=0.6)+
  geom_boxplot()

ggplot(mpg, aes(displ, hwy)) +
  geom_point() + 
  ggforce::geom_mark_ellipse(aes(label = cyl, group = cyl))

ggplot(mpg, aes(displ, hwy, colour = factor(cyl))) +
  geom_point() + 
  gghighlight::gghighlight() + 
  facet_wrap(vars(cyl))


p1 <- ggplot(mpg)+
  geom_point(aes(displ,hwy))

p2 <- ggplot(mpg)+
  geom_bar(aes(x=as.character(year),fill=drv),position="dodge")+
             labs(x="year")


p3 <- ggplot(mpg)+
  geom_density(aes(x = hwy,fill=drv))+
  facet_grid(rows = vars(drv))
  

p4 <- ggplot(mpg,aes(x = drv,y=hwy))+
  stat_summary(aes(x = drv, y = hwy, fill = drv), geom = "col", fun.data = mean_se) +
  stat_summary(aes(x = drv, y = hwy), geom = "errorbar", fun.data = mean_se, width = 0.5)
 

p1 + p2 + p3 + p4+plot_layout(guides="collect")

p12 <- p1+inset_element(p2,left=0.5,right=0.9,top=0.9,bottom = 0.5)
p12&theme_bw()


base <- ggplot(mpg,aes(drv,hwy))+
  geom_hline(yintercept = 28,color = "blue")+
  geom_boxplot()+theme_bw()

base+coord_cartesian(ylim=c(10,35))


p1+p2