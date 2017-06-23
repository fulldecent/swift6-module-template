//
//  __PROJECT_NAME__Label.m
//  __PROJECT_NAME__
//
//  Created by Dmytro Zozulia on 23.06.17.
//  Copyright © 2017 __ORGANIZATION NAME__. All rights reserved.
//

#import "__PROJECT_NAME__Label.h"

@implementation __PROJECT_NAME__Label

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.text = @"__PROJECT_NAME__ loaded";
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

@end
