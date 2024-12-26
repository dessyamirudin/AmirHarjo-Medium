library(httr2)
library(jsonlite)

# Checking httr2 library
# https://httr2.r-lib.org/
# req <- request("https://r-project.org")

# below code did the same thing
# req |> req_headers("Accept" = "application/json")
# req %>%  req_headers("Accept" = "application/json")

# BPS Documentation
# https://webapi.bps.go.id/documentation/#

# DOMAIN DATA
domain_url = "https://webapi.bps.go.id/v1/api/domain/type/"

#APP ID
api_key = "81f80bb00ccf3e87f3823d2ed2fb5722"

# GET from URL - change to req_perform in httr2
domain_request = request("https://webapi.bps.go.id/v1/api/domain/type/all/key/81f80bb00ccf3e87f3823d2ed2fb5722")
domain_request %>% req_dry_run()
domain = req_perform(domain_request)

# check the content/response of the data
domain %>% resp_content_type()
domain %>% resp_status()
domain %>% resp_status_desc()

# check the content of the response
domain %>% resp_body_json()
domain_data = domain %>% resp_body_json() # use json because resp_content_type() return json

# check list names
names(domain_data)

# check content of list in domain_data
domain_data$status
domain_data$`data-availability`

# table of BPS domain - change list into dataframe
# table_domain = as.data.frame(domain_data$data[[2]]) -- this code is incorrect because the output is one row with more than 1000 variable
table_domain2 = do.call("rbind", domain_data$data[[2]]) # this still return a list

# change list to dataframe
table_domain_df = as.data.frame(table_domain2)
