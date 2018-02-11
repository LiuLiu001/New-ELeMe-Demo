//
//  Restaurant.h
//  ELeMe
//
//  Created by Aidyliu on 2018/2/5.
//  Copyright © 2018年 Aidy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject
@property (nonatomic,strong) NSString *resName;
@property (nonatomic,strong) NSString *resMainImage;
@property (nonatomic,strong) NSString *resLocation;
@property (nonatomic,strong) NSString *environmentImage;
@property (nonatomic,strong) NSArray *foodArray;
@property (nonatomic,strong) NSNumber *resStarNum;
@property (nonatomic,strong) NSNumber *resCommentNum;
@end

