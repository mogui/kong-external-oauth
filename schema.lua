return {
  fields = {
    authorize_url = {type = "string", required = true},
    token_url = {type = "string", required = true},
    user_url  = {type = "string", required = true},
    client_id = {type = "string", required = true},
    client_secret = {type = "string", required = true},
    scope = {type = "string", default = ""},
    user_keys = {type = "array", default = {"username", "email"}}
  }
}
