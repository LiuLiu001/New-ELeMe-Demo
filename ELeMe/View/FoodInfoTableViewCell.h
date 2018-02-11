//
//  FoodInfoTableViewCell.h
//  ELeMe
//
//  Created by Aidyliu on 2018/2/6.
//  Copyright © 2018年 Aidy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *foodImageView;
@property (weak, nonatomic) IBOutlet UILabel *foodNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *foodPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIButton *subButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *countLabelTreadingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *subButtonTreadingConstraint;

@end
