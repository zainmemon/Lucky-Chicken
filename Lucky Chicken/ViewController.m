//
//  ViewController.m
//  Lucky Chicken
//
//  Created by Zohair Hemani on 19/01/2015.
//  Copyright (c) 2015 Avialdo. All rights reserved.
//

#import "ViewController.h"
#import "chickenDetails.h"


@interface ViewController (){
    UIScrollView *scroll;
    NSString *chicken_id;
    UIButton *button;
    NSString *tag;
    int screenWidth;
    int screenHeight;
}

@end

@implementation ViewController

static NSMutableArray *chickensArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"chickens" ofType:@"json"];
    NSString *myJSON = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    if (!myJSON) {
        NSLog(@"File couldn't be read!");
        return;
    }

    chickensArray  = [NSJSONSerialization JSONObjectWithData:[myJSON dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    
    for (NSDictionary *status in chickensArray)
    {
        NSLog(@"%@ ", [status objectForKey:@"breed"]);
    }
    
    
    [self generate_views];
    [self.view addSubview:scroll];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)generate_views
{
    
    CGRect rect = CGRectMake(0,20,320,screenHeight-50);
    scroll = [[UIScrollView alloc] initWithFrame:rect];
    
    //loop for open
    int x=40;
    int y=0;
    
    
    for(int i=0;i<[chickensArray count];i++)
    {
        if((i>0) && (i%2==0))
        {
            y+=125;
            x=40;
        }
        else
        {
            if(i!=0)
            {
                x+=140;
            }
        }
        
        NSString * chickenImageName = [[chickensArray valueForKey:@"picture"] objectAtIndex:i];
        chicken_id = [[chickensArray valueForKey:@"sno"] objectAtIndex:i];
        int value = [chicken_id intValue];
        
        NSLog(@" Chicken ID: %@",chicken_id);
        
        UIImage *chickenImage = [UIImage imageNamed:chickenImageName];
        NSLog(@" Chicken Image URL: %@",chickenImageName);
        
        button = [[UIButton alloc]init];
        [button addTarget:self action:@selector(tapDetected:) forControlEvents:UIControlEventTouchUpInside];
        
        [button setBackgroundImage:chickenImage forState:UIControlStateNormal];
        button.frame = CGRectMake(x,y,100,100);
        button.tag = value;
        [scroll addSubview:button];
        
        UILabel *chikenBreedLabel = [[UILabel alloc]initWithFrame:CGRectMake(x, y+105, 100, 13)];
        NSString *chickenBreedString = [[chickensArray valueForKey:@"breed"] objectAtIndex:i];
        chikenBreedLabel.text = chickenBreedString;
        chikenBreedLabel.textAlignment = NSTextAlignmentCenter;
        chikenBreedLabel.textColor= [UIColor blackColor];
        [chikenBreedLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:11.f]];
        [scroll addSubview:chikenBreedLabel];
    }
    
    scroll.contentSize = CGSizeMake(320, y+120);
    scroll.showsHorizontalScrollIndicator = YES;
    scroll.showsVerticalScrollIndicator = YES;
}

-(void)tapDetected:(id)sender{
    
    button = (UIButton*) sender;
    
    tag = [NSString stringWithFormat: @"%d", (int)button.tag];;
    NSLog(@"tag: %@",tag);
    
    //vendor_id = [[VendorsNearMe valueForKey:@"vendor_id"] objectAtIndex:button.tag];
    [self performSegueWithIdentifier:@"chickenDetails" sender:self];
    
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    if ([segue.identifier isEqualToString:@"chickenDetails"]) {
        chickenDetails *c = (chickenDetails*)segue.destinationViewController;
        c.title = [[chickensArray valueForKey:@"breed"] objectAtIndex:[tag intValue]];
        c.chickenID = tag;
    }
}

+(NSMutableArray*)chickenArray
{
    if(chickensArray == NULL)
    {
        chickensArray = [[NSMutableArray alloc] init];
    }
    return chickensArray;
}

@end
