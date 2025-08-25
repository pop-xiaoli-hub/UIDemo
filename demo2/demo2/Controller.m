//
//  Controller.m
//  demo2
//
//  Created by xiaoli pop on 2025/8/25.
//

#import "Controller.h"
#import "Masonry.h"
#import "View.h"
#import "Model.h"
@interface Controller ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)View* landView;
@property(nonatomic, strong)Model* landModel;
@end

@implementation Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.landModel = [[Model alloc] init];
    self.landModel.array = [NSMutableArray arrayWithObjects:@"我", @"是", @"小", @"李", nil];
    self.landView = [[View alloc] initWithFrame:self.view.bounds];
    self.landView.tableView.delegate = self;
    self.landView.tableView.dataSource = self;
    [self.view addSubview:self.landView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.landModel.array.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [self.landView.tableView dequeueReusableCellWithIdentifier:@"cell01"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell01"];
    }
    cell.textLabel.text = self.landModel.array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* str = self.landModel.array[indexPath.row];
    [self.landModel.array removeObjectAtIndex:indexPath.row];
    [self.landModel.array insertObject:str atIndex:0];
    [self.landView.tableView reloadData];
    [self pressButton];
}

- (void)pressButton{
    self.landModel.isExpand = !self.landModel.isExpand;
    if (self.landModel.isExpand) {
        [self.landView.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(400);
        }];
    } else {
        [self.landView.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(100);
        }];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
