//
//  ViewController.m
//  jsonTutorial
//
//  Created by Torbjörn on 2013-02-22.
//  Copyright (c) 2013 JB-kompetens. All rights reserved.
//

#import "ViewController.h"
#import "AlbumsPhoto.h"

@interface ViewController ()
{
    NSMutableData *webData;
    NSURLConnection *connection;
    NSMutableArray *array;
    NSMutableArray *photosArray;
    NSArray *arrayOfImImage;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if (!photosArray)
    {
        photosArray = [[NSMutableArray alloc] init];
    }
    
    if (!arrayOfImImage)
    {
        arrayOfImImage = [[NSMutableArray alloc] init];
    }
    
    [[self myTableView] setDelegate:self];
    [[self myTableView] setDataSource:self];
    array = [[NSMutableArray alloc] init];
    
    [array removeAllObjects];
    
    NSURL *url = [NSURL URLWithString:self.countryItem];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    if (connection)
    {
        webData = [[NSMutableData alloc] init];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Fail with error (fel med connection).");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *allDataDictionary = [NSJSONSerialization JSONObjectWithData:webData options:0 error:nil];
    NSDictionary *feed = [allDataDictionary objectForKey:@"feed"];
    NSArray *arrayOffEntry = [feed objectForKey:@"entry"];
    
    for (NSDictionary *diction in arrayOffEntry)
    {
        NSDictionary *title = [diction objectForKey:@"title"];
        NSString *label = [title objectForKey:@"label"];
        
        [array addObject:label];
        
        // Photos
        arrayOfImImage = [diction objectForKey:@"im:image"];
        NSDictionary *label2 = [arrayOfImImage[0] objectForKey:@"label"];
        
        [photosArray addObject:label2];
    }
    [[self myTableView] reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    
    // Photos
    AlbumsPhoto *photo = photosArray[indexPath.row];
    NSString *photoString = (NSString *) photo;
    [cell.imageView setImageWithURL:[NSURL URLWithString:photoString]];
    
    return cell;
}
@end

























