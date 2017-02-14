//
//  CategoryDetailsTableViewController.h
//  Groceries App
//
//  Created by Hayden Goldman on 2/13/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingCategoriesTableViewController.h"
#import "AddNewItemViewController.h"

@interface CategoryDetailsTableViewController : UITableViewController<AddNewItemDelegate>

@property (nonatomic,strong) GroceryCategory *selectedGroceryCategory;

@end
