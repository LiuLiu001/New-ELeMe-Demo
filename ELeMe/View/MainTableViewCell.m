//
//  MainTableViewCell.m
//  ELeMe
//
//  Created by Aidyliu on 2018/2/5.
//  Copyright © 2018年 Aidy. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.whriteBackgroundView.clipsToBounds = NO;
    self.whriteBackgroundView.layer.shadowOffset = CGSizeMake(0,0);
    self.whriteBackgroundView.layer.shadowRadius = 2;
    self.whriteBackgroundView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.whriteBackgroundView.layer.shadowOpacity = 0.2;
    self.clipsToBounds = NO;
    
    self.commentLabel.layer.shadowOpacity = 0.95;
    self.commentLabel.layer.shadowOffset = CGSizeMake(0,0);
    self.commentLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    self.commentLabel.layer.shadowRadius = 5;
    self.scoreLabel.layer.shadowOpacity = 0.95;
    self.scoreLabel.layer.shadowOffset = CGSizeMake(0,0);
    self.scoreLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    self.scoreLabel.layer.shadowRadius = 5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
