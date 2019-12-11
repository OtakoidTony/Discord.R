BaseUrl <- "https://discordapp.com/api"
token <- "your token"

getGatewayBot <- function(){
  key <- paste0("Bot ", token)
  r <- GET("https://discordapp.com/api/v6/gateway/bot", add_headers(Authorization=key))
}

sendMessage <- function(channel_id, message){
  key <- paste0("Bot ", token)
  Url <- paste0("https://discordapp.com/api/v6/channels/")
  Url <- paste0(Url, channel_id)
  Url <- paste0(Url, "/messages")
  body <- list(tts=FALSE, content=message)
  r <- POST(Url, add_headers(Authorization=key), set_cookies(content(getGatewayBot())$cookies), body = body, encode = "json")
  return(r)
}