//
//  Fish.h
//  DemoFish
//
//  Created by Fighting on 4/3/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fish : NSObject
{
}
@property (nonatomic,strong) UIImage *imageFish;
@property (nonatomic,strong) UIImageView *fishView;

-(void) demoFish;
-(void) swimmingFish;
@end
