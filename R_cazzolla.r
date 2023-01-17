library(vegan)
install.packages("tidyverse")
install.packages("")

id <- "1qXI_SlH-myF8v4S0xtJ8M3ULuxQQDoPn"
a <- read.csv(sprintf("https://docs.google.com/uc?id=%s&export_download", id), sep = ";")
View(a)

summary(a)
str(a)

# dati su abbondanza specie
# a accentata = character, non è un valore numerico perché mi è sfuggito un typo

#metto assieme tutti i dati che hanno lo stesso valore

sort(unique(a$A))
a$A <- gsub("2Ã", 2, a$A)
sort(unique(a$A))
str(a)
a$A <- as.double(paste(a$A)) #trasformo in numeri valori incollati
str(a$A)

sort(unique(a$C)) # devo sostituire assente con 0 o con NA

a$C <- gsub("assente", NA, a$C)
a$C <- as.double(paste(a$C))
str(a)

# oppure a[a == "assente"] <- NA

sum(a$A) # NA

a[is.na(a)] <- 0

a$B

a$ind <- rowSums(a[,c(3:6)]) # abbondanza di ciascuna specie in tutti i plot, totale di ogni specie
a$ind

require(tidyverse)

b <- group_by(a, ï..Site, species) %% summarise(ind = sum(ind))
View(b)

c <- pivot_wider(b, values_from = ind, names_from = species)
View(c)

c <- c[, -c(2,3,4,5)]

c <- gsub("NULL", 0, c)
View(c)

sn <- specnumber(c)

c[is.null(c)] <- 0

c[is.na(c)] <- 0

c[is.null(c)] <- 0

c[is.na(c)] <- 0

#come si distribuiscono le abbondanze all'interno dei siti (histogram of ab)

#hist(colSums(dune)) mostra le due prime colonne molto alte, quindi ci sono più individui rari rispetto ai comuni - foresta tropicale

#categorie in base logaritmica: case_when()

#whittaker plot/ rango-abb

#curva di accumulazione
#modello vs dato preciso - curva smooth vs a zigzag

#curve ABC 

id2 <- "/1_1PV-y7J8v2nS09B3OVL1ImNK_7U8J20"



id3 <- "1lvIWwepprZ0I41RTEwhGjLek98rU3lne"

View(d)
View(e)
