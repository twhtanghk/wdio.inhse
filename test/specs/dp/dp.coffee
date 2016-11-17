_ = require 'lodash'
config = require './config.coffee'

class Test
  constructor: (opts) ->
    _.extend @, opts

  @lastTab: ->
    browser
      .getTitle()
      .then browser.getTabIds
      .then (tabs) ->
        [..., last] = tabs
        browser.switchTab last

  check: ->
    browser
      .pause @delay || 1000
      .then browser.getTitle
      .then (title) =>
        title.should.match @title

class Popup extends Test
  run: ->
    browser.newWindow @url

class Click extends Test
  run: ->
    browser
      .moveToObject @selector
      .then =>
        browser.click @selector
    
apps = 
  CSA:
    selector: 'a[record="Contract Staff Administration System (CSA)"]'
    title: /CSA Main Menu|CSA Select Login Page/
    test: ->
      new Click @
  CFD:
    selector: 'a[record="Contract Staff Funding Mgmt System (CFD)"]'
    title: /Contract Staff Funding Management/
    check: ->
      browser
        .getText('font.colHeader')
        .then (text) ->
          text.should.equal 'You are not authorized to access this application.'
    test: ->
      new Click @
  DVAS:
    selector: 'a[record="Duty Visit Application System (DVAS)"]'
    title: /Duty Visit Application System/
    test: ->
      new Click @
  ERI:
    selector: 'a[record="Electronic Request for IT Facilities (APOLLO) (ERI)"]'
    title: /Electronic Request for IT Facilities \(APOLLO\)/
    test: ->
      new Click @
  IAMS: 
    selector: 'a[record="Integrated Account Maintenance System (IAMS)"]'
    title: /Integrated Account Maintenance System/
    test: ->
      new Click @
  ISAM:
    selector: 'a[record="Integrated Software Asset Management System (ISAM)"]'
    title: /Integrated Software Asset Management System/
    test: ->
      new Click @
  ITAS:
    selector: 'a[record="IT Activity System (ITAS)"]'
    title: /IT Activity Administration/
    check: ->
      browser
        .getText('td.text_msg')
        .then (text) ->
          text.should.equal 'You are not authorized to access this application.'
    test: ->
      new Click @
  ORS:
    selector: 'a[record="Online Reservation of Shared Facilities System (ORS)"]'
    title: /Online Reservation of Shared Facilities/
    test: ->
      new Click @
  OTA:
    selector: 'a[record="Online Time-Off/Over-Time Approval (OTA)"]'
    title: /Online Time\-Off \/ Over\-Time Approval/
    test: ->
      new Click @
  SPARS:
    selector: 'a[record="Security Patch Reminding System (SPARS)"]'
    title: /Security Patch Reminding System \(SPARS\)/
    test: ->
      new Click @
  SES:
    selector: 'a[record="Staff Enquiry System (SES)"]'
    title: /Web Staff Enquiry System/
    test: ->
      new Click @
  'S&MRS':
    selector: 'a[record="Standards and Methods Registration System (S&MRS)"]'
    title: /Standards & Methods Registration System/
    check: ->
      browser
        .getText('font.colHeader')
        .then (text) ->
          text.should.equal 'You are not authorized to access this application.'
    test: ->
      new Click @
  TRS:
    selector: 'a[record="Timesheet Reporting System (TRS)"]'
    title: /Timesheet Reporting System/
    test: ->
      new Click @
  UEMS:
    selector: 'a[record="UEM Management System (UEMS)"]'
    title: /UEM Management System - Main Menu/
    test: ->
      new Click @
  eleave: 
    selector: 'a[record=e-leave]'
    title: /eLAPS - Electronic Leave Application and Processing System/
    test: ->
      new Click @
  eMAT:
    selector: 'a[record="e-MAT"]', 
    title: /e\-MAT|Electronic Medical Appointment Time\-off Application and Recording System/
    delay: 8000
    test: ->
      new Click @
  ITMP:
    url: "#{config.portal.url}/mpp/mpp/view/home"
    title: /IT Activity-Based Manpower Planning/
    test: ->
      new Popup @
  CPD:
    url: "#{config.portal.url}/eogcio2https/cpd/"
    title: /Continuing Professional Development/
    test: ->
      new Popup @
  eACPC:
    url: "#{config.portal.url}/gipmshttp/GIPMS/MainPage"
    title: /e-ACPC version/
    test: ->
      new Popup @

describe 'dp', ->

  before ->
    browser
      .url config.portal.url
      .setValue 'input#IDToken1', config.portal.user.name
      .setValue 'input#IDToken2', config.portal.user.pass
      .click 'input[type=submit]'
      .getTitle()
      .then (title) ->
        title.should.be.equal 'Welcome - OGCIO DP'
        browser.click 'div[record="In-house Applications"]'

  _.each apps, (app, name) ->
    it name, ->
      test = app.test()
      test
        .run()
        .then ->
          Test.lastTab()
        .then ->
          test.check()
