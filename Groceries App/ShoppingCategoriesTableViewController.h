//
//  ShoppingCategoriesTableViewController.h
//  Groceries App
//
//  Created by Hayden Goldman on 2/13/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNewShoppingCategoryViewController.h"
#import "CategoryDetailsTableViewController.h"
#import "GroceryCategory.h"
#import "GroceryItem.h"

@interface ShoppingCategoriesTableViewController : UITableViewController<AddNewCategoryDelegate>

@property (nonatomic, strong) NSMutableArray *shoppingCategories;

@end
