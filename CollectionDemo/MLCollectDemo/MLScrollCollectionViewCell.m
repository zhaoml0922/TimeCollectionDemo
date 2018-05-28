//
//  MLScrollCollectionViewCell.m
//  CollectionDemo
//
//  Created by zhaoml on 2017/3/31.
//  Copyright © 2017年 赵明亮. All rights reserved.
//

#import "MLScrollCollectionViewCell.h"

@implementation MLScrollCollectionViewCell


- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.currentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height/2.0-11.5)];
        self.currentLabel.text = @"当前位置";
        self.currentLabel.backgroundColor = [UIColor orangeColor];
        self.currentLabel.textColor = [UIColor whiteColor];
        self.currentLabel.textAlignment = NSTextAlignmentCenter;
        self.currentLabel.font = [UIFont systemFontOfSize:12];
        self.currentLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.currentLabel];
        
        self.circleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 15)];
        self.circleView.layer.cornerRadius = 7.5;
        self.circleView.layer.masksToBounds = YES;
        [self addSubview:self.circleView];
        
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height/2+11.5, frame.size.width, frame.size.height/2.0-11.5)];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];

        
        self.circleView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        
    }
    return self;
}

- (void)configCellWithCurrentTItle:(NSString *)current andTitle:(NSString *)title andSelect:(BOOL)select{
    self.titleLabel.text = title;
    if ([current isEqualToString:title]) {
        self.currentLabel.hidden = NO;
        self.circleView.backgroundColor = [UIColor orangeColor];
        self.titleLabel.textColor = [UIColor orangeColor];
    }else{
        self.currentLabel.hidden = YES;
        if (select) {
            self.circleView.backgroundColor = [UIColor redColor];
            self.titleLabel.textColor = [UIColor redColor];
        }else{
            self.circleView.backgroundColor = [UIColor blueColor];
             self.titleLabel.textColor = [UIColor blackColor];
        }
    }
}


+ (instancetype)currentCellWithCollection:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath andSize:(CGSize)size{
    MLScrollCollectionViewCell *cell = (MLScrollCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"scrollow" forIndexPath:indexPath];
    if(!cell){
        cell = [[MLScrollCollectionViewCell alloc] init];
    }
    return cell;
}



@end
