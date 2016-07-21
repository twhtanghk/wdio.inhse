fs = require 'fs'
Promise = require 'bluebird'
http = Promise.promisifyAll require 'needle'

dir = '/etc/ssl/certs'
files = fs.readdirSync(dir).filter (file) -> /.*\.pem/i.test(file)
files = files.map (file) -> "#{dir}/#{file}"
ca = files.map (file) -> fs.readFileSync file

token = (client, user) ->
  config = module.exports
  opts = 
    ca: ca
    'Content-Type': 'application/x-www-form-urlencoded'
    username: config.im.client.id
    password: config.im.client.secret
  data = 
    grant_type: 'password'
    username: config.im.user.id
    password: config.im.user.secret
    scope: 'https://mob.myvnc.com/org/users https://mob.myvnc.com/mobile'
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
    ca: ca
    headers:
      Authorization: "Bearer #{token}"
  http.postAsync config.im.url, data, opts

errHandler = (body, screenDump) ->
  config = module.exports
  token config.im.client, config.im.user
    .then (token) ->
      msg token, body, screenDump
    .catch (err) ->
      throw err

module.exports =
  portal:
    url: 'https://dp2.ogcio.ccgo.hksarg'
    user:
      name: 'user'
      pass: 'pass'
  oauth2:
    url: 'https://mob.myvnc.com/org/oauth2/token/'
  im:
    url: 'https://mob.myvnc.com/im.app/api/msg/file'
    client:
      id: 'client_id'
      secret: 'client_secret'
    user:
      id: 'user'
      secret: 'pass'
    to: 'Health Check Testing Group@jokyip.muc.mob.myvnc.com'
  errHandler: errHandler
