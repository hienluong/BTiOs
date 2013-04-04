//
//  ViewController.m
//  DemoFish
//
//  Created by iOS11 on 3/31/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "ViewController.h"
#import "Fish.h"
#import "Hook.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
{
    CGSize imageSize;
    CGPoint tapPoint;
    Fish *fish;
    Hook *hook;
    float xThumbImage;
    float yThumbImage;
    
}
@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (nonatomic,strong) UITapGestureRecognizer *tapGesture;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // imageSize la bien luu giu size cua hook
    imageSize=CGSizeMake(10, 30);
    ///
    xThumbImage=self.slider.frame.size.width*self.slider.value-5;
    yThumbImage=self.slider.frame.size.height+5;
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    [self.view addGestureRecognizer: self.tapGesture];
    
    
    fish =[[Fish alloc]init];
    [fish demoFish];
    [self.view addSubview:fish.fishView];
    
    hook =[[Hook alloc]init];
    [hook demoHook];
    hook.hookView.frame =CGRectMake(xThumbImage, yThumbImage, imageSize.width, imageSize.height);
    [self.view addSubview:hook.hookView];
    
    [self.slider setMinimumTrackImage: [UIImage alloc] forState: UIControlStateNormal];
    [self.slider setMaximumTrackImage: [UIImage alloc] forState: UIControlStateNormal];
    [self.slider setThumbImage:[UIImage imageNamed:@"smile"] forState: UIControlStateNormal];
    

}
- (IBAction)handleTap{
  
    tapPoint =[self.tapGesture locationInView:self.view];
    imageSize =CGSizeMake(hook.imageHook.size.width, tapPoint.y);
    [UIView animateWithDuration:0.5 animations:^{
        hook.hookView.frame=CGRectMake(xThumbImage, yThumbImage, imageSize.width, imageSize.height);
    }completion:^(BOOL finished) {
        [self fishing];
    }];
      
    
    }
-(void) fishing{
    //xu ly su kien cau duoc ca
    
    //vi tri hien tai cua con ca
    CGRect currentPostion= [[fish.fishView.layer presentationLayer] frame];
    float xhook =xThumbImage;
    float yhook =tapPoint.y;
    
    //so sanh toa do cua hook va fish.
    if((yhook<currentPostion.origin.y+fish.fishView.frame.size.height)
     &&(yhook>currentPostion.origin.y)
     &&(xhook<currentPostion.origin.x+fish.fishView.frame.size.width)
     &&(xhook>currentPostion.origin.x)){
        NSLog(@"Cau dc ca roi");
        [fish.fishView.layer removeAllAnimations];
        [UIView animateWithDuration:2 animations:^{
            float a= fish.fishView.frame.size.width;
            float b= fish.fishView.frame.size.height;
            fish.fishView.frame =CGRectMake(currentPostion.origin.x , currentPostion.origin.y,a,b );
            fish.fishView.frame =CGRectMake(xThumbImage- fish.fishView.frame.size.width , yThumbImage,a,b );
            hook.hookView.frame=CGRectMake(xThumbImage, yThumbImage, 10, 30);
            [self.slider setThumbImage:[UIImage imageNamed:@"smile"] forState: UIControlStateNormal];
            [fish demoFish];
                }completion:^(BOOL finished) {
                    //[fish.imageView.layer removeAllAnimations];
                    //[fish demoFish];
                    [fish.fishView removeFromSuperview];
                    [hook.hookView removeFromSuperview];
                    [self viewDidLoad];
                }];
    
    }else {
        [UIView animateWithDuration:0.5 animations:^{
           hook.hookView.frame=CGRectMake(xThumbImage, yThumbImage, 10, 30);
            [self.slider setThumbImage:[UIImage imageNamed:@"sad"] forState: UIControlStateNormal];
        }];
         
    }


}
- (IBAction)valueChange:(id)sender {
    //khi slider di chuyen thi hook cung di chuyen theo
    xThumbImage=self.slider.frame.size.width*self.slider.value-5;
    yThumbImage=self.slider.frame.size.height+5;
    hook.hookView.frame =CGRectMake(xThumbImage, yThumbImage,  hook.hookView.frame.size.width,  hook.hookView.frame.size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
