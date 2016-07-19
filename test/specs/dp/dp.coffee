config = require './config.coffee'

describe 'dp', ->
  before ->
    browser.url config.portal.url
    browser.setValue 'input#IDToken1', config.user.name
    browser.setValue 'input#IDToken2', config.user.pass
    browser.click 'input[type=submit]'
    browser.getTitle().should.be.equal 'Welcome - OGCIO DP'
    
  afterEach ->
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() != tabs[0]
      browser.close()
    browser.pause 2000
  
  it 'CSA', ->
    browser.click 'div[record="In-house Applications"]'
    browser.moveToObject 'a[record="Contract Staff Administration System (CSA)"]'
    browser.click 'a[record="Contract Staff Administration System (CSA)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'CSA Main Menu'

  it 'CFD', ->
    browser.moveToObject 'a[record="Contract Staff Funding Mgmt System (CFD)"]'
    browser.click 'a[record="Contract Staff Funding Mgmt System (CFD)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.oneOf ['Contract Staff Funding Management', 'CFD Select Login Page']
    
  it 'ERI', ->
    browser.moveToObject 'a[record="Electronic Request for IT Facilities (APOLLO) (ERI)"]'	 
    browser.click 'a[record="Electronic Request for IT Facilities (APOLLO) (ERI)"]'	        	
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'Electronic Request for IT Facilities (APOLLO)'  
     
  it 'ORS', ->
    browser.moveToObject 'a[record="Online Reservation of Shared Facilities System (ORS)"]'
    browser.click 'a[record="Online Reservation of Shared Facilities System (ORS)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'Online Reservation of Shared Facilities'
    
  it 'OTA', ->
    browser.moveToObject 'a[record="Online Time-Off/Over-Time Approval (OTA)"]'
    browser.click 'a[record="Online Time-Off/Over-Time Approval (OTA)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'Online Time-Off / Over-Time Approval'  

  it 'SPARS', ->
    browser.moveToObject 'a[record="Security Patch Reminding System (SPARS)"]'
    browser.click 'a[record="Security Patch Reminding System (SPARS)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'Security Patch Reminding System (SPARS)'
    
  it 'SES', ->
    browser.moveToObject 'a[record="Staff Enquiry System (SES)"]'
    browser.click 'a[record="Staff Enquiry System (SES)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'Web Staff Enquiry System'  

  it 'TRS', ->
    browser.moveToObject 'a[record="Timesheet Reporting System (TRS)"]'
    browser.click 'a[record="Timesheet Reporting System (TRS)"]'	        	
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'Timesheet Reporting System'
  
  it 'eleave', ->
    browser.click 'a[record=e-leave]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'eLAPS - Electronic Leave Application and Processing System'
    
  it 'eMAT', ->
    browser.click 'a[record="e-MAT"]'	        	
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      browser.switchTab tabs[1]
    browser.getTitle().should.be.equal 'e-MAT'
    
  it 'CPD', ->
    browser.url config.portal.url + '/eogcio2https/cpd/SFASAdminServlet'
    browser.click 'a[href$=CCGOEntryServlet]'
    browser.getTitle().should.be.equal 'Continuing Professional Development'    