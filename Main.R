# install packages

install.packages(c(
  "colorBlindness", "directlabels", "dplyr", "gameofthrones", "ggforce", 
  "gghighlight", "ggnewscale", "ggplot2", "ggraph", "ggrepel", 
  "ggtext", "ggthemes", "hexbin", "Hmisc", "mapproj", "maps", 
  "munsell", "ozmaps", "paletteer", "patchwork", "rmapshaper", "scico", 
  "seriation", "sf", "stars", "tidygraph", "tidyr", "wesanderson" 
))

library(ggplot2)
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




