//
//  GroceryCategory.h
//  Groceries App
//
//  Created by Hayden Goldman on 2/13/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroceryCategory : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic, strong) NSMutableArray *groceryItems;

@end
