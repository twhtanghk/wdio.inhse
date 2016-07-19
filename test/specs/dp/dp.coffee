config = require './config.coffee'

describe 'dp', ->

  appCount = 0  

  before ->
    browser.url config.portal.url
    browser.setValue 'input#IDToken1', config.user.name
    browser.setValue 'input#IDToken2', config.user.pass
    browser.click 'input[type=submit]'
    browser.getTitle().should.be.equal 'Welcome - OGCIO DP'
    browser.click 'div[record="In-house Applications"]'
    
  afterEach ->
    tabs = browser.getTabIds()    
    browser.switchTab tabs[0]
  
  it 'CSA', ->        
    browser.moveToObject 'a[record="Contract Staff Administration System (CSA)"]'
    browser.click 'a[record="Contract Staff Administration System (CSA)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'CSA Main Menu'    

  it 'CFD', ->
    browser.moveToObject 'a[record="Contract Staff Funding Mgmt System (CFD)"]'
    browser.click 'a[record="Contract Staff Funding Mgmt System (CFD)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'Contract Staff Funding Management'
    
  it 'DVAS', ->
    browser.moveToObject 'a[record="Duty Visit Application System (DVAS)"]'
    browser.click 'a[record="Duty Visit Application System (DVAS)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'Duty Visit Application System'  
    
  it 'ERI', ->
    browser.moveToObject 'a[record="Electronic Request for IT Facilities (APOLLO) (ERI)"]'	 
    browser.click 'a[record="Electronic Request for IT Facilities (APOLLO) (ERI)"]'	        	
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'Electronic Request for IT Facilities (APOLLO)'
    
  it 'IAMS', ->
    browser.moveToObject 'a[record="Integrated Account Maintenance System (IAMS)"]'	 
    browser.click 'a[record="Integrated Account Maintenance System (IAMS)"]'	        	
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'Integrated Account Maintenance System'
    
  it 'ISAM', ->
    browser.moveToObject 'a[record="Integrated Software Asset Management System (ISAM)"]'	 
    browser.click 'a[record="Integrated Software Asset Management System (ISAM)"]'	        	
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'Integrated Software Asset Management System'
    
  it 'ITAS', ->
    browser.moveToObject 'a[record="IT Activity System (ITAS)"]'	 
    browser.click 'a[record="IT Activity System (ITAS)"]'	        	
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'IT Activity Administration'        
     
  it 'ORS', ->
    browser.moveToObject 'a[record="Online Reservation of Shared Facilities System (ORS)"]'
    browser.click 'a[record="Online Reservation of Shared Facilities System (ORS)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'Online Reservation of Shared Facilities'
    
  it 'OTA', ->
    browser.moveToObject 'a[record="Online Time-Off/Over-Time Approval (OTA)"]'
    browser.click 'a[record="Online Time-Off/Over-Time Approval (OTA)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'Online Time-Off / Over-Time Approval'  

  it 'SPARS', ->
    browser.moveToObject 'a[record="Security Patch Reminding System (SPARS)"]'
    browser.click 'a[record="Security Patch Reminding System (SPARS)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'Security Patch Reminding System (SPARS)'
    
  it 'SES', ->
    browser.moveToObject 'a[record="Staff Enquiry System (SES)"]'
    browser.click 'a[record="Staff Enquiry System (SES)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'Web Staff Enquiry System'
    
  it 'S&MRS', ->
    browser.moveToObject 'a[record="Standards and Methods Registration System (S&MRS)"]'
    browser.click 'a[record="Standards and Methods Registration System (S&MRS)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'Standards & Methods Registration System'
    
  it 'SRS', ->
    browser.moveToObject 'a[record="Supplier Registration System (SRS)"]'
    browser.click 'a[record="Supplier Registration System (SRS)"]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'SRS'    

  it 'TRS', ->
    browser.moveToObject 'a[record="Timesheet Reporting System (TRS)"]'
    browser.click 'a[record="Timesheet Reporting System (TRS)"]'	        	
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'Timesheet Reporting System'
    
  it 'UEMS', ->
    browser.moveToObject 'a[record="UEM Management System (UEMS)"]'
    browser.click 'a[record="UEM Management System (UEMS)"]'	        	
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'UEM Management System - Main Menu'  
  
  it 'eleave', ->
    browser.click 'a[record=e-leave]'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'eLAPS - Electronic Leave Application and Processing System'
    
  it 'eMAT', ->
    browser.click 'a[record="e-MAT"]'	        	
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'e-MAT'
     
  it 'ITMP', ->
    browser.newWindow config.portal.url + '/mpp/mpp/view/home'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'IT Activity-Based Manpower Planning'  
 
  it 'CPD', ->
    browser.newWindow config.portal.url + '/eogcio2https/cpd/'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.be.equal 'Continuing Professional Development'
    
  it 'eACPC', ->
    browser.newWindow config.portal.url + '/gipmshttp/GIPMS/MainPage'
    tabs = browser.getTabIds()
    if browser.getCurrentTabId() == tabs[0]
      appCount++
      browser.switchTab tabs[appCount]
    browser.getTitle().should.contain 'e-ACPC version'