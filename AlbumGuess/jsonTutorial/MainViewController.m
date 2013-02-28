//
//  MainViewController.m
//  jsonTutorial
//
//  Created by Torbjörn on 2013-02-27.
//  Copyright (c) 2013 JB-kompetens. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toSwedishList"])
    {
        ViewController *vc = (ViewController *) [segue destinationViewController];
        NSString *selectedCountryHttpString = @"http://itunes.apple.com/se/rss/topalbums/limit=10/json";
        vc.countryItem = selectedCountryHttpString;
    }
    
    if ([[segue identifier] isEqualToString:@"toUsaList"])
    {
        ViewController *vc = (ViewController *) [segue destinationViewController];
        NSString *selectedCountryHttpString = @"http://itunes.apple.com/us/rss/topalbums/limit=10/json";
        vc.countryItem = selectedCountryHttpString;
    }
    
    if ([[segue identifier] isEqualToString:@"toEnglishList"])
    {
        ViewController *vc = (ViewController *) [segue destinationViewController];
        NSString *selectedCountryHttpString = @"http://itunes.apple.com/gb/rss/topalbums/limit=10/json";
        vc.countryItem = selectedCountryHttpString;
    }
}
@end



























