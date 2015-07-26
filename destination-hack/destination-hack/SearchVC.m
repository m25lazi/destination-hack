//
//  SearchVC.m
//  destination-hack
//
//  Created by Jubin Benny on 26/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "SearchVC.h"

@interface SearchVC ()
@property (weak, nonatomic) IBOutlet UISearchBar *search;
@property (weak, nonatomic) IBOutlet UITableView *listView;
@property (nonatomic, assign) NSInteger numberOfTableViewContents;

@end

@implementation SearchVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.listView setDataSource:self];
    [self.listView setDelegate:self];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - TableView DataSOurce
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _numberOfTableViewContents;
}

#pragma mark - TableView Delegates
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
