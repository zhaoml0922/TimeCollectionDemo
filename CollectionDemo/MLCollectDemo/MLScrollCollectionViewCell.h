//
//  MLScrollCollectionViewCell.h
//  CollectionDemo
//
//  Created by zhaoml on 2017/3/31.
//  Copyright © 2017年 赵明亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLScrollCollectionViewCell : UICollectionViewCell


+ (instancetype)currentCellWithCollection:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath andSize:(CGSize)size;

@property (nonatomic,strong)UIView *circleView;

@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,strong)UILabel *currentLabel;

- (void)configCellWithCurrentTItle:(NSString *)current andTitle:(NSString *)title andSelect:(BOOL)select;

@end
