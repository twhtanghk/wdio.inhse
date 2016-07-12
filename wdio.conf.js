timeout = 100000;
 
exports.config = {
    host: 'selenium',
    port: 4444,
    path: '/wd/hub',
    specs: [
        './test/specs/**/*.coffee'
    ],
    exclude: [
    ],
    maxInstances: 10,
    capabilities: [{
        maxInstances: 5,
        browserName: 'chrome'
    }],
    sync: true,
    logLevel: 'verbose',
    coloredLogs: true,
    screenshotPath: './errorShots/',
    waitforTimeout: timeout,
    connectionRetryTimeout: 90000,
    connectionRetryCount: 3,
    framework: 'mocha',
    reporters: ['dot'],
    mochaOpts: {
        debug: true,
        'debug-brk': true,
        ui: 'bdd',
        timeout: timeout,
        compilers: ['coffee:coffee-script/register']
    },
    before: function() {
      chai = require('chai')
      global.expect = chai.expect
      chai.Should()
    }
}
