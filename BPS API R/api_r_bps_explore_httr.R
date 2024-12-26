library(httr)
library(jsonlite)

# BPS Documentation
# https://webapi.bps.go.id/documentation/#

# DOMAIN DATA
domain_url = "https://webapi.bps.go.id/v1/api/domain/type/"

#APP ID
api_key = "81f80bb00ccf3e87f3823d2ed2fb5722"

# GET from URL
domain = GET("https://webapi.bps.go.id/v1/api/domain/type/all/key/81f80bb00ccf3e87f3823d2ed2fb5722")

# change from raw to char data
domain_json = rawToChar(domain$content)

# tidy the JSON
domain_data = fromJSON(domain_json)
names(domain_data)

domain_data$status
domain_data$`data-availability`
domain_data$data

tabel_domain = domain_data$data[[2]]