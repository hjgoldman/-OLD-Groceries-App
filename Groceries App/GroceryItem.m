//
//  GroceryItem.m
//  Groceries App
//
//  Created by Hayden Goldman on 2/13/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

#import "GroceryItem.h"

@implementation GroceryItem

-(void) encodeWithCoder:(NSCoder *)encoder{
    
    [encoder encodeObject:self.title forKey:@"title"];
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super init];
    self.title = [coder decodeObjectForKey:@"title"];
    return self;

}


@end
