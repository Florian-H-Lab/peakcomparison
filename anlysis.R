
#install.packages('VennDiagram')
library(VennDiagram)

data <- read.delim("../stats.txt", header=TRUE)

grid.newpage()

pdf(file="../venn_comparison.pdf")
draw.triple.venn(area1 = data[1,2], area2 = data[2,2], area3 = data[3,2], 
                 n12 = data[6,2], n23 = data[5,2], n13 = data[4,2], 
                 n123 = data[7,2], cex = 1.5, cat.cex = 1.5,
                 category = c(as.character(data[1,1]), as.character(data[2,1]), as.character(data[3,1])), lty = "blank", 
                 fill = c("blue", "red", "yellow"))
dev.off()

## PEAKachu
data[7,2]/data[1,2]

## Piranha
data[7,2]/data[2,2]
data[6,2]/data[2,2]
data[5,2]/data[2,2]

## PureCLIP
data[7,2]/data[3,2]
