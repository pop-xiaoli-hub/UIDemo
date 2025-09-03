//
//  BubbleCell.h
//  ChatDemo
//
//  Created by xiaoli pop on 2025/9/2.
//

#import <UIKit/UIKit.h>
#import "Model.h"
NS_ASSUME_NONNULL_BEGIN

@interface BubbleCell : UITableViewCell
@property (nonatomic, strong)UIImageView* headerView;
@property (nonatomic, strong)UILabel* messageLabel;
- (void)configureWithModel:(Model* )model;
@end

NS_ASSUME_NONNULL_END
