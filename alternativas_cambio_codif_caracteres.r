# Cambio de tipo de caracteres despues de load
# Comparacion de metodos sugeridos en lista r-es

setwd("C:/Users/pedroc/Desktop/video")  # pon el tuyo

list.files(pattern = glob2rx("*.rda"))

# Mensaje de 10/04/2015 a las 9:43, Jorge Ayuso Rejas escribió:

time1 <- Sys.time()

load("master.rda")

table(master$gen)
dim(master) # 11231 x 28 un dataset pequennito

iconv.data.frame<-function (df, ...)  # Esta función la encontré por ahí 
{
  df.names <- iconv(names(df), ...)
  df.rownames <- iconv(rownames(df), ...)
  names(df) <- df.names
  rownames(df) <- df.rownames
  df.list <- lapply(df, function(x) {
    if (class(x) == "factor") {
      x <- factor(iconv(as.character(x), ...))
    }
    else if (class(x) == "character") {
      x <- iconv(x, ...)
    }
    else {
      x
    }
  })
  df.new <- do.call("data.frame", df.list)
  return(df.new)
}

master2 <- iconv.data.frame(master,from="UTF8",to="latin1")

time2 <- Sys.time()
difftime(time2, time1)  # 3,5 segundos

table(master2$gen)  # Probamos que la codificacion es correcta

# Sugerido 10/04/2015 a las 11:44, Emilio L. Cano 

time3 <- Sys.time()

load("master.rda")  # Para tener igualdad de condiciones con parte anterior

table(master$gen)
dim(master)

write.table(master,
            file = "master.txt",
            sep = "\t",
            # fileEncoding = "latin1", NO FUNCIONA BIEN, DA WARNINGS
            row.names = F,
            col.names = T)

master2 <- read.table(file = "master.txt",
                      sep = "\t",
                      comment.char = "",
                      flush = T,
                      fileEncoding = "UTF-8",
                      header = T)

time4 <- Sys.time()
difftime(time4, time3)  # 5,2 segundos un poco variable (entre 5 y 5,8 segundos)

table(master2$gen)  # Probamos que la codificacion es correcta


