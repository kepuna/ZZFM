//
//  ZFMPlayAlbumInforComponent.m
//  ZZFM
//
//  Created by donews on 2018/9/27.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMPlayAlbumInforComponent.h"
#import "ZFMPlayAlbumInfoCollectionViewCell.h"

@implementation ZFMPlayAlbumInforComponent

- (instancetype)init {
    if (self = [super init]) {
        self.size = CGSizeMake(DDComponentAutomaticDimension, 180);
    }
    return self;
}

#pragma mark - Overwite Method
- (void)prepareCollectionView {
    [super prepareCollectionView];
    
    [self.collectionView registerClass:[ZFMPlayAlbumInfoCollectionViewCell class] forCellWithReuseIdentifier:[[ZFMPlayAlbumInfoCollectionViewCell class]description]];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZFMPlayAlbumInfoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[[ZFMPlayAlbumInfoCollectionViewCell class]description] forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    return cell;
    
}

@end
