package = "external-oauth2"
version = "1.2-6"
source = {
  url = "https://github.com/jackong/kong-external-oauth.git"
}
description = {
  summary = "A Kong plugin, that let you use an external Oauth 2.0 provider to protect your API",
  license = "Apache 2.0"
}
dependencies = {
  "lua >= 5.1"
  -- If you depend on other rocks, add them here
}
build = {
  type = "builtin",
  modules = {
    ["kong.plugins.external-oauth2.access"] = "src/access.lua",
    ["kong.plugins.external-oauth2.handler"] = "src/handler.lua",
    ["kong.plugins.external-oauth2.schema"] = "src/schema.lua"
  }
}
