//
//  ShoppingCategoriesTableViewController.m
//  Groceries App
//
//  Created by Hayden Goldman on 2/13/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

#import "ShoppingCategoriesTableViewController.h"

@interface ShoppingCategoriesTableViewController ()

@end

@implementation ShoppingCategoriesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadGroceryData];
    
    if (shoppingCategories == nil){
        shoppingCategories = [NSMutableArray array];
    }
    
    //Editing table
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    self.navigationItem.rightBarButtonItem = [self editButtonItem];
}


//For testing
-(IBAction)loadDeBug{
    [self loadGroceryData];
}
//For testing

-(IBAction)saveDeBug{
    [self saveGroceryData];
}



-(void) loadGroceryData{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *groceryData = (NSData *) [userDefaults objectForKey:@"groceryData"];
    NSMutableArray *groceryCategories = (NSMutableArray *) [NSKeyedUnarchiver unarchiveObjectWithData:groceryData];
    shoppingCategories = groceryCategories;
}

-(void) saveGroceryData{
    
    NSData *groceryData = [NSKeyedArchiver archivedDataWithRootObject:shoppingCategories];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:groceryData forKey:@"groceryData"];
    [userDefaults synchronize];
}




-(void) addNewCategoryDidSave:(GroceryCategory *)categoryName{
    [shoppingCategories addObject:categoryName];
    
    //Saves the array into the userDefaults
    [self saveGroceryData];
    
    //reloads the table
    [self.tableView reloadData];
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"ShowCategory"]){
        //showing the grocery items
        
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;

        GroceryCategory *groceryCategory = shoppingCategories[indexPath.row];
        CategoryDetailsTableViewController *categoryDetailsTableViewController = segue.destinationViewController;
        categoryDetailsTableViewController.selectedGroceryCategory = groceryCategory;
        
    } else if ([segue.identifier isEqualToString:@"AddCategory"]){
        
        AddNewShoppingCategoryViewController *addNewShoppingCategoryViewController = segue.destinationViewController;
        addNewShoppingCategoryViewController.delegate = self;
    };
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return shoppingCategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingCategoriesCell" forIndexPath:indexPath];
    GroceryCategory *groceryCatagory = shoppingCategories[indexPath.row];
    cell.textLabel.text = groceryCatagory.title;
    
    return cell;
}

//Editing table
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [shoppingCategories removeObjectAtIndex:indexPath.row];
        
        [self.tableView reloadData];
        [self saveGroceryData];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
   return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    NSObject *moveCells = shoppingCategories[sourceIndexPath.row];
    [shoppingCategories removeObjectAtIndex:sourceIndexPath.row];
    [shoppingCategories insertObject:moveCells atIndex:destinationIndexPath.row];
    
    [self.tableView reloadData];

    [self saveGroceryData];
}


@end
