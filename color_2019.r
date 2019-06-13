
# Cargamos librerías que vamos a usar
library(colortools)
library(sos)
library(dichromat)
library(RColorBrewer)
library(grDevices)
library(colorspace)

# declara tu directorio de trabajo

setwd("D:/repos_publicos_2018/taller-color")

# Cargamos los datos
t <- get(load("tabla.rda"))

# podemos ver qué contiene
t

par(bg = "gray80")

barplot(t, col=palette(),   
        legend = rownames(t),
        horiz = T)

# palette contiene 32 colores muy saturados variando sobre los colores básicos 

pizza(palette())

# es lo mismo que si le pides rainbow

pizza(rainbow(6))

# pero puedes variar los valores de saturación para evitar que "canten" tanto

pizza(rainbow(6, s = 0.5))


# Y usando s = 0.5 tendremos

par(bg = "gray80")
barplot(t, col=rainbow(12, s = 0.6),   
        legend = rownames(t),
        horiz = T)

# usando RColorBrewer  ## OJO A LAS MAYÚSCULAS!!

RColorBrewer::display.brewer.all()

cols <- RColorBrewer::brewer.pal(12,"Paired")

pizza(cols)

par(bg = "gray80")
barplot(t, col = cols,   
        legend = rownames(t),
        horiz = T)


## colorspace::choose_palette() UNA INTERFAZ GRÁFICA PARA ELEGIR PALETA
# https://www.r-bloggers.com/colorspace-new-tools-for-colors-and-palettes/
# Usage with base graphics
# The color vectors returned by the HCL palette functions can usually be passed directly 
# to most base graphics function, typically through the col argument. 

colorspace::hcl_palettes()

colorspace::hcl_palettes(plot = T)

pal <- qualitative_hcl(12, "Dark 3")
pal

par(bg = "gray80")
barplot(t, col = pal,   
        legend = rownames(t),
        horiz = T)

pal <- choose_palette()

par(bg = "gray80")
barplot(t, col = pal,   
        legend = rownames(t),
        horiz = T)

# MAL! Lo que tenía más interesante colorspace ha desaparecido

# Como mosaicplot

t2 <- as.matrix(t)

t2[is.na(t2)] <- 0

t2 <- as.table(t(t2))

pal <- qualitative_hcl(12, "Dark 3")
pal

par(bg = "gray80")
mosaicplot(t2,
           main = "ejemplo mosaico",
           color = pal, 
           cex = 1, 
           las = 1)


# HAY ALTERNATIVA
# viridis

install.packages("viridis")

library(viridis)

mosaicplot(t2,
           main = "ejemplo mosaico",
           color = viridis(12), 
           cex = 1, 
           las = 1)

par(bg = "white")

mosaicplot(t2,
           main = "ejemplo mosaico",
           color = plasma(12), 
           cex = 1, 
           las = 1)

