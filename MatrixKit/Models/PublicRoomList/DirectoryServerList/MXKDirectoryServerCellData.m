/*
 Copyright 2017 Vector Creations Ltd

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MXKDirectoryServerCellData.h"

#import "NSBundle+MatrixKit.h"

@implementation MXKDirectoryServerCellData;
@synthesize desc, icon;
@synthesize homeserver, includeAllNetworks;
@synthesize thirdPartyProtocolInstance, thirdPartyProtocol;

- (id)initWithHomeserver:(NSString *)theHomeserver includeAllNetworks:(BOOL)theIncludeAllNetworks
{
    self = [super init];
    if (self)
    {
        homeserver = theHomeserver;
        includeAllNetworks = theIncludeAllNetworks;

        if (theIncludeAllNetworks)
        {
            desc = homeserver;
            icon = nil;
        }
        else
        {
            // Use the Matrix name and logo when looking for Matrix rooms only
            desc = [NSBundle mxk_localizedStringForKey:@"matrix"];
            icon = [NSBundle mxk_imageFromMXKAssetsBundleWithName:@"network_matrix"];
        }
    }
    return self;
}

- (id)initWithProtocolInstance:(MXThirdPartyProtocolInstance *)instance protocol:(MXThirdPartyProtocol *)protocol
{
    self = [super init];
    if (self)
    {
        thirdPartyProtocolInstance = instance;
        thirdPartyProtocol = protocol;
        desc = thirdPartyProtocolInstance.desc;
        icon = nil;
    }
    return self;
}

@end
