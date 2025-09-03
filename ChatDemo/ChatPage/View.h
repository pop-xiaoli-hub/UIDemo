//
//  View.h
//  ChatDemo
//
//  Created by xiaoli pop on 2025/9/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface View : UIView
@property (nonatomic, strong)UILabel* nameLabel;
@property (nonatomic, strong)UIView* backView;
@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, strong)UIButton* backButton;
@property (nonatomic, strong)UIView* containerView;
@property (nonatomic, strong)UIButton* sendButton;
@property (nonatomic, strong)UITextField* textField;
@end

NS_ASSUME_NONNULL_END
