local BasePlugin = require "kong.plugins.base_plugin"
local access = require "kong.plugins.external-oauth.access"

local ExtOauthPlugin = BasePlugin:extend()

function ExtOauthPlugin:new()
	ExtOauthPlugin.super.new(self, "external-oauth")
end

function ExtOauthPlugin:access(conf)
	ExtOauthPlugin.super.access(self)
	access.run(conf)	
end

return ExtOauthPlugin
