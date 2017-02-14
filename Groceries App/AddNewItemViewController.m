//
//  AddNewItemViewController.m
//  Groceries App
//
//  Created by Hayden Goldman on 2/13/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

#import "AddNewItemViewController.h"

@interface AddNewItemViewController ()

@end

@implementation AddNewItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.addNewItemTextField.delegate = self;
}

-(IBAction)close{
    [self dismissViewControllerAnimated:YES completion:nil]; //closed the screen
}

-(IBAction)addNewItemButtonPressed{

    GroceryItem *groceryItem = [[GroceryItem alloc]init];
    groceryItem.title = self.addNewItemTextField.text;
    
    [self.delegate addNewItemDidSave:groceryItem];
    
    
    [self dismissViewControllerAnimated:YES completion:nil]; //closed the screen
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    return [textField resignFirstResponder];
}


@end
