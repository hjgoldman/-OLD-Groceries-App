//
//  AddNewItemViewController.h
//  Groceries App
//
//  Created by Hayden Goldman on 2/13/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroceryItem.h"
@protocol AddNewItemDelegate <NSObject>

-(void) addNewItemDidSave:(GroceryItem *)groceryItem;

@end

@interface AddNewItemViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic,weak) IBOutlet UITextField *addNewItemTextField;

@property (nonatomic,weak) id<AddNewItemDelegate> delegate;

@end
