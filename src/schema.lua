local url = require "socket.url"

local function validate_url(value)
  local parsed_url = url.parse(value)
  if parsed_url.scheme and parsed_url.host then
    parsed_url.scheme = parsed_url.scheme:lower()
    if not (parsed_url.scheme == "http" or parsed_url.scheme == "https") then
      return false, "Supported protocols are HTTP and HTTPS"
    end
  end

  return true
end

return {
  fields = {
    authorize_url = {type = "url", required = true, func = validate_url},
    token_url = {type = "url", required = true, func = validate_url},
    user_url  = {type = "url", required = true, func = validate_url},
    client_id = {type = "string", required = true},
    client_secret = {type = "string", required = true},
    scope = {type = "string", default = ""},
    user_keys = {type = "array", default = {"username", "email"}},
    user_info_periodic_check = {type = "number", required = true, default = 60},
    hosted_domain = {type = "string", default = ""},
    email_key = {type = "string", default = ""}
  }
}
