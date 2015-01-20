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
    
    [self drawLabels];
    [self.view addSubview:scroll];
}

-(void)drawLabels
{
    CGRect rect = CGRectMake(0,80,320,1080);
    scroll = [[UIScrollView alloc] initWithFrame:rect];
    int y = 200;
    
    int luckyDayCount = [[[[ViewController chickenArray] valueForKey:@"luckyDay"]objectAtIndex:[self.chickenID intValue]]count];
    
    NSLog(@"the luckyDay count is %d",luckyDayCount);
    
    for (int i=0; i < luckyDayCount ; i++)
    {
        [self makeLabel:y label:[[[[[ViewController chickenArray] valueForKey:@"luckyDay"]valueForKey:@"name"]objectAtIndex:i] objectAtIndex:[self.chickenID intValue]] value:@"value"];
        
//        UILabel *first_label = [[UILabel alloc]initWithFrame:CGRectMake(20,y,100,40)];
//        [first_label setText:@"first Text"];
//        [first_label setTextColor:[UIColor blackColor]];
//        [scroll addSubview:first_label];
//            
//        UILabel *first_value = [[UILabel alloc]initWithFrame:CGRectMake(100,y,100,40)];
//        [first_value setTextColor:[UIColor blackColor]];
//        [first_value setText:@"First Label"];
//        [scroll addSubview:first_value];
        
//        UILabel *second_label = [[UILabel alloc]initWithFrame:CGRectMake(20,y,100,40)];
//        [first_label setText:@"first Text"];
//        [first_label setTextColor:[UIColor blackColor]];
//        [scroll addSubview:first_label];
//        
//        UILabel *second_value = [[UILabel alloc]initWithFrame:CGRectMake(100,y,100,40)];
//        [first_value setTextColor:[UIColor blackColor]];
//        [first_value setText:@"First Label"];
//        [scroll addSubview:first_value];
//        
//        UILabel *third_label = [[UILabel alloc]initWithFrame:CGRectMake(20,y,100,40)];
//        [first_label setText:@"first Text"];
//        [first_label setTextColor:[UIColor blackColor]];
//        [scroll addSubview:first_label];
//        
//        UILabel *third_value = [[UILabel alloc]initWithFrame:CGRectMake(100,y,100,40)];
//        [first_value setTextColor:[UIColor blackColor]];
//        [first_value setText:@"First Label"];
//        [scroll addSubview:first_value];
//        
//        UILabel *fourth_label = [[UILabel alloc]initWithFrame:CGRectMake(20,y,100,40)];
//        [first_label setText:@"first Text"];
//        [first_label setTextColor:[UIColor blackColor]];
//        [scroll addSubview:first_label];
//        
//        UILabel *fourth_value = [[UILabel alloc]initWithFrame:CGRectMake(100,y,100,40)];
//        [first_value setTextColor:[UIColor blackColor]];
//        [first_value setText:@"First Label"];
//        [scroll addSubview:first_value];
        
        y+=50;
        
    }
    
    scroll.contentSize = CGSizeMake(320, y+200);
    scroll.showsHorizontalScrollIndicator = YES;
    scroll.showsVerticalScrollIndicator = YES;
}


-(void)makeLabel:(int)Yposition label:(NSString*)label value:(NSString*)value
{
    UILabel *fourth_label = [[UILabel alloc]initWithFrame:CGRectMake(20,Yposition,100,40)];
    [fourth_label setText:label];
    [fourth_label setTextColor:[UIColor blackColor]];
    [scroll addSubview:fourth_label];
    
    UILabel *fourth_value = [[UILabel alloc]initWithFrame:CGRectMake(150,Yposition,100,40)];
    [fourth_value setTextColor:[UIColor blackColor]];
    [fourth_value setText:value];
    [scroll addSubview:fourth_value];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
