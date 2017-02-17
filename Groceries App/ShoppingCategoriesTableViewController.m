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
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *groceryData = (NSData *) [userDefaults objectForKey:@"groceryData"];
    NSMutableArray *groceryCategories = (NSMutableArray *) [NSKeyedUnarchiver unarchiveObjectWithData:groceryData];
    self.shoppingCategories = groceryCategories;
    
    if (groceryCategories == nil){
        self.shoppingCategories = [NSMutableArray array];
    }
}

-(IBAction)loadDeBug{
    [self loadGroceryData];
}

-(void) loadGroceryData{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *groceryData = (NSData *) [userDefaults objectForKey:@"groceryData"];
    NSMutableArray *groceryCategories = (NSMutableArray *) [NSKeyedUnarchiver unarchiveObjectWithData:groceryData];
    self.shoppingCategories = groceryCategories;
}

-(void) saveGroceryData{
    NSData *groceryData = [NSKeyedArchiver archivedDataWithRootObject:self.shoppingCategories];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:groceryData forKey:@"groceryData"];
    [userDefaults synchronize];
}


-(void) addNewCategoryDidSave:(GroceryCategory *)categoryName{
    [self.shoppingCategories addObject:categoryName];
    
    //Saves the array into the userDefaults
    [self saveGroceryData];
    
    //reloads the table
    [self.tableView reloadData];
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"ShowCategory"]){
        //showing the grocery items
        
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;

        GroceryCategory *groceryCategory = self.shoppingCategories[indexPath.row];
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
    return self.shoppingCategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingCategoriesCell" forIndexPath:indexPath];
    GroceryCategory *groceryCatagory = self.shoppingCategories[indexPath.row];
    cell.textLabel.text = groceryCatagory.title;
    
    return cell;
}


@end
