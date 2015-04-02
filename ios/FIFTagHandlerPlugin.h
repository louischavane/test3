//
//  FIFTagHandlerPlugin.h
//  Fifty-five
//
//  Created by Med on 09/12/14.
//  Copyright (c) 2014 Med. All rights reserved.

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import "TAGManager.h"


@interface FIFTagHandlerPlugin : CDVPlugin {
}

- (void) initWithContainerId: (CDVInvokedUrlCommand*)command;
- (void) push: (CDVInvokedUrlCommand*)command;
- (void) setVerboseLoggingEnabled: (CDVInvokedUrlCommand*)command;


@end
