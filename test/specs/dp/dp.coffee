config = require './config.coffee'

apps = [
	{name: 'CSA', selector: 'a[record="Contract Staff Administration System (CSA)"]', title: 'CSA Main Menu'}
	{name: 'CFD', selector: 'a[record="Contract Staff Funding Mgmt System (CFD)"]', title: 'Contract Staff Funding Management'}
	{name: 'DVAS', selector: 'a[record="Duty Visit Application System (DVAS)"]', title: 'Duty Visit Application System'}
	{name: 'ERI', selector: 'a[record="Electronic Request for IT Facilities (APOLLO) (ERI)"]', title: 'Electronic Request for IT Facilities (APOLLO)'}
	{name: 'IAMS', selector: 'a[record="Integrated Account Maintenance System (IAMS)"]', title: 'Integrated Account Maintenance System'}
	{name: 'ISAM', selector: 'a[record="Integrated Software Asset Management System (ISAM)"]', title: 'Integrated Software Asset Management System'}
	{name: 'ITAS', selector: 'a[record="IT Activity System (ITAS)"]', title: 'IT Activity Administration'}
	{name: 'ORS', selector: 'a[record="Online Reservation of Shared Facilities System (ORS)"]', title: 'Online Reservation of Shared Facilities'}
	{name: 'OTA', selector: 'a[record="Online Time-Off/Over-Time Approval (OTA)"]', title: 'Online Time-Off / Over-Time Approval'}
	{name: 'SPARS', selector: 'a[record="Security Patch Reminding System (SPARS)"]', title: 'Security Patch Reminding System (SPARS)'}
	{name: 'SES', selector: 'a[record="Staff Enquiry System (SES)"]', title: 'Web Staff Enquiry System'}
	{name: 'S&MRS', selector: 'a[record="Standards and Methods Registration System (S&MRS)"]', title: 'Standards & Methods Registration System'}
	{name: 'SRS', selector: 'a[record="Supplier Registration System (SRS)"]', title: 'SRS'}
	{name: 'TRS', selector: 'a[record="Timesheet Reporting System (TRS)"]', title: 'Timesheet Reporting System'}
	{name: 'UEMS', selector: 'a[record="UEM Management System (UEMS)"]', title: 'UEM Management System - Main Menu'}
	{name: 'eleave', selector: 'a[record=e-leave]', title: 'eLAPS - Electronic Leave Application and Processing System'}
	{name: 'eMAT', selector: 'a[record="e-MAT"]', title: 'e-MAT'}
	{name: 'ITMP', url: config.portal.url + '/mpp/mpp/view/home', title: 'IT Activity-Based Manpower Planning'}
	{name: 'CPD', url: config.portal.url + '/eogcio2https/cpd/', title: 'Continuing Professional Development'}
	{name: 'eACPC', url: config.portal.url + '/gipmshttp/GIPMS/MainPage', title: 'e-ACPC version'}
	]		

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

  apps.forEach (app) ->
    it app.name, ->
      if app.selector
        browser.moveToObject app.selector
        browser.click app.selector
      else
        browser.newWindow app.url
      tabs = browser.getTabIds()
      if browser.getCurrentTabId() == tabs[0]
        appCount++
        browser.switchTab tabs[appCount]
      browser.getTitle().should.contain app.title