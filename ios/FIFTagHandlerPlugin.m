//
//  FIFTagHandlerPlugin.m
//  Fifty-five
//
//  Created by Med on 09/12/14.
//  Copyright (c) 2014 Med. All rights reserved.

#import "FIFTagHandlerPlugin.h"

//GTM
#import "TAGContainer.h"
#import "TAGContainerOpener.h"
#import "TAGManager.h"
#import "TAGDataLayer.h"

//FIFTagHandler
#import <FIFTagHandler/FIFTagHandler.h>

@implementation FIFTagHandlerPlugin

- (void) initWithContainerId: (CDVInvokedUrlCommand*)command
{
  
    
    [self.commandDelegate runInBackground:^{

          CDVPluginResult* result = nil;
          NSString* containerId = [command.arguments objectAtIndex:0];
        //GTM
        TAGManager *tagManager = [TAGManager instance];
        //change it 
        [tagManager.logger setLogLevel:kTAGLoggerLogLevelVerbose];
        
        id<TAGContainerFuture> future = [TAGContainerOpener openContainerWithId:containerId
                                                                     tagManager:tagManager
                                                                       openType:kTAGOpenTypePreferFresh
                                                                        timeout:nil];
        
        
        TAGContainer *container = [future get];
        [container refresh];
        
        
        //FIFTagHandler
        [[FIFTagHandler sharedHelper] initTagHandlerWithManager:tagManager
                                                      container:container];
        
        

        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:result callbackId:[command callbackId]];
     }];
}

- (void) push: (CDVInvokedUrlCommand*)command
{
    CDVPluginResult* result = nil;
    NSDictionary* params = [command.arguments objectAtIndex:0];
    
    // Fetch the datalayer
    TAGDataLayer *dataLayer = [TAGManager instance].dataLayer;
    
    if (!dataLayer) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"FIFTagHandler not initialized"];
    } else {
        [dataLayer push:params];
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    
    [self.commandDelegate sendPluginResult:result callbackId:[command callbackId]];
}

- (void) setVerboseLoggingEnabled: (CDVInvokedUrlCommand*)command
{
    CDVPluginResult* result = nil;
    int logLevel = [command.arguments objectAtIndex:0];
    
    TAGManager *tagManager = [TAGManager instance];
    [tagManager.logger setLogLevel:kTAGLoggerLogLevelVerbose];

    result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:result callbackId:[command callbackId]];
    
}

@end
