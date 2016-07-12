user = require './user.coffee'

describe 'dp', ->
  it 'eleave', ->
    browser.url 'https://dp2.ogcio.ccgo.hksarg'
    browser.setValue 'input#IDToken1', user.name
    browser.setValue 'input#IDToken2', user.pass
    browser.click 'input[type=submit]'

    browser.getTitle().should.be.equal 'Welcome - OGCIO DP'

    browser.click 'a[record=e-leave]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'eLAPS - Electronic Leave Application and Processing System'
