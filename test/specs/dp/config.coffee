fs = require 'fs'
Promise = require 'bluebird'
http = Promise.promisifyAll require 'needle'

token = (client, user) ->
  config = module.exports
  opts = 
    'Content-Type': 'application/x-www-form-urlencoded'
    username: config.im.client.id
    password: config.im.client.secret
  data = 
    grant_type: 'password'
    username: config.im.user.id
    password: config.im.user.secret
    scope: process.env.OAUTH2_SCOPE
  http
    .postAsync config.oauth2.url, data, opts
    .then (res) ->
      res.body.access_token 

msg = (token, body, file) ->
  config = module.exports
  data =
    to: config.im.to
    body: body
    file:
      buffer: file
      filename: 'screenDump.png'
      content_type: 'image/png'
  opts =
    multipart: true
    headers:
      Authorization: "Bearer #{token}"
  http.postAsync config.im.url, data, opts

errHandler = (body, screenDump) ->
  config = module.exports
  token config.im.client, config.im.user
    .then (token) ->
      msg token, body, screenDump

module.exports =
  portal:
    url: process.env.URL
    user:
      name: process.env.USER
      pass: process.env.PASS
  oauth2:
    url: process.env.TOKENURL
  im:
    url: process.env.IMURL
    client:
      id: process.env.CLIENT_ID
      secret: process.env.CLIENT_PASS
    user:
      id: process.env.IMUSER
      secret: process.env.IMPASS
    to: process.env.NOTIFY
  errHandler: errHandler
