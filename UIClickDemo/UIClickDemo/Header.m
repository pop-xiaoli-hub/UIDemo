//
//  Header.m
//  UIClickDemo
//
//  Created by xiaoli pop on 2025/9/16.
//

#import "Header.h"
#import "Masonry.h"
@implementation Header

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.contentView.backgroundColor = [UIColor blueColor];
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    self.titleLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:self.titleLabel];
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button setImage:[[UIImage imageNamed:@"im.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [self.contentView addSubview:self.button];
    self.button.userInteractionEnabled = YES;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.centerY.equalTo(self);
            make.right.equalTo(self);
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@25);
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(self);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
