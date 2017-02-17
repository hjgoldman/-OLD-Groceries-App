//
//  GroceryCategory.m
//  Groceries App
//
//  Created by Hayden Goldman on 2/13/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

#import "GroceryCategory.h"

@implementation GroceryCategory

-(void) encodeWithCoder:(NSCoder *)encoder{
    
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.groceryItems forKey:@"groceryItems"];
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super init];
    self.title = [coder decodeObjectForKey:@"title"];
    self.groceryItems = [coder decodeObjectForKey:@"groceryItems"];
    return self;
}



@end
