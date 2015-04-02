//
//  FIFTagHandler
//  Fifty-five
//
//  Created by Med on 09/12/14.
//  Copyright (c) 2014 Med. All rights reserved.

'use strict';

var argscheck = require('cordova/argscheck'),
    utils     = require('cordova/utils'),
    exec      = require('cordova/exec'),
    platform  = require('cordova/platform');


function FIFTagHandler() {
}

FIFTagHandler.prototype = {


  initWithContainerId: function (containerId, success, error) {
    argscheck.checkArgs('sFF', 'fiftaghandler.initWithContainerId', arguments);
    exec(success, error, 'FIFTagHandler', 'initWithContainerId', [containerId]);
  },

  push: function (map, success, error) {
    argscheck.checkArgs('oFF', 'fiftaghandler.push', arguments);
    exec(success, error, 'FIFTagHandler', 'push', [map]);
  },

  setVerboseLoggingEnabled: function ( success, error) {
    argscheck.checkArgs('FF', 'analytics.setLogLevel', arguments);
    exec(success, error, 'FIFTagHandler', 'setVerboseLoggingEnabled', []);
  },

};

module.exports = new FIFTagHandler();
