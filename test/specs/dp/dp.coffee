user = require './user.coffee'

describe 'dp', ->
  before ->
    browser.url 'https://dp2.ogcio.ccgo.hksarg'
    browser.setValue 'input#IDToken1', user.name
    browser.setValue 'input#IDToken2', user.pass
    browser.click 'input[type=submit]'
    browser.getTitle().should.be.equal 'Welcome - OGCIO DP'

  it 'eleave', ->
    browser.click 'a[record=e-leave]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'eLAPS - Electronic Leave Application and Processing System'
    
  it 'TRS', ->
    browser.click 'div[record="In-house Applications"]'
    browser.moveToObject 'a[record="Timesheet Reporting System (TRS)"]'
    browser.click 'a[record="Timesheet Reporting System (TRS)"]'	        	
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'Timesheet Reporting System'
    browser.close()
    browser.pause 2000

  it 'SES', ->
    browser.click 'a[record="Staff Enquiry System (SES)"]'	        	
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'Web Staff Enquiry System'
    browser.close()
    browser.pause 2000

  it 'OTA', ->
    browser.click 'a[record="Online Time-Off/Over-Time Approval (OTA)"]'	        	
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'Online Time-Off / Over-Time Approval'
    browser.close()
    browser.pause 2000
    
  it 'ERI', ->    
    browser.click 'a[record="Electronic Request for IT Facilities (APOLLO) (ERI)"]'	        	
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'Electronic Request for IT Facilities (APOLLO)'
    browser.close()
    browser.pause 2000
    
  it 'eMAT', ->
    browser.click 'a[record="e-MAT"]'	        	
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'e-MAT'
    browser.close()    
