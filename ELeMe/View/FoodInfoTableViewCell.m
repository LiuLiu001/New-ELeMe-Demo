//
//  FoodInfoTableViewCell.m
//  ELeMe
//
//  Created by Aidyliu on 2018/2/6.
//  Copyright © 2018年 Aidy. All rights reserved.
//

#import "FoodInfoTableViewCell.h"

@implementation FoodInfoTableViewCell
{
    NSInteger foodCount;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    foodCount = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addButtonAction:(id)sender {
    foodCount ++;
    if (foodCount == 1) {
        self.countLabel.hidden = NO;
        self.subButton.hidden = NO;
        [UIView animateWithDuration:0.2 animations:^{
            self.countLabelTreadingConstraint.constant = 10;
            self.subButtonTreadingConstraint.constant = 10;
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }
    [self updateSelectedFoodNum];
}

- (IBAction)subButtonAction:(id)sender {
    if (foodCount > 0) {
        foodCount --;
        if (foodCount == 0) {
            
            [UIView animateWithDuration:0.2 animations:^{
                self.countLabelTreadingConstraint.constant = -10;
                self.subButtonTreadingConstraint.constant = -20;
                [self layoutIfNeeded];
            } completion:^(BOOL finished) {
                self.countLabel.hidden = YES;
                self.subButton.hidden = YES;
            }];
        }
        [self updateSelectedFoodNum];
    }
}

- (void)updateSelectedFoodNum{
    self.countLabel.text = [NSString stringWithFormat:@"%ld",foodCount];
}

@end
