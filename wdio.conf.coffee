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
    sync: true
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
      'debug-brk': true,
      ui: 'bdd',
      timeout: timeout,
      compilers: ['coffee:coffee-script/register']
    before: ->
      chai = require 'chai'
      global.expect = chai.expect
      chai.Should()
    afterTest: (test) ->
      if not test.passed
        config.errHandler test.err.message, browser.saveScreenshot()
      browser.close()
