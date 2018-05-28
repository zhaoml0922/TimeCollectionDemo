//
//  MLCollectionView.m
//  CollectionDemo
//
//  Created by zhaoml on 2017/3/31.
//  Copyright © 2017年 赵明亮. All rights reserved.
//

#import "MLCollectionView.h"
#import "MLScrollCollectionViewCell.h"
@class MLCollectionView;

@interface MLCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (nonatomic,strong)UICollectionView *collectionView;
@property (strong, nonatomic)UICollectionViewFlowLayout *layout;


@end

@implementation MLCollectionView
{
    NSMutableArray *selectArray;
    CGFloat myWidth;
    CGFloat myHeight;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        myWidth = frame.size.width;
        myHeight = frame.size.height;
        self.backgroundColor = [UIColor whiteColor];
        
        [self creatUI];
    }
    return self;
}

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
    selectArray = [NSMutableArray arrayWithCapacity:_dataArray.count];
    for (int i=0; i<_dataArray.count; i++) {
        [selectArray addObject:@"0"];
    }
}

- (void)creatUI {
    
    
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _layout.minimumLineSpacing = 0;
    _layout.minimumInteritemSpacing = 0;
    _layout.itemSize =  CGSizeMake(myWidth/5.0, myHeight);
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, myWidth, 2)];
    view.backgroundColor = [UIColor lightGrayColor];
    view.center = CGPointMake(myWidth/2.0, myHeight/2.0);
    [self addSubview:view];
    
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight) collectionViewLayout:_layout];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.minimumZoomScale = 1;
    [self.collectionView registerClass:[MLScrollCollectionViewCell class] forCellWithReuseIdentifier:@"scrollow"];
    [self addSubview:self.collectionView];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _dataArray.count+4;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MLScrollCollectionViewCell *cell = [MLScrollCollectionViewCell currentCellWithCollection:collectionView andIndexPath:indexPath andSize:CGSizeMake(myWidth/5.0, myHeight)];
    cell.titleLabel.hidden= NO;
    cell.currentLabel.hidden = NO;
    cell.circleView.hidden = NO;
    if ([self ifBlankWithIndex:indexPath.row]) {
        cell.titleLabel.hidden= YES;
        cell.currentLabel.hidden = YES;
        cell.circleView.hidden = YES;
        return cell;
    }
    if (self.dataArray.count!=0) {
        NSString *title = _dataArray[indexPath.row-2];
        BOOL select = [selectArray[indexPath.row-2] isEqualToString:@"0"]?NO:YES;
        [cell configCellWithCurrentTItle:_currentTitle andTitle:title andSelect:select];
    }
    return cell;
};

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self ifBlankWithIndex:indexPath.row]) {
        return;
    }
     [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [self selectWithIndex:indexPath.row-2];
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat x = scrollView.contentOffset.x;
//    CGFloat width = myWidth/5.0;
//    
//    NSLog(@"%lf   %lf",width,x);
//}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGFloat x = scrollView.contentOffset.x;
    CGFloat width = myWidth/5.0;
    
    NSLog(@"%lf   %lf",width,x);

}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    CGFloat x = scrollView.contentOffset.x;
    CGFloat width = myWidth/5.0;
    
    NSLog(@"%lf   %lf",width,x);
}

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    CGFloat x = scrollView.contentOffset.x;
//    CGFloat width = myWidth/5.0;
//    
//    NSLog(@"%lf   %lf",width,x);
//}

- (void)selectWithIndex:(NSInteger)index {
   
    for (int i=0; i<selectArray.count; i++) {
        [selectArray replaceObjectAtIndex:i withObject:@"0"];
        if (i==index) {
            [selectArray replaceObjectAtIndex:i withObject:@"1"];
        }
    }
    [self.collectionView reloadData];
}
- (BOOL)ifBlankWithIndex:(NSInteger )index {
    if (index<=1 || index>_dataArray.count+1) {
        return YES;
    }
    return NO;
}


@end
