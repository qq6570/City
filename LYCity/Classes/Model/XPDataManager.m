//
//  XPDataManager.m
//  WeatherForecast
//
//  Created by dragon on 16/6/17.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPDataManager.h"
#import "XPCityGroup.h"

@implementation XPDataManager

//单例：一个类只有一个对象(NSArray)
static XPDataManager *_dataManager = nil;
+ (XPDataManager *)sharedDataManger {
    if (!_dataManager) {
        _dataManager = [XPDataManager new];
    }
    return _dataManager;
}
static NSArray *_cityGroupArray = nil;
+ (NSArray *)getAllCityGroups {
    if (_cityGroupArray.count == 0) {
        _cityGroupArray = [[self alloc] getCityGroups];
    }
    return _cityGroupArray;
}
- (NSArray *)getCityGroups {
    //读取plist文件
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"cityGroups.plist" ofType:nil];
    
    NSString *filePath = [[NSBundle bundleForClass:[XPDataManager class]] pathForResource:@"cityGroups" ofType:@"plist"];
    
    NSArray *cityGroupArray = [NSArray arrayWithContentsOfFile:filePath];
    //所有字典对象转成模型对象
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSDictionary *dic in cityGroupArray) {
        //声明一个空的TRCityGroup对象
        XPCityGroup *cityGroup = [XPCityGroup new];
        //KVC绑定模型对象属性和字典key的关系
        [cityGroup setValuesForKeysWithDictionary:dic];
        [mutableArray addObject:cityGroup];
    }
    
    return [mutableArray copy];
}



@end
