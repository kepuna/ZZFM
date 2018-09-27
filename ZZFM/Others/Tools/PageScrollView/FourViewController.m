//
//  FourViewController.m
//  HVScrollView
//
//  Created by Libo on 17/6/12.
//  Copyright © 2017年 iDress. All rights reserved.
//

#import "FourViewController.h"
#import "ZFMAlbumTrackListCell.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ----------- 分页菜单SPPageMenu的框架github地址:https://github.com/SPStore/SPPageMenu ---------
    // ----------- 本demo地址:https://github.com/SPStore/HVScrollView ----------
    [self.tableView registerClass:[ZFMAlbumTrackListCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = 60;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZFMAlbumTrackListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"11111";
    return cell;
}

@end
