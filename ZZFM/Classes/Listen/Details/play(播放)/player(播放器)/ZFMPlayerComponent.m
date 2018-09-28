//
//  ZFMPlayerComponent.m
//  ZZFM
//
//  Created by donews on 2018/9/27.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMPlayerComponent.h"
#import "ZFMPlayerCollectionViewCell.h"

@implementation ZFMPlayerComponent

- (instancetype)init {
    if (self = [super init]) {
        self.size = CGSizeMake(DDComponentAutomaticDimension, 500);
    }
    return self;
}

#pragma mark - Overwite Method
- (void)prepareCollectionView {
    [super prepareCollectionView];
    
    [self.collectionView registerClass:[ZFMPlayerCollectionViewCell class] forCellWithReuseIdentifier:[[ZFMPlayerCollectionViewCell class]description]];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZFMPlayerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[[ZFMPlayerCollectionViewCell class]description] forIndexPath:indexPath];
    return cell;
    
}

@end
