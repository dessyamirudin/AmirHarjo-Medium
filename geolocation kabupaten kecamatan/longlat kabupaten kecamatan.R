# set working directory

setwd("D:/Blog Purpose/AmirHarjo-Medium/geolocation kabupaten kecamatan")

library(tidyverse)
library(geodata)

# load peta data indonesia
indo_data = geodata::gadm(country="ID", level=3, path=tempdir(),version="latest")
# try use internal path

# membaca filetoko
data_toko = read.csv("data_toko.csv",sep=";")

# memperkaya data toko dengan provinsi, kabupaten dan kecamatan
lokasi_data_toko = extract(indo_data,data_toko[,c("Long","Lat")])
provinsi_data_toko = lokasi_data_toko$NAME_1
kota_data_toko = lokasi_data_toko$NAME_2
kecamatan_data_toko = lokasi_data_toko$NAME_3

data_toko$Provinsi = provinsi_data_toko
data_toko$Kabupaten = kota_data_toko
data_toko$Kecamatan = kecamatan_data_toko

# simpan sebagai csv file
write.csv(data_toko,"data_toko_prov_kab_kecamatan.csv")