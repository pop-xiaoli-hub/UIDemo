//
//  Model.h
//  UIClickDemo
//
//  Created by xiaoli pop on 2025/9/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject
@property (nonatomic, copy)NSString* name;
@property (nonatomic, strong)NSArray<NSString* >* items;
@property (nonatomic, assign)BOOL collapsed;
- (instancetype)initWithName:(NSString* )name withItems:(NSArray<NSString* >* )items andCollapsed:(BOOL)collapased;
@end

NS_ASSUME_NONNULL_END
