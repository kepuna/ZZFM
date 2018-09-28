//
//  ZFMPlayCommendComponent.m
//  ZZFM
//
//  Created by donews on 2018/9/27.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMPlayCommendComponent.h"
#import "ZFMPlayRecommendCollectionViewCell.h"

@implementation ZFMPlayCommendComponent

- (instancetype)init {
    if (self = [super init]) {
        self.size = CGSizeMake(DDComponentAutomaticDimension, 80);
    }
    return self;
}

#pragma mark - Overwite Method
- (void)prepareCollectionView {
    [super prepareCollectionView];
    
    [self.collectionView registerClass:[ZFMPlayRecommendCollectionViewCell class] forCellWithReuseIdentifier:[[ZFMPlayRecommendCollectionViewCell class]description]];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZFMPlayRecommendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[[ZFMPlayRecommendCollectionViewCell class]description] forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
    
}

@end
