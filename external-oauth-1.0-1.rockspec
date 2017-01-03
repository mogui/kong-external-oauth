package = "external-oauth"
version = "1.0-1"
source = {
  url = "https://github.com/mogui/kong-external-oauth"
}
description = {
  summary = "A Kong plugin, that let you use an external Oauth 2.0 provider to protect your API",
  license = "Apache 2.0"
}
dependencies = {
  "lua ~> 5.1"
  -- If you depend on other rocks, add them here
}
build = {
  type = "builtin",
  modules = {
    ["kong.plugins.external-oauth.access"] = "/path/to/access.lua",
    ["kong.plugins.external-oauth.handler"] = "/path/to/handler.lua",
    ["kong.plugins.external-oauth.schema"] = "/path/to/schema.lua"
  }
}