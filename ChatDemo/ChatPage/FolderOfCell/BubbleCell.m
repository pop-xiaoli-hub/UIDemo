//
//  BubbleCell.m
//  ChatDemo
//
//  Created by xiaoli pop on 2025/9/2.
//

#import "BubbleCell.h"

@implementation BubbleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.headerView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.headerView.layer.masksToBounds = YES;
        self.headerView.layer.cornerRadius = 10;
        [self.contentView addSubview:self.headerView];
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.messageLabel.numberOfLines = 0;
        self.messageLabel.font = [UIFont systemFontOfSize:16];
        self.messageLabel.layer.masksToBounds = YES;
        self.messageLabel.layer.cornerRadius = 8;
        [self.contentView addSubview:self.messageLabel];
    }
    return self;
}

- (void)configureWithModel:(Model* )model {
    self.messageLabel.text = [model.text copy];
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    NSLog(@"----%@---", model.text);
    CGSize textSize = [self.messageLabel sizeThatFits:CGSizeMake(screenWidth * 0.6, CGFLOAT_MAX)];
    if (model.isSender) {
        self.headerView.image = [UIImage imageNamed:@"pic2.jpg"];
        self.headerView.frame = CGRectMake(screenWidth - 70, 10, 50, 50);
        CGFloat bubbleWidth = textSize.width + 10;
        CGFloat bubbleX = CGRectGetMinX(self.headerView.frame) - 5 - bubbleWidth;
        self.messageLabel.frame = CGRectMake(bubbleX, 15, bubbleWidth, textSize.height + 10);
        self.messageLabel.backgroundColor = [UIColor colorWithRed:0.7 green:0.9 blue:1 alpha:1];
        self.messageLabel.textAlignment = NSTextAlignmentLeft;
    } else {
        self.headerView.image = [UIImage imageNamed:@"pic2.jpg"];
        self.headerView.frame = CGRectMake(10, 10, 50, 50);
        CGFloat bubbleX = CGRectGetMaxX(self.headerView.frame) + 5;
        self.messageLabel.frame = CGRectMake(bubbleX, 15, textSize.width + 10, textSize.height + 10);
        self.messageLabel.backgroundColor = [UIColor lightGrayColor];
        self.messageLabel.textAlignment = NSTextAlignmentLeft;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
