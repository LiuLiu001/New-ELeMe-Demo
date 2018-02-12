//
//  RestaurantViewController.m
//  ELeMe
//
//  Created by Aidyliu on 2018/2/5.
//  Copyright © 2018年 Aidy. All rights reserved.
//

#import "RestaurantViewController.h"
#import "Food.h"
#import "FoodInfoTableViewCell.h"
#import "MJPopTool.h"
#import "CommentTableViewCell.h"

//#define ScreenWidth    [UIScreen mainScreen].bounds.size.width;
//#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface RestaurantViewController ()<
UIScrollViewDelegate,
UITableViewDelegate,
UITableViewDataSource,
UIGestureRecognizerDelegate
>{
    BOOL islove;
    BOOL isComment;
    NSMutableArray *foodArray;
    CGFloat ScreenWidth;
    CGFloat ScreenHeight;
    NSInteger foodCount;
    NSMutableArray *selectedFoodArray;
    
    BOOL isFromFirstPage;
}

@end

@implementation RestaurantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    foodArray = [[NSMutableArray alloc]init];
    ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    ScreenHeight = [UIScreen mainScreen].bounds.size.height;
    isFromFirstPage = YES;
    
    [self.mainScrollerView setContentSize:CGSizeMake(ScreenWidth * (self.curRestaurant.foodArray.count + 1), 0)];
    self.mainScrollerView.showsVerticalScrollIndicator = NO;
    self.mainScrollerView.pagingEnabled = YES;
    self.mainScrollerView.alwaysBounceVertical = NO;
    
    //赋值
    UIImage *envImage = [UIImage imageNamed:self.curRestaurant.environmentImage];
    UIImageView *envImageView = [[UIImageView alloc]initWithImage:envImage];
    envImageView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    [self.mainScrollerView addSubview:envImageView];
    NSArray *datadic = self.curRestaurant.foodArray;
    for (int i = 0; i < datadic.count; i ++) {
        Food *food = [[Food alloc]init];
        food.foodName = [datadic[i] valueForKey:@"foodName"];
        food.foodImage = [datadic[i] valueForKey:@"foodImage"];
        food.foodPrice =  [datadic[i] valueForKey:@"foodPrice"];
        food.foodMinImage = [datadic[i] valueForKey:@"foodMinImage"];
        [foodArray addObject:food];
        
//        UIView *foodView = [[UIView alloc]initWithFrame:CGRectMake((i + 1) * ScreenWidth, 0, ScreenWidth, ScreenHeight)];
        UIImageView *foodImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:food.foodImage]];
        foodImageView.clipsToBounds = YES;
        foodImageView.frame = CGRectMake((i + 1) * ScreenWidth, 0, ScreenWidth, ScreenHeight);
        foodImageView.contentMode = UIViewContentModeScaleAspectFill;
