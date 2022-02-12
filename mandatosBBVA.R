# Bajar la planilla mandatos de homebanking
# Abrir en planilla de cálculo 
# Eliminar las primeras dos líneas de encabezado
# Buscar y reemplazar por nada los puntos de los nros en las cuatro columnas
# Guardar como archivo csv
windows()
par(mfrow = c(2, 1)) # configura como van a salir los gráficos
mandatos <- read.csv("C:/Users/gapne/Downloads/Invest_mandatos_ordenes_11_02_2022.csv")
mandatos$Precio <- as.numeric(gsub(",", ".", mandatos$Precio))
mandatos$Cantidad..VN. <- as.numeric(gsub(",", ".", mandatos$Cantidad..VN.))
mandatos$Monto.Neto <- as.numeric(gsub(",", ".", mandatos$Monto.Neto))
# Renta fija plus
rentafp <- mandatos[mandatos$Especie == "FBA RENTA FIJA PLUS",]
rentafp$cant <- (rentafp$Tipo == "Suscripción") * rentafp$Cantidad..VN. + (rentafp$Tipo == "Rescate") * (-rentafp$Cantidad..VN.)
y <- rentafp$cant[length(rentafp$cant):1] # reordena rentafp$cant LILO
rfp <- rep(0,length(y))
for (i in seq_along(y)) {rfp[i] <- sum(y[1:i])} # hace una sumatoria de y
x1 <- c(1:length(rentafp$cant))
plot(x1, rfp, "s")
# Renta pesos
rentap <- mandatos[mandatos$Especie == "FBA RENTA PESOS",]
rentap$cant <- (rentap$Tipo == "Suscripción") * rentap$Cantidad..VN. + (rentap$Tipo == "Rescate") * (-rentap$Cantidad..VN.)
z <- rentap$cant[length(rentap$cant):1] # reordena rentap$cant LILO
rp <- rep(0,length(z))
for (i in seq_along(z)) {rp[i] <- sum(z[1:i])} # hace una sumatoria de z
x2 <- c(1:length(rentap$cant))
plot(x2, rp, "s")