//
//  CategoryDetailsTableViewController.m
//  Groceries App
//
//  Created by Hayden Goldman on 2/13/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

#import "CategoryDetailsTableViewController.h"

@interface CategoryDetailsTableViewController ()

@end

@implementation CategoryDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.selectedGroceryCategory.title;
}


-(void) addNewItemDidSave:(GroceryItem *)groceryItem{
    [self.selectedGroceryCategory.groceryItems addObject:groceryItem];
    [self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.selectedGroceryCategory.groceryItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryItemsCell" forIndexPath:indexPath];
    
    GroceryItem *groceryItem = self.selectedGroceryCategory.groceryItems[indexPath.row];
    cell.textLabel.text = groceryItem.title;
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    AddNewItemViewController *addNewItemViewController = segue.destinationViewController;
    addNewItemViewController.delegate = self;
    
}
@end
