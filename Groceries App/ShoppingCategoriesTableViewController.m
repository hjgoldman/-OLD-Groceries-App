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

    self.shoppingCategories = [NSMutableArray array];
    
    
    ///Adding object into the array from another class
    
    GroceryCategory *category1 = [[GroceryCategory alloc]init];
    category1.title = @"HEB";
    
    GroceryItem *groceryItem1 =[[GroceryItem alloc]init];
    groceryItem1.title =@"Chips";
    
    GroceryItem *groceryItem2 =[[GroceryItem alloc]init];
    groceryItem2.title =@"Beer";
    
    category1.groceryItems = [NSMutableArray array];
    [category1.groceryItems addObject:groceryItem1];
    [category1.groceryItems addObject:groceryItem2];

    GroceryCategory *category2 = [[GroceryCategory alloc]init];
    category2.title =@"Whole Foods";
    
    GroceryItem *wholeFoodsItem1 = [[GroceryItem alloc]init];
    wholeFoodsItem1.title = @"Overpriced stuff";
    
    category2.groceryItems = [NSMutableArray array];
    [category2.groceryItems addObject:wholeFoodsItem1];
    
    [self.shoppingCategories addObject:category1];
    [self.shoppingCategories addObject:category2];
    
}


#pragma mark - Table view data source



-(void) addNewCategoryDidSave:(GroceryCategory *)categoryName{
    [self.shoppingCategories addObject:categoryName];
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
