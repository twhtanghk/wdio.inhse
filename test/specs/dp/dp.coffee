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
    browser.close()
  
  it 'CSA', ->
    browser.click 'div[record="In-house Applications"]'
    browser.click 'a[record="Contract Staff Administration System (CSA)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'CSA Main Menu' 
    browser.close()

  it 'SPARS', ->
    browser.click 'a[record="Security Patch Reminding System (SPARS)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'Security Patch Reminding System (SPARS)' 
    browser.close()
     
  it 'ORS', ->
    browser.click 'a[record="Online Reservation of Shared Facilities System (ORS)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'Online Reservation of Shared Facilities' 
    browser.close()
    
  it 'CPD', ->
    browser.url 'https://dp2.ogcio.ccgo.hksarg/eogcio2https/cpd/SFASAdminServlet'
    browser.click 'a[href$=CCGOEntryServlet]'
    browser.getTitle().should.be.equal 'Continuing Professional Development'
      
      
  it 'CFD', ->
    browser.click 'a[record="Contract Staff Funding Mgmt System (CFD)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    if browser.getTitle() == 'Contract Staff Funding Management' || 'CFD Select Login Page'
      true.should.be.ok  
    browser.close()     

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