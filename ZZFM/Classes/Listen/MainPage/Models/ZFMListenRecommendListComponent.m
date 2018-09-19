//
//  ZFMListenRecommendListComponent.m
//  ZZFM
//
//  Created by donews on 2018/9/3.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMListenRecommendListComponent.h"
#import "ZFMMacro.h"
#import "ZFMPublic.h"
#import "ZFMListenRecommendListCell.h"
#import "ZFMListenRecommendListCellFrameModel.h"
#import "ZFMListenRecommendListModel.h"
#import "ZFMAlbumDetailViewController.h"

@implementation ZFMListenRecommendListComponent

- (instancetype)init {
    if (self = [super init]) {
        self.size = CGSizeMake(DDComponentAutomaticDimension, 100);
        //        self.sectionInset = UIEdgeInsetsMake(10, 0, 15, 0);
        //        self.itemSpacing = 0;
//        self.lineSpacing = 0;
    }
    return self;
}

#pragma mark - Overwite Method
- (void)prepareCollectionView {
    [super prepareCollectionView];
    
    // 注册cell
    [self.collectionView registerClass:[ZFMListenRecommendListCell class] forCellWithReuseIdentifier:[[ZFMListenRecommendListCell class]description]];
   
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.recommendList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZFMListenRecommendListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[[ZFMListenRecommendListCell class]description] forIndexPath:indexPath];
    ZFMListenRecommendModel *model = self.recommendList[indexPath.row];
    [cell setLayout:[[ZFMListenRecommendListCellFrameModel alloc] initWithModel:model] ];
    return cell;
    
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return [[self.frameModels zz_objectOrNilAtIndex:indexPath.item] itemSize];
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [NSObject zz_currentTopViewController];
    ZFMAlbumDetailViewController *detailVC = [[ZFMAlbumDetailViewController alloc] init];
    ZFMListenRecommendModel *model = self.recommendList[indexPath.row];
    detailVC.albumId = model.albumId;
    detailVC.trackId = model.trackId;
    [vc.navigationController pushViewController:detailVC animated:YES];
//    if (self.viewModel.articleCellClickBlock) {
//        self.viewModel.articleCellClickBlock([self.frameModels zz_objectOrNilAtIndex:indexPath.item]);
//    }
}

@end
