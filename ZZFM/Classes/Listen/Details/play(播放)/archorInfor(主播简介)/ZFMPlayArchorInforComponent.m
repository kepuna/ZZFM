//
//  ZFMPlayArchorInforComponent.m
//  ZZFM
//
//  Created by donews on 2018/9/27.
//  Copyright © 2018年 donews. All rights reserved.
//  播放界面 - 主播简介

#import "ZFMPlayArchorInforComponent.h"
#import "ZFMPlayArchorCollectionViewCell.h"

@implementation ZFMPlayArchorInforComponent

- (instancetype)init {
    if (self = [super init]) {
        self.size = CGSizeMake(DDComponentAutomaticDimension, 120);
    }
    return self;
}

#pragma mark - Overwite Method
- (void)prepareCollectionView {
    [super prepareCollectionView];
    
    [self.collectionView registerClass:[ZFMPlayArchorCollectionViewCell class] forCellWithReuseIdentifier:[[ZFMPlayArchorCollectionViewCell class]description]];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZFMPlayArchorCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[[ZFMPlayArchorCollectionViewCell class]description] forIndexPath:indexPath];
    cell.backgroundColor = [UIColor purpleColor];
    return cell;
    
}

@end
