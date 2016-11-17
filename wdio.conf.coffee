timeout = 100000
config = require './test/specs/dp/config.coffee'

module.exports =
  config:
    host: 'selenium'
    port: 4444
    path: '/wd/hub'
    specs: [
        './test/specs/**/*.coffee'
    ]
    exclude: [
    ]
    maxInstances: 1
    capabilities: [{
        maxInstances: 1,
        browserName: 'chrome'
    }]
    sync: false
    logLevel: 'error'
    coloredLogs: true
    screenshotPath: './errorShots/'
    waitforTimeout: timeout
    connectionRetryTimeout: 90000
    connectionRetryCount: 3
    framework: 'mocha'
    reporters: ['dot']
    mochaOpts: 
      debug: true
      ui: 'bdd',
      timeout: timeout,
      compilers: ['coffee:coffee-script/register']
    before: ->
      chai = require 'chai'
      global.expect = chai.expect
      chai.Should()
    afterTest: (test) ->
      if not test.passed
        browser
          .saveScreenshot()
          .then (png) ->
            config.errHandler "#{test.title}: #{test.err.message}", png
          .catch console.log
          .finally ->
            browser.close()
      else
        browser.close()
