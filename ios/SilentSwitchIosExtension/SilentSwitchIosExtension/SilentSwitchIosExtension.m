//
//  SilentSwitchIosExtension.m
//  SilentSwitchIosExtension
//
//  Created by Richard Lord on 08/12/2011.
//  Copyright (c) 2011 Stick Sports Ltd. All rights reserved.
//

#import "FlashRuntimeExtensions.h"
#import <AudioToolbox/AudioServices.h>

#define DEFINE_ANE_FUNCTION(fn) FREObject (fn)(FREContext context, void* functionData, uint32_t argc, FREObject argv[])

DEFINE_ANE_FUNCTION( initSilentSwitch )
{
    UInt32 sessionCategory = kAudioSessionCategory_AmbientSound;
    AudioSessionSetProperty( kAudioSessionProperty_AudioCategory, sizeof (sessionCategory), &sessionCategory );
    return NULL;
}

void SilentSwitchContextInitializer( void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet )
{
	*numFunctionsToSet = 1;
    
	FRENamedFunction* func = (FRENamedFunction*) malloc( sizeof(FRENamedFunction) );
    
	func[0].name = (const uint8_t*) "initSilentSwitch";
	func[0].functionData = NULL;
    func[0].function = &initSilentSwitch;
	
	*functionsToSet = func;
}

void SilentSwitchContextFinalizer( FREContext ctx )
{
	return;
}

void SilentSwitchExtensionInitializer( void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet ) 
{ 
    extDataToSet = NULL;  // This example does not use any extension data. 
    *ctxInitializerToSet = &SilentSwitchContextInitializer; 
    *ctxFinalizerToSet = &SilentSwitchContextFinalizer; 
}

void SilentSwitchExtensionFinalizer()
{
    return;
}