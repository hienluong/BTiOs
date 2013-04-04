//
//  Fish.m
//  DemoFish
//
//  Created by Fighting on 4/3/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "Fish.h"
#import "ViewController.h"

@implementation Fish

-(void)demoFish{
_imageFish =[UIImage imageNamed:@"fish1"];
   
    _fishView=[[UIImageView alloc] initWithImage:_imageFish];
    
    [self swimmingFish];
    
}
-(void) swimmingFish{
    //phuong thuc tao cho ca chuyen dong lien tuc
    float random1 =arc4random()/10000000;
    float random2 =arc4random()/10000000;
        _fishView.frame =CGRectMake(320  ,random1, _imageFish.size.width, _imageFish.size.height);    [UIView animateWithDuration:4 animations:^{
    
    _fishView.frame =CGRectMake(160,random2, _imageFish.size.width, _imageFish.size.height);
        
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:4 animations:^{
    _fishView.frame =CGRectMake(0,random2, _imageFish.size.width, _imageFish.size.height);
        }completion:^(BOOL finished) {
            [self swimmingFish];
        }];
        
    } ];
    
}
@end
