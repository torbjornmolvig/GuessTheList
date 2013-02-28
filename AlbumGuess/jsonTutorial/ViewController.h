//
//  ViewController.h
//  jsonTutorial
//
//  Created by Torbjörn on 2013-02-22.
//  Copyright (c) 2013 JB-kompetens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumsPhoto.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, NSURLConnectionDataDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) id countryItem;

@end
