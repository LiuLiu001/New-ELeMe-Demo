//
//  CommentTableViewCell.m
//  ELeMe
//
//  Created by Aidyliu on 2018/2/11.
//  Copyright © 2018年 Aidy. All rights reserved.
//

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)heartButtonAction:(id)sender {
    [self.heartImageView setImage:[UIImage imageNamed:@"smallHeart_Selected"]];
    self.commentCountLabel.textColor = [UIColor colorWithRed:242./255. green:82./255. blue:103./255 alpha:1];
}

@end
