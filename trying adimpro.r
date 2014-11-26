# Pildorita para reu Noviembre 2014 gRupo R madRid
# Pedro Concejero 
# @ConcejeroPedro en twitter

# cómo convertir a monocromo y en general manipular imágenes
# incluidas fotos extraídas de cámara fotos
# con paquete adimpro

# Idea original encontrada en
# http://timelyportfolio.github.io/rCharts_catcorrjs/exif/

# documentación adimpro consultada
# http://cran.r-project.org/web/packages/adimpro/adimpro.pdf


# trying adimpro for RGB to greyscale conversion

install.packages("adimpro", dependencies = T)

library(adimpro)

# **Tienes que instalar ImageMagick en tu sistema**

# Si no te sale este WARNING
# Warning message:
# In fun(libname, pkgname) : could not determine path to Imagemagick 
#
# please set the correct path manually using 

#'Sys.setenv(ImageMagick='path2imagemagick')'
#'
# ImageMagick® is a software suite to create, edit, compose, or convert bitmap images
# http://www.imagemagick.org/



# read.raw and read.image creates adimpro objects from images (photos or files)

setwd("C:/Users/pedroc/Desktop/madRid-R/talleres congreso R-hispano")

filename1 <- "barplot_1.png"

colorimage <- read.image(filename1)

# rgb2grey permite convertir imágenes en color a monocromo

bynimage <- rgb2grey(colorimage)

# función específica plot permite visualizar histogramas de color
# junto con imágenes en ventana de gráfico

plot(colorimage)
plot(bynimage)

# También tenemos la función show.image aunque tarda un poco

show.image(colorimage)
show.image(bynimage)

# y finalmente podemos escribir la imagen con write.image

write.image(bynimage,
            file = "barplot_byn.png")
