//
//  AlbumsPhoto.h
//  jsonTutorial
//
//  Created by Torbjörn on 2013-02-27.
//  Copyright (c) 2013 JB-kompetens. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumsPhoto : NSObject

// Dictionary med bildinformation
@property (nonatomic, strong) NSDictionary *images;
// Filter name
@property (nonatomic, strong) NSString *filterName;

@end