//        [foodView addSubview:foodImageView];
        [self.mainScrollerView addSubview:foodImageView];
    }
    
    //
    foodCount = 0;
    self.foodCountLabel.text = [NSString stringWithFormat:@"%ld",foodCount];
    
    //Tap Action Register
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideShopping)];
    recognizer.delegate = self;
    [self.tapView addGestureRecognizer:recognizer];
    
    UITapGestureRecognizer *commentRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeCommentButtonAction:)];
    recognizer.delegate = self;
    [self.coverView addGestureRecognizer:commentRecognizer];
    
    // 轻扫手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showShopping)];
    // 设置轻扫的方向
    swipe.direction = UISwipeGestureRecognizerDirectionUp;
    [self.mainScrollerView addGestureRecognizer:swipe];
    swipe.delegate = self;
    
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)setUI{
    self.nameLabel.hidden = YES;
    self.signLabel.hidden = YES;
    self.priceLable.hidden = YES;
    self.addButton.hidden = YES;
    self.shoppingCartButton.hidden = YES;
    
    self.addView.layer.cornerRadius = 21;
    self.addView.layer.masksToBounds = YES;
    self.addView.hidden = YES;
    
    self.resNameLabel.text = self.curRestaurant.resName;
    self.resInfo.text = [NSString stringWithFormat:@"%@/起送费200元起/配送费20元",self.curRestaurant.resLocation];
    self.salesInfo.text = @"全场满500减50";
    
    self.shoppingDetailHeightConstraint.constant = ScreenHeight;
    self.shoppingTopConstraint.constant = 0;
    
    self.shoppingSubmitView.hidden = YES;
    self.shoppingSubmitView.layer.cornerRadius = 10;
    self.shoppingSubmitView.layer.masksToBounds = YES;
    
    self.summaryFoodcountLabel.text = [NSString stringWithFormat:@"%ld",foodCount];

    
    self.foodListTableview.tableFooterView=[[UIView alloc]init];//去除多余的线
    
    //加阴影
    self.nameLabel.layer.shadowRadius = 1;
    self.nameLabel.layer.shadowOpacity = 0.4;
    self.nameLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    self.nameLabel.layer.shadowOffset = CGSizeMake(0, 0);
    
    self.signLabel.layer.shadowRadius = 1;
    self.signLabel.layer.shadowOpacity = 0.4;
    self.signLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    self.signLabel.layer.shadowOffset = CGSizeMake(0, 0);
    
    self.priceLable.layer.shadowRadius = 1;
    self.priceLable.layer.shadowOpacity = 0.4;
    self.priceLable.layer.shadowColor = [UIColor blackColor].CGColor;
    self.priceLable.layer.shadowOffset = CGSizeMake(0, 0);
    
    self.loveLable.layer.shadowRadius = 1;
    self.loveLable.layer.shadowOpacity = 0.4;
    self.loveLable.layer.shadowColor = [UIColor blackColor].CGColor;
    self.loveLable.layer.shadowOffset = CGSizeMake(0, 0);
    
    self.commentLabel.layer.shadowRadius = 1;
    self.commentLabel.layer.shadowOpacity = 0.4;
    self.commentLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    self.commentLabel.layer.shadowOffset = CGSizeMake(0, 0);
    
    self.commentListView.layer.masksToBounds = YES;
    self.commentListView.layer.cornerRadius = 10;
    
    self.commentViewHeightConstraint.constant = ScreenHeight;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ScrollerView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.tag == 1) {
        if (scrollView.contentOffset.x != 0 && scrollView.contentOffset.x > 0) {
            self.nameLabel.hidden = NO;
            self.signLabel.hidden = NO;
            self.priceLable.hidden = NO;
            self.addButton.hidden = NO;
            self.shoppingCartButton.hidden = NO;
            if (isFromFirstPage) {
                self.nameLabel.alpha = 0.1;
                self.signLabel.alpha = 0.1;
                self.priceLable.alpha = 0.1;
                self.addButton.alpha = 0.1;
                self.shoppingCartButton.alpha = 0.1;
                [UIView animateWithDuration:0.25 animations:^{
                    self.nameLabel.alpha = 1;
                    self.signLabel.alpha = 1;
                    self.priceLable.alpha = 1;
                    self.addButton.alpha = 1;
                    self.shoppingCartButton.alpha = 1;
                } completion:^(BOOL finished) {
                    
                }];
            }
            
            NSInteger index = scrollView.contentOffset.x / ScreenWidth;
            Food *curFood = foodArray[index - 1];
            self.nameLabel.text = curFood.foodName;
            self.priceLable.text = [curFood.foodPrice stringValue];
            
            isFromFirstPage = NO;
        }else{
            self.nameLabel.hidden = YES;
            self.signLabel.hidden = YES;
            self.priceLable.hidden = YES;
            self.addButton.hidden = YES;
            self.shoppingCartButton.hidden = YES;
            
            isFromFirstPage = YES;
//            self.addView.hidden = YES;
        }
    }
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView.tag == 4) {
        NSLog(@"%f",scrollView.contentOffset.y);
        if (scrollView.contentOffset.y < - 50) {
            [self hideShopping];
        }
    }
    if (scrollView.tag == 3) {
        NSLog(@"%f",scrollView.contentOffset.y);
        if (scrollView.contentOffset.y < - 50) {
            [self closeCommentButtonAction:nil];
        }
    }
}
#pragma mark - Tableview Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 3) {
        return 33;
    }
    return foodArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 4) {
        Food *curFood = (Food *)foodArray[indexPath.row];
        FoodInfoTableViewCell *foodCell = [tableView dequeueReusableCellWithIdentifier:@"FoodInfoTableViewCell"];
        [foodCell.foodImageView setImage:[UIImage imageNamed:curFood.foodMinImage]];
        foodCell.foodNameLabel.text = curFood.foodName;
        foodCell.foodPriceLabel.text = [NSString stringWithFormat:@"￥%@",curFood.foodPrice];
        foodCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return foodCell;
    }else if (tableView.tag == 3){
        CommentTableViewCell *commentCell = [tableView dequeueReusableCellWithIdentifier:@"CommentTableViewCell"];
        if (indexPath.row % 2 == 1) {
            [commentCell.photoImageView setImage:[UIImage imageNamed:@"girlHead"]];
        }else{
            [commentCell.photoImageView setImage:[UIImage imageNamed:@"boyHead"]];
        }
        commentCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return commentCell;
    }
    else{
        Food *curFood = (Food *)foodArray[indexPath.row];
        FoodInfoTableViewCell *foodCell = [tableView dequeueReusableCellWithIdentifier:@"FoodInfoTableViewCell"];
//        [foodCell.foodImageView setImage:[UIImage imageNamed:curFood.foodMinImage]];
        foodCell.foodNameLabel.text = curFood.foodName;
        foodCell.foodPriceLabel.text = [NSString stringWithFormat:@"￥%@",curFood.foodPrice];
        foodCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return foodCell;
    }
}

