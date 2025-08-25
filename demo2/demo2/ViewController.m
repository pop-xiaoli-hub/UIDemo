#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()
@property (nonatomic, strong)UITableView* tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    UIView* view = [[UIView alloc] init];
    //    view.backgroundColor = [UIColor redColor];
    //    [self.view addSubview:view];
    //    [view mas_makeConstraints:^(MASConstraintMaker *make) {
    //            make.center.equalTo(self.view);
    //            make.width.height.mas_equalTo(100);
    //    }];
    //    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //    [button setTitle:@"按钮" forState:UIControlStateNormal];
    //    [button setTitle:@"按下" forState:UIControlStateHighlighted];
    //    [self.view addSubview:button];
    //    [button mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.mas_equalTo(self.view.mas_top).offset(100);
    //        make.left.mas_equalTo(self.view).offset(200);
    //            make.height.width.mas_equalTo(50);
    //    }];
    //
}


@end
