//
//  DNNetworkManager+SSL.h
//  DoNewsNetworking
//
//  Created by Ming on 2018/9/11.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "DNNetworkManager.h"

@class AFURLSessionManager;
@class AFSecurityPolicy;
@interface DNNetworkManager (SSL)

+ (AFSecurityPolicy*)customSecurityPolicy;
+ (void)checkCredential:(AFURLSessionManager *)manager;

@end
