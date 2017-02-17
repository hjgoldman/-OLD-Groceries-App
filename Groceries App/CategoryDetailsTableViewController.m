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
    
    //Editing table
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    self.navigationItem.rightBarButtonItem = [self editButtonItem];
    
}


-(void) addNewItemDidSave:(GroceryItem *)groceryItem{
    [self.selectedGroceryCategory.groceryItems addObject:groceryItem];
    
    //reloads the table
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

//Editing table
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.selectedGroceryCategory.groceryItems removeObjectAtIndex:indexPath.row];
        
        [self.tableView reloadData];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    NSObject *moveCells = self.selectedGroceryCategory.groceryItems[sourceIndexPath.row];
    [self.selectedGroceryCategory.groceryItems removeObjectAtIndex:sourceIndexPath.row];
    [self.selectedGroceryCategory.groceryItems insertObject:moveCells atIndex:destinationIndexPath.row];
    
    [self.tableView reloadData];
    
}

@end
