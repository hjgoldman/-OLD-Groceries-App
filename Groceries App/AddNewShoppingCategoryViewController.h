//
//  AddNewShoppingCategoryViewController.h
//  Groceries App
//
//  Created by Hayden Goldman on 2/13/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroceryCategory.h"
@protocol AddNewCategoryDelegate <NSObject>

-(void) addNewCategoryDidSave:(GroceryCategory *)categoryName;

@end

@interface AddNewShoppingCategoryViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic,weak) IBOutlet UITextField *addNewTextField;

@property (nonatomic,weak) id<AddNewCategoryDelegate> delegate;

@end
