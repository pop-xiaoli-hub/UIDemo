//
//  Model.m
//  demo2
//
//  Created by xiaoli pop on 2025/8/25.
//

#import "Model.h"

@implementation Model
- (instancetype)init {
    if (self = [super init]) {
        self.array = [[NSMutableArray alloc] init];
        self.isExpand = NO;
    }
    return self;
}
@end
