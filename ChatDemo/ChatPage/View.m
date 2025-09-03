//
//  View.m
//  ChatDemo
//
//  Created by xiaoli pop on 2025/9/1.
//

#import "View.h"
#import "Masonry.h"
@implementation View

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor systemGroupedBackgroundColor];
        [self createTopView];
        [self createContainerViewOfTextField];
        [self createSendButton];
        [self createTableView];
    }
    return self;
}

- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboarder)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.tableView addGestureRecognizer:tap];
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.backView.mas_bottom);
            make.bottom.equalTo(self.containerView.mas_top);
            make.left.right.equalTo(self);
    }];
}

- (void)hideKeyboarder {
    [self endEditing:YES];
}

- (void)createContainerViewOfTextField {
    self.containerView = [[UIView alloc] init];
    self.containerView.backgroundColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1];
    [self addSubview:self.containerView];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.equalTo(self).multipliedBy(0.108);
    }];
    [self createTextField];
}

- (void)createSendButton {
    self.sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [self.sendButton setTitleColor:[UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1] forState:UIControlStateNormal];
    self.sendButton.backgroundColor = [UIColor whiteColor];
    self.sendButton.layer.cornerRadius = 5;
    self.sendButton.layer.masksToBounds = YES;
    
    [self.containerView addSubview:self.sendButton];
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.containerView).offset(-17);
            make.top.equalTo(self.containerView).offset(10);
            make.height.mas_equalTo(40);
            make.width.mas_equalTo(60);
    }];
}

- (void)createTextField {
    self.textField = [[UITextField alloc] init];
    [self.containerView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.containerView).offset(20);
            make.top.equalTo(self.containerView).offset(10);
//            make.height.mas_equalTo(40);
//            make.width.mas_equalTo(305);
            make.height.equalTo(self.containerView).multipliedBy(0.421);
            make.width.equalTo(self).multipliedBy(0.724);
    }];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.keyboardType = UIKeyboardTypeDefault;
}

- (void)createTopView {
    self.backView = [[UIView alloc] init];
    self.backView.backgroundColor = [UIColor colorWithRed:79/225.0f green:141/225.0f blue:198/225.0f alpha:1];
    [self addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            //make.height.mas_equalTo(100);
            make.height.equalTo(self).multipliedBy(0.114);
    }];
    [self createNameLabel];
}

- (void)createNameLabel {
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.font = [UIFont systemFontOfSize:22];
    self.nameLabel.font = [UIFont boldSystemFontOfSize:20];
    [self.backView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.backView);
        make.height.equalTo(self.backView).multipliedBy(0.5);
        make.width.equalTo(self.self.backView).multipliedBy(0.75);
    }];
    self.nameLabel.backgroundColor = [UIColor clearColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