#pragma mark - ButtonActions
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)loveButtonAction:(id)sender {
    if (islove) {
        [self.loveButton setImage:[UIImage imageNamed:@"love"] forState:UIControlStateNormal];
    }else{
        [self.loveButton setImage:[UIImage imageNamed:@"loved"] forState:UIControlStateNormal];
    }
    islove = !islove;
}
- (IBAction)commentButtonAction:(id)sender {
    [UIView animateWithDuration:0.25 animations:^{
        self.commentViewTopConstraint.constant = -ScreenHeight;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.coverView.hidden = NO;
    }];
    if (isComment) {
        [self.commentButton setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
    }else{
        [self.commentButton setImage:[UIImage imageNamed:@"commented"] forState:UIControlStateNormal];
    }
    isComment = !isComment;
}

- (IBAction)addButtonAction:(id)sender {
    if (self.addButtonTreadingConstratint.constant == 30) {
        [UIView animateWithDuration:0.25 animations:^{
            self.addButtonTreadingConstratint.constant = 110;
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            self.addView.hidden = NO;
        }];
    }else{
        self.addView.hidden = YES;
        [UIView animateWithDuration:0.25 animations:^{
            self.addButtonTreadingConstratint.constant = 30;
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (IBAction)shoppingCartButtonAction:(id)sender {
    self.shoppingSubmitView.hidden = NO;
    [[MJPopTool sharedInstance] popView:self.shoppingSubmitView animated:YES];
    self.mainCoverView.hidden = NO;
}

- (IBAction)subNumButtonAction:(id)sender {
    if (foodCount > 0) {
        foodCount --;
        [self updateSelectedFoodNum];
    }
}

- (IBAction)addNumButtonAction:(id)sender {
    foodCount ++;
    [self updateSelectedFoodNum];
}

- (IBAction)payAction:(id)sender {
    [[MJPopTool sharedInstance] closeAnimated:YES];
    self.mainCoverView.hidden = YES;
}

- (IBAction)closeCommentButtonAction:(id)sender {
    self.coverView.hidden = YES;
    [UIView animateWithDuration:0.25 animations:^{
        self.commentViewTopConstraint.constant = 0;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showShopping{
    [UIView animateWithDuration:0.25 animations:^{
        self.shoppingTopConstraint.constant = ScreenHeight;
        self.mainScollerViewBottomConstraint.constant = ScreenHeight * 0.3;
        self.mainScollerViewTopConstraint.constant -= ScreenHeight * 0.3;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hideShopping{
    [UIView animateWithDuration:0.25 animations:^{
        self.shoppingTopConstraint.constant = 0;
        self.mainScollerViewBottomConstraint.constant = 0;
        self.mainScollerViewTopConstraint.constant = -40;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)updateSelectedFoodNum{
    self.foodCountLabel.text = [NSString stringWithFormat:@"%ld",foodCount];
    self.shoppingCartButton.badgeValue = [NSString stringWithFormat:@"%ld",foodCount];
    self.shoppingCartButton.badgeBGColor = [UIColor colorWithRed:242./255. green:82./255. blue:103./255. alpha:1];
    self.shoppingCartButton.badgeOriginX = 25;
    self.shoppingCartButton.badgeOriginY = -8;
    
    self.summaryFoodcountLabel.text = [NSString stringWithFormat:@"%ld",foodCount];
}

#pragma mark - Keyboard Up Down

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
