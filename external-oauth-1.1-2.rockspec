package = "external-oauth"
version = "1.1-2"
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
    ["kong.plugins.external-oauth.access"] = "src/access.lua",
    ["kong.plugins.external-oauth.handler"] = "src/handler.lua",
    ["kong.plugins.external-oauth.schema"] = "src/schema.lua"
  }
}
