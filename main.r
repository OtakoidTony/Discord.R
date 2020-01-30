BaseUrl <- "https://discordapp.com/api"
token <- "your token"

library(httr)

# TODO: Channel management | Create Delete DM Edit History Info Permission
# TODO: Edit Profile       | Edit_Profile
# TODO: Invites            | Create Delete Info Join
# TODO: Message management | Send Send_File Edit Delete	
# TODO: Role management    | Create Delete Edit Info	
# TODO: Server management  | Ban Ban_List Create Delete Edit Info Kick Unban Change_Owner
# TODO: User management    | Voice_Move

makeIdentifyProperties <- function(os, browser, device){
  return(list('$os' = os, '$browser' = browser, '$device' = device))
}

makeIdentify <- function(token, properties = makeIdentifyProperties('windows', 'Discord.r', 'Discord.r')){
  return(list(token = token, properties = properties))
}

# Get Gateway
getGateway <- function(){
  r <- GET("https://discordapp.com/api/v6/gateway")
  return(r)
}

# Get Gateway Bot
getGatewayBot <- function(){
  key <- paste0("Bot ", token)
  r <- GET("https://discordapp.com/api/v6/gateway/bot", add_headers(Authorization=key))
  return(r)
}

# Message management | Send
sendMessage <- function(channel_id, message){
  key <- paste0("Bot ", token)
  Url <- "https://discordapp.com/api/v6/channels/"
  Url <- paste0(Url, channel_id)
  Url <- paste0(Url, "/messages")
  body <- list(tts=FALSE, content=message)
  r <- POST(Url, add_headers(Authorization=key), set_cookies(content(getGatewayBot())$cookies), body = body, encode = "json")
  return(r)
}

getMessage <- function(channel_id){
  key <- paste0("Bot ", token)
  Url <- "https://discordapp.com/api/v6/channels/"
  Url <- paste0(Url, channel_id)
  Url <- paste0(Url, "/messages")
  r <- GET(Url, add_headers(Authorization=key))
  return(r)
}

getChannel <- function(channel_id){
  key <- paste0("Bot ", token)
  Url <- "https://discordapp.com/api/v6/channels/"
  Url <- paste0(Url, channel_id)
  r <- GET(Url, add_headers(Authorization=key))
  return(r)
}

createGuildChannel <- function(guild_id, name){
  key <- paste0("Bot ", token)
  Url <- "https://discordapp.com/api/v6/guilds/"
  Url <- paste0(Url, guild_id)
  Url <- paste0(Url, "/channels")
  body <- list(tts=FALSE, name=name)
  r <- POST(Url, add_headers(Authorization=key), set_cookies(content(getGatewayBot())$cookies), body = body, encode = "json")
}

