//
//  Model.m
//  UIClickDemo
//
//  Created by xiaoli pop on 2025/9/16.
//

#import "Model.h"

@implementation Model
- (instancetype)initWithName:(NSString* )name withItems:(NSArray<NSString* >* )items andCollapsed:(BOOL)collapased {
    if (self = [super init]) {
        self.name = name;
        self.items = items;
        self.collapsed = collapased;
    }
    return self;
}
@end
