//
//  MyViewController.m
//  UIClickDemo
//
//  Created by xiaoli pop on 2025/9/17.
//

#import "MyViewController.h"
#import "Header.h"
#import "Model.h"
@interface MyViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, strong)NSMutableArray* models;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpMyData];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[Header class] forHeaderFooterViewReuseIdentifier:@"header"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.models.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    Model* sectionData = self.models[section];
    if (sectionData.collapsed) {
        return 0;
    } else {
        return sectionData.items.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Model* sectionData = self.models[indexPath.section];
    cell.textLabel.text = sectionData.items[indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    Header* header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    if (!header) {
        header = [[Header alloc] initWithReuseIdentifier:@"header"];
    }
    Model* sectionData = self.models[section];
    header.titleLabel.text = sectionData.name;
    header.button.tag = section + 101;
    [header.button addTarget:self action:@selector(reverseCollapase:) forControlEvents:UIControlEventTouchUpInside];
    [self rotateButton:header.button withCollapased:sectionData.collapsed];
    return header;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSInteger section = indexPath.section;
//    Model* sectionData = self.models[section];
//    sectionData.collapsed = !sectionData.collapsed;
//}

- (void)reverseCollapase:(UIButton* )button {
    NSInteger section = button.tag - 101;
    Model* sectionData = self.models[section];
    sectionData.collapsed = !sectionData.collapsed;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)rotateButton:(UIButton* )button withCollapased:(BOOL)collapased {
    CGFloat angle = collapased ? 0.0 : M_PI_2;
    button.transform = CGAffineTransformMakeRotation(angle);
}

- (void)setUpMyData {
    self.models = [NSMutableArray array];
    [self.models addObject:[[Model alloc] initWithName:@"iOS" withItems:@[@"xiaoli", @"xiaoliu", @"xiaoding", @"xiaofu", @"xiaoyang", @"xiaowu"] andCollapsed:NO]];
    [self.models addObject:[[Model alloc] initWithName:@"android" withItems:@[@"xiaoji", @"xiaoyang", @"xiaohong", @"xiaobai", @"xiaoyang", @"xiaowu"] andCollapsed:NO]];
    [self.models addObject:[[Model alloc] initWithName:@"server" withItems:@[@"xiaohei", @"xiaohuang", @"xiaodang", @"xiaofu", @"xiaoyang", @"xiaowu"] andCollapsed:NO]];
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
