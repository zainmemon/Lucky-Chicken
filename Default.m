//
//  Default.m
//  Lucky Chicken
//
//  Created by Avialdo on 26/01/2015.
//  Copyright (c) 2015 Avialdo. All rights reserved.
//


#import "Default.h"

@interface Default (){
    int screenWidth;
    int screenHeight;
    UIImageView *dataImage;
}

@end

@implementation Default

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
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    [self.view setBackgroundColor:[UIColor colorWithRed:130.0/255.0f green:0.0/255.0f blue:3.0/255.0f alpha:1.0f]];
    
    dataImage = [[UIImageView alloc]initWithFrame:CGRectMake(10,150,300,screenHeight-250)];
    dataImage.image = [UIImage imageNamed:@"data"];
    
    [self.view addSubview:dataImage];
    
}

@end