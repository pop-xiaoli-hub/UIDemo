//
//  Model.h
//  ChatDemo
//
//  Created by xiaoli pop on 2025/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject
@property (nonatomic, copy)NSString* text;
@property (nonatomic, assign)BOOL isSender;
//@property (nonatomic, copy)NSString* name;
@end

NS_ASSUME_NONNULL_END
