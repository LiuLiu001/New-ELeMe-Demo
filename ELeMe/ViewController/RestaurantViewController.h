//
//  RestaurantViewController.h
//  ELeMe
//
//  Created by Aidyliu on 2018/2/5.
//  Copyright © 2018年 Aidy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"
#import "BageButton.h"

@interface RestaurantViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollerView;
@property (weak, nonatomic) IBOutlet UIButton *loveButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *signLabel;
@property (weak, nonatomic) IBOutlet UIView *addView;
@property (weak, nonatomic) IBOutlet UIButton *subNumButton;
@property (weak, nonatomic) IBOutlet UIButton *addNumButton;
@property (weak, nonatomic) IBOutlet UILabel *foodCountLabel;
@property (weak, nonatomic) IBOutlet BageButton *shoppingCartButton;
@property (weak, nonatomic) IBOutlet UILabel *resNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *resInfo;
@property (weak, nonatomic) IBOutlet UILabel *salesInfo;
@property (weak, nonatomic) IBOutlet UIView *tapView;
@property (weak, nonatomic) IBOutlet UIView *shoppingSubmitView;
@property (weak, nonatomic) IBOutlet UILabel *summaryFoodcountLabel;
@property (weak, nonatomic) IBOutlet UITableView *foodListTableview;
@property (weak, nonatomic) IBOutlet UILabel *loveLable;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentTitleLabel;
@property (weak, nonatomic) IBOutlet UIView *commentListView;
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;
@property (weak, nonatomic) IBOutlet UIView *coverView;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shoppingDetailHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shoppingTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addButtonTreadingConstratint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentViewTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *writeViewBottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentListTopConstraint;

@property (strong, nonatomic) Restaurant *curRestaurant;
@end
