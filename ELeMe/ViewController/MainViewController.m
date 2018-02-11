//
//  MainViewController.m
//  ELeMe
//
//  Created by Aidyliu on 2018/2/5.
//  Copyright © 2018年 Aidy. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "Restaurant.h"
#import "Food.h"
#import "RestaurantViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *resMutableArray;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    resMutableArray = [[NSMutableArray alloc]init];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"RestaurantDataList" ofType:@"plist"];
    NSMutableArray *datadic = [[NSMutableArray alloc]initWithContentsOfFile:path];
    for (int i = 0; i < datadic.count; i++) {
        Restaurant *res = [[Restaurant alloc]init];
        res.resName = [datadic[i] valueForKey:@"name"];
        res.resLocation = [datadic[i] valueForKey:@"location"];
        res.resMainImage = [datadic[i] valueForKey:@"mainImage"];
        res.environmentImage = [datadic[i] valueForKey:@"environmentImage"];
        res.resCommentNum = [datadic[i] valueForKey:@"commentNum"];
        res.resStarNum = [datadic[i] valueForKey:@"starNum"];
        //food
        NSArray *foodArray = [datadic[i] valueForKey:@"foodArray"];
        res.foodArray = foodArray;
        [resMutableArray addObject:res];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return resMutableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Restaurant *curRes = resMutableArray[indexPath.row];
    MainTableViewCell *mainCell = [tableView dequeueReusableCellWithIdentifier:@"MainTableViewCell"];
    mainCell.nameLabel.text = curRes.resName;
    mainCell.loactionLabel.text = curRes.resLocation;
    [mainCell.backgroundImageView setImage:[UIImage imageNamed:curRes.resMainImage]];
    mainCell.commentLabel.text = [NSString stringWithFormat:@"(%@)",curRes.resCommentNum.stringValue];
    mainCell.scoreLabel.text = curRes.resStarNum.stringValue;
    mainCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return mainCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RestaurantViewController *restaruantVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RestaurantViewController"];
    restaruantVC.curRestaurant = resMutableArray[indexPath.row];
    [self.navigationController pushViewController:restaruantVC animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
