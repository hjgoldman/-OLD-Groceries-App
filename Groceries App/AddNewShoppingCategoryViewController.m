//
//  AddNewShoppingCategoryViewController.m
//  Groceries App
//
//  Created by Hayden Goldman on 2/13/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

#import "AddNewShoppingCategoryViewController.h"

@interface AddNewShoppingCategoryViewController ()

@end

@implementation AddNewShoppingCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.addNewTextField.delegate = self;

}

-(IBAction)close {
    [self dismissViewControllerAnimated:YES completion:nil]; //closed the screen
    
}

-(IBAction)addNewCategoryButtonPressed{
    GroceryCategory *groceryCategory = [[GroceryCategory alloc] init];
    groceryCategory.title = self.addNewTextField.text;
    
    groceryCategory.groceryItems = [NSMutableArray array];
    
    [self.delegate addNewCategoryDidSave:groceryCategory];
    
    [self dismissViewControllerAnimated:YES completion:nil]; //closed the screen
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    return [textField resignFirstResponder];
}



@end
