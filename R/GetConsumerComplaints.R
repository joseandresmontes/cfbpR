#' Access All Consumer Finacial Protection Bureau
#' @description This function allows the users to access Consumer Financial Protection Bureau API
#' through a variety of different parameters. Parameters should be left null if it is not of interest
#' so as to include all fields that have that parameter.
#' @param before search for a near match based on string.
#' @param after A two letter name.
#' @param limit Number of entries returned. Default at 20 entries.
#' @examples
#' data <- GetConsumerComplaints()
#'
#' data <- GetConsumerComplaints(limit = 25)
#' @details
#' Returns a dataframe with 14 columns filtered based on search query.
#' @export

GetConsumerComplaints <- function(before=NULL, after=NULL, limit = 20)
{
  #set user
  user <- httr::user_agent("R User")
  #url query
  #url query
  url <- httr::modify_url(
    url = "https://www.consumerfinance.gov",
    path = c('data-research','consumer-complaints','search','api','v1',''),
    query = list(
      date_received_max = before,
      date_received_min = after,
      no_aggs = 'true',
      size = limit
    )
  )
  #request response with specified parameters
  parameter_response <- httr::GET(url, user)

  if(parameter_response$status_code == 200)
  {
    content <- jsonlite::fromJSON(httr::content(parameter_response, "text", encoding = 'UTF-8'))
    data <- content$hits$hits$`_source`
    dplyr::select(data,complaint_id,
                  complaint=complaint_what_happened,submitted_via,
                  product,sub_product,
                  issue,sub_issue,
                  company,company_response,company_public_response,
                  date_sent_to_company,
                  date_received,
                  state,zipcode=zip_code)
  }
  else
  {
    print("Error with request, please check query")
  }
}
