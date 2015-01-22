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
    
    [self.view setBackgroundColor:[UIColor colorWithRed:130.0/255.0f green:0.0/255.0f blue:3.0/255.0f alpha:1.0f]];
    
    UIImage *chickenImage = [UIImage imageNamed:chickenImageName];
    self.chickenImage.image = chickenImage;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    self.breed.text = [[[ViewController chickenArray] valueForKey:@"breed"] objectAtIndex:[self.chickenID intValue]];
    self.color.text = [[[ViewController chickenArray] valueForKey:@"color"] objectAtIndex:[self.chickenID intValue]];
    
    [self drawLabels];
    [self.view addSubview:scroll];
}

-(void)drawLabels
{
    int luckyDayCount = [[[[ViewController chickenArray] valueForKey:@"luckyDay"]objectAtIndex:[self.chickenID intValue]]count];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(70, 285, screenWidth-140, 0.5)];
    [lineView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:lineView];
    
    CGRect rect = CGRectMake(0,295,screenWidth,screenHeight - 295);
    scroll = [[UIScrollView alloc] initWithFrame:rect];
    int y = 0;
    int gap = 20;
    int legColorCount = 0;
    for (int i=0; i < luckyDayCount ; i++)
    {
        [self makeLabel:y label:@"Lucky Chicken" value:[[[[[ViewController chickenArray] valueForKey:@"luckyDay"]valueForKey:@"name"]objectAtIndex:[self.chickenID intValue]] objectAtIndex:i]];
        
        y+= gap;
        
        [self makeLabel:y label:@"Feather Color Rating" value:[[[[[ViewController chickenArray] valueForKey:@"luckyDay"]valueForKey:@"featureColorPoints"]objectAtIndex:[self.chickenID intValue]] objectAtIndex:i]];
        
        y+= gap;
        
        legColorCount = [[[[[[ViewController chickenArray] valueForKey:@"luckyDay"]valueForKey:@"legColorRating"]objectAtIndex:[self.chickenID intValue]] objectAtIndex:i]count];
        
        for(int k = 0; k < legColorCount; k++)
        {
            UILabel *legColorLabel = [[UILabel alloc]initWithFrame:CGRectMake(50,y,130,20)];
            [legColorLabel setTextColor:[UIColor whiteColor]];
            [legColorLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15.f]];
            [scroll addSubview:legColorLabel];
            
            NSMutableAttributedString* string = [[NSMutableAttributedString alloc]initWithString:@"Leg Color"];
            [string addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:1] range:NSMakeRange(0, string.length)];//Underline color
            [string addAttribute:NSUnderlineColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, string.length)];//TextColor
            legColorLabel. attributedText = string;
            
            y+= gap ;
            
            NSArray* legColorsArray = [[[[[[[[ViewController chickenArray] valueForKey:@"luckyDay"]objectAtIndex:[self.chickenID intValue]] valueForKey:@"legColorRating"]objectAtIndex:i] valueForKey:[NSString stringWithFormat:@"%d", k]] objectAtIndex:k] componentsSeparatedByString: @":"];
            
            [self makeLabel:y label:[legColorsArray objectAtIndex:0] value:[legColorsArray objectAtIndex:1]];
            
            y+=gap;
        }
        
        y+= gap+5;
        
    }
    
    scroll.contentSize = CGSizeMake(320, y-30);
    scroll.showsHorizontalScrollIndicator = YES;
    scroll.showsVerticalScrollIndicator = YES;
}

-(void)makeLabel:(int)Yposition label:(NSString*)label value:(NSString*)value
{
    UILabel *jsonLabel = [[UILabel alloc]initWithFrame:CGRectMake(50,Yposition,130,20)];
    [jsonLabel setText:label];
    [jsonLabel setTextColor:[UIColor whiteColor]];
    [jsonLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:13.f]];
    [scroll addSubview:jsonLabel];
    
    UILabel *jsonValue = [[UILabel alloc]initWithFrame:CGRectMake(200,Yposition,130,20)];
    [jsonValue setTextColor:[UIColor whiteColor]];
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
