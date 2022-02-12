# Bajar la planilla mandatos de homebanking
# Abrir en planilla de cálculo 
# Eliminar las primeras dos líneas de encabezado
# Buscar y reemplazar por nada los puntos de los nros en las cuatro columnas
# Guardar como archivo csv
mandatos <- read.csv("C:/Users/gapne/Downloads/Invest_mandatos_ordenes_11_02_2022.csv")
mandatos$Precio <- as.numeric(gsub(",", ".", mandatos$Precio))
mandatos$Cantidad..VN. <- as.numeric(gsub(",", ".", mandatos$Cantidad..VN.))
mandatos$Monto.Neto <- as.numeric(gsub(",", ".", mandatos$Monto.Neto))
rentafp <- mandatos[mandatos$Especie == "FBA RENTA FIJA PLUS",]
rentafp$cant <- (rentafp$Tipo == "Suscripción") * rentafp$Cantidad..VN. + (rentafp$Tipo == "Rescate") * (-rentafp$Cantidad..VN.)
y <- rentafp$cant[length(rentafp$cant):1] # reordena rentafp$cant LILO
sumatoria <- rep(0,length(y))
for (i in seq_along(y)) {sumatoria[i] <- sum(y[1:i])} # hace una sumatoria en c de y
plot(c(1:length(rentafp$cant)), sumatoria, "s")