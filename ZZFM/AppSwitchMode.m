//
//  AppSwitchMode.m
//  ZZFM
//
//  Created by donews on 2018/9/12.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "AppSwitchMode.h"
#import "DDSkinDefaultStorage.h"
#import "DDSkinManager.h"
#import "DDSkinDefaultStorageParser.h"

NSString * const DNNotificationSwitchMode = @"DNNotificationSwitchMode";
NSString * const DNNotificationSwitchModeKey = @"DNNotificationSwitchModeKey"; // 传递的字典模式的key
NSString * const DNNotificationSwitchModeValueDay = @"0"; // 夜间模式
NSString * const DNNotificationSwitchModeValueNight = @"1"; // 夜间模式

@interface AppSwitchMode() <DDSkinDefaultStorageParserDelegate>

@property (strong, nonatomic) NSArray<DDSkinStorage *> *storages;

@end

@implementation AppSwitchMode


- (instancetype)init {
    if (self == [super init]) {
        self.storages = @[[self storageWithName:@"day"], [self storageWithName:@"night"]];
        NSString *value = [[NSUserDefaults standardUserDefaults] objectForKey:DNNotificationSwitchModeKey];
        [self __setSkintWithModeValue:value];
    }
    return self;
}

- (void)registerNotificationSwitchModel {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(s_switchingMode:) name:DNNotificationSwitchMode object:nil];
}

- (void)removeNotificationSwitchModel {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)__setSkintWithModeValue:(NSString *)value {
    if ([value isEqualToString:DNNotificationSwitchModeValueNight]) {
        [DDSkinManager setCurrentStorage:self.storages[1]];
    } else {
        [DDSkinManager setCurrentStorage:self.storages[0]];
    }
    if (self.addObserverNotificationBlock) {
        self.addObserverNotificationBlock();
    }
}

- (void)s_switchingMode:(NSNotification *)noti {
    NSString *value = noti.userInfo[DNNotificationSwitchModeKey];
    [self __setSkintWithModeValue:value];
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:DNNotificationSwitchModeKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (DDSkinStorage *)storageWithName:(NSString *)name {
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"plist"]];
    DDSkinDefaultStorageParser *parser = [[DDSkinDefaultStorageParser alloc] initWithDictionary:dict];
    parser.delegate = self;
    [parser parse];
    
    return parser.skinStorage;
}

- (DDSkinStorage *)skinDefaultStorageParser:(DDSkinDefaultStorageParser *)parser superStorageWithKey:(NSString *)key value:(NSString *)value {
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:value ofType:@"plist"]];
    DDSkinDefaultStorageParser *parser1 = [[DDSkinDefaultStorageParser alloc] initWithDictionary:dict];
    parser1.delegate = self;
    [parser1 parse];
    return parser1.skinStorage;
}

@end
