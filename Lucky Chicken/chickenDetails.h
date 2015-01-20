//
//  chickenDetails.h
//  Lucky Chicken
//
//  Created by Zohair Hemani on 19/01/2015.
//  Copyright (c) 2015 Avialdo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface chickenDetails : UIViewController
    @property (weak,nonatomic) NSString *chickenID;
@property (weak, nonatomic) IBOutlet UILabel *breed;
@property (weak, nonatomic) IBOutlet UILabel *color;
@property (weak, nonatomic) IBOutlet UIImageView *chickenImage;

@end
