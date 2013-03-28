//
//  ViewController.m
//  BaiTap1
//
//  Created by Fighting on 3/24/13.
//  Copyright (c) 2013 Fighting. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIImageView *imageView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)demoSwitchView:(id)sender {
   UISwitch *switchView=(UISwitch *) sender;
    if([switchView isOn]){
    UIAlertView *alertView =[[UIAlertView alloc] initWithTitle:@"Title"
                                                       message:@"Bạn đã đủ 18 tuổi chưa?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES",nil];
        [alertView show];
    }else{
        [imageView removeFromSuperview];
    }
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
             NSString *title=[alertView buttonTitleAtIndex:buttonIndex];
             if([title isEqualToString:@"YES"]){
                 imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"girlxinh.jpg"]];
                // NSLog(@"%f",imageView.frame.size.height);
                 imageView.frame =CGRectMake(10, 50, imageView.frame.size.width, imageView.frame.size.height);
                 [self.view addSubview:imageView ];
             }
         }
@end
