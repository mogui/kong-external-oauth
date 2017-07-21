# Kong External OAUTH 2.0

A Kong plugin, that let you use an external Oauth 2.0 provider to protect your API.

## Description

KONG has bundled a plugin to implement a full OAUTH 2.0 provider. This plugin instead let you use a
third party OAUTH 2.0 provider to protect your API/site implementing the full flow, it will automatically
expose a callback uri, and request an access token.

It will then request user info (specified in the configuration) and add some header to let be used
by your `upstream` service.

The plugin will periodically check for token validity. You can configure the time period through
a configuration parameter, in seconds.

If configured, it can also check the provided email address and make sure it belongs to a particular
domain, so you can use the plugin also for thirty party services.

## Installation

    $ luarocks install external-oauth

To make Kong aware that it has to look for the new plugin, you'll have to add it to the custom_plugins
property in your configuration file.

```yaml
custom_plugins:
    - external-oauth
```

Remember to restart Kong.



## Configuration

You can add the plugin with the following request:

```bash
$ curl -X POST http://kong:8001/apis/{api}/plugins \
    --data "name=external-oauth" \
    --data "config.authorize_url=https://oauth.something.net/openid-connect/authorize" \
    --data "config.scope=openid+profile+email" \
    --data "config.token_url=https://oauth.something.net/openid-connect/token" \
    --data "config.client_id=SOME_CLEINT_ID" \
    --data "config.client_secret=SOME_SECRET_KEY" \
    --data "config.user_url=https://oauth.something.net/openid-connect/userinfo" \
    --data "config.user_keys=email,name,sub"
    --data "config.hosted_domain=mycompany.com"
    --data "config.email_key=email"
```

| Form Parameter | default | description |
| --- 						| --- | --- |
| `name` 					        | | plugin name `external-oauth` |
| `config.authorize_url` 	| | authorization url of the OAUTH provider (the one to which you will be redirected when not authenticated) |
| `config.scope` 			    | | OAUTH scope of the authorization request |
| `config.token_url` 		  | | url of the Oauth provider to request the access token |
| `config.client_id` 		  | | OAUTH Client Id |
| `config.client_secret` 	| | OAUTH Client Secret |
| `config.user_url` 		  | | url of the oauth provider used to retrieve user information and also check the validity of the access token |
| `config.user_keys` <br /> <small>Optional</small>		| `username,email` | keys to extract from the `user_url` endpoint returned json, they will also be added to the headers of the upstream server as `X-OAUTH-XXX` |
| `config.hosted_domain`  | | domain whose users must belong to in order to get logged in. Ignored if empty |
| `config.email_key` 		  | | key to be checked for hosted domain, taken from userinfo endpoint |
| `config.user_info_periodic_check` 		  | 60 | time in seconds between token checks |

In addition to the `user_keys` will be added a `X-OAUTH-TOKEN` header with the access token of the provider.

## Author
Niko Usai

## License

Copyright 2016 Niko Usai

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
limitations under the License.
