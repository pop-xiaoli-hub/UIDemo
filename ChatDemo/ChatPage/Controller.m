//
//  Controller.m
//  ChatDemo
//
//  Created by xiaoli pop on 2025/9/1.
//

#import "Controller.h"
#import "View.h"
#import "Masonry.h"
#import "ModelOfRecordedArray.h"
#import "BubbleCell.h"
@interface Controller () <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)View* myView;
@property (nonatomic, strong)ModelOfRecordedArray* recordModel;
@property (nonatomic, assign)BOOL temp;
@end

@implementation Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.temp = YES;
    NSLog(@"%f", [[UIScreen mainScreen] bounds].size.height);
    // Do any additional setup after loading the view.
    self.myView = [[View alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.recordModel = [[ModelOfRecordedArray alloc] init];
    self.recordModel.mutableArray = [NSMutableArray array];
    [self.view addSubview:self.myView];
    self.myView.nameLabel.text = @"小玉";
    self.myView.textField.delegate = self;
    self.myView.tableView.delegate = self;
    self.myView.tableView.dataSource = self;
    [self.myView.sendButton addTarget:self action:@selector(pressSend) forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyborderWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyborderWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [self.myView.tableView registerClass:[BubbleCell class] forCellReuseIdentifier:@"cell01"];
}

- (void)pressSend {
    Model* message = [[Model alloc] init];
    message.text = [self.myView.textField.text copy];
    message.isSender = self.temp;
    [self.recordModel.mutableArray addObject:message];
    [self.myView.tableView reloadData];
    [self scrollToBottom];
    NSLog(@"---%@", self.recordModel.mutableArray[0].text);
    self.myView.textField.text = @"";
    self.temp = !self.temp;
}

- (void)scrollToBottom {
    if (self.recordModel.mutableArray.count == 0) {
        return;;
    }
    NSIndexPath* indexpath = [NSIndexPath indexPathForRow:self.recordModel.mutableArray.count - 1 inSection:0];
    [self.myView.tableView scrollToRowAtIndexPath:indexpath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BubbleCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell01" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell configureWithModel:self.recordModel.mutableArray[indexPath.row]];
    NSLog(@"----%@------", self.recordModel.mutableArray[indexPath.row].text);
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recordModel.mutableArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Model* model = self.recordModel.mutableArray[indexPath.row];
    CGSize textSize = [model.text boundingRectWithSize:CGSizeMake(self.myView.bounds.size.width * 0.6, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{
        NSFontAttributeName : [UIFont systemFontOfSize:16]
    } context:nil].size;
    return  textSize.height + 40;
}


- (void)keyborderWillHide:(NSNotification* )notification {
    NSDictionary* dict = notification.userInfo;
    double duration = [dict[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    [UIView animateWithDuration:duration animations:^{
            [self.myView.containerView mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.left.right.equalTo(self.myView);
                        make.bottom.equalTo(self.myView);
                        make.height.mas_equalTo(95);
            }];
    } completion:^(BOOL finished) {
        [self.myView.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.myView.backView.mas_bottom);
            make.bottom.equalTo(self.myView.containerView.mas_top);
            make.left.right.equalTo(self.myView);
        }];
    }];
}


- (void)keyborderWillShow:(NSNotification* )notification {
    NSDictionary* dict = notification.userInfo;
    double duartion = [dict[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    [UIView animateWithDuration:duartion animations:^{
        [self.myView.containerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.myView);
            make.bottom.equalTo(self.myView).offset(-300);
            make.height.mas_equalTo(95);
            }];
    } completion:^(BOOL finished) {
        [self.myView.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.myView.backView.mas_bottom);
            make.bottom.equalTo(self.myView.containerView.mas_top);
            make.left.right.equalTo(self.myView);
        }];
        [self scrollToBottom];
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.myView endEditing:YES];
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
