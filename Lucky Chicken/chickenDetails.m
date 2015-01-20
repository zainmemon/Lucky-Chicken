//
//  chickenDetails.m
//  Lucky Chicken
//
//  Created by Zohair Hemani on 19/01/2015.
//  Copyright (c) 2015 Avialdo. All rights reserved.
//

#import "chickenDetails.h"
#import "ViewController.h"

@interface chickenDetails (){
    UIScrollView *scroll;
    int screenWidth;
    int screenHeight;
}

@end

@implementation chickenDetails

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
    NSString *chickenImageName = [[[ViewController chickenArray] valueForKey:@"picture"] objectAtIndex:[self.chickenID intValue]];
    
    UIImage *chickenImage = [UIImage imageNamed:chickenImageName];
    self.chickenImage.image = chickenImage;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    NSLog(@"The screen width is %d",screenWidth);
    NSLog(@"The screen Height is %d",screenHeight);
    [self drawLabels];
    [self.view addSubview:scroll];
}

-(void)drawLabels
{
    int luckyDayCount = [[[[ViewController chickenArray] valueForKey:@"luckyDay"]objectAtIndex:[self.chickenID intValue]]count];
    
    CGRect rect = CGRectMake(0,270,320,screenHeight - 270);
    scroll = [[UIScrollView alloc] initWithFrame:rect];
    int y = 0;
    int gap = 25;
    int legColorCount = 0;
    for (int i=0; i < luckyDayCount ; i++)
    {
        [self makeLabel:y label:@"Name" value:[[[[[ViewController chickenArray] valueForKey:@"luckyDay"]valueForKey:@"name"]objectAtIndex:[self.chickenID intValue]] objectAtIndex:i]];
        
        y+= gap;
        
        [self makeLabel:y label:@"Feather Color Rating" value:[[[[[ViewController chickenArray] valueForKey:@"luckyDay"]valueForKey:@"featureColorPoints"]objectAtIndex:[self.chickenID intValue]] objectAtIndex:i]];
        
        y+= gap;
        
        legColorCount = [[[[[[ViewController chickenArray] valueForKey:@"luckyDay"]valueForKey:@"legColorRating"]objectAtIndex:[self.chickenID intValue]] objectAtIndex:i]count];
        
        NSLog(@"The leg color count is %d",legColorCount);
        
        for(int k = 0; k < legColorCount; k++)
        {
            NSArray* legColorsArray = [[[[[[[[ViewController chickenArray] valueForKey:@"luckyDay"]objectAtIndex:[self.chickenID intValue]] valueForKey:@"legColorRating"]objectAtIndex:i] valueForKey:[NSString stringWithFormat:@"%d", k]] objectAtIndex:k] componentsSeparatedByString: @":"];
            [self makeLabel:y label:[legColorsArray objectAtIndex:0] value:[legColorsArray objectAtIndex:1]];
            
            y+=gap;
        }
        
        y+= gap+10;
        
    }
    
    scroll.contentSize = CGSizeMake(320, y-30);
    scroll.showsHorizontalScrollIndicator = YES;
    scroll.showsVerticalScrollIndicator = YES;
}

-(void)makeLabel:(int)Yposition label:(NSString*)label value:(NSString*)value
{
    UILabel *jsonLabel = [[UILabel alloc]initWithFrame:CGRectMake(20,Yposition,130,20)];
    [jsonLabel setText:label];
    [jsonLabel setTextColor:[UIColor blackColor]];
    [jsonLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:13.f]];
    [scroll addSubview:jsonLabel];
    
    UILabel *jsonValue = [[UILabel alloc]initWithFrame:CGRectMake(170,Yposition,130,20)];
    [jsonValue setTextColor:[UIColor blackColor]];
    [jsonValue setText:value];
    [jsonValue setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:13.f]];
    [scroll addSubview:jsonValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
