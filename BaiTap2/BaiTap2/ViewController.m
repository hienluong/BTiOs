//
//  ViewController.m
//  BaiTap2
//
//  Created by Fighting on 3/26/13.
//  Copyright (c) 2013 Fighting. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#define SAFECOLOR(color) MIN(255,MAX(0,color))
@interface ViewController ()
{
    UIImage *messi;
    UIImage *ronaldo;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (strong,nonatomic) UIImage *selectedImage;
@end
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
       messi =[UIImage imageNamed:@"messi.jpg"];
     ronaldo=[UIImage imageNamed:@"ronaldo.jpg"];
    self.imageView.image=messi;
    self.selectedImage =[UIImage imageNamed:@"messi.jpg"];
    [self.slider addTarget:self action:@selector(changeBrightness) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [
     super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeImage:(id)sender {
    UISegmentedControl *segmenttedControl=(UISegmentedControl *) sender;
    if([segmenttedControl selectedSegmentIndex]==0){
        self.imageView.image =messi;
        self.selectedImage =[UIImage imageNamed:@"messi.jpg"];
        self.slider.value=0.5;
        
    }else{
        self.imageView.image=ronaldo;
        self.slider.value=0.5;
        self.selectedImage=[UIImage imageNamed:@"ronaldo.jpg"];
    }
}
- (IBAction)changeBrightness{
    double value =self.slider.value+0.5;
    NSLog(@"%f",value);
    CGImageRef imageRef =self.selectedImage.CGImage;
    CFDataRef dataRef = CGDataProviderCopyData(CGImageGetDataProvider(imageRef));
	int length = CFDataGetLength(dataRef);
	CFMutableDataRef mutuableDataRef= CFDataCreateMutableCopy(NULL,length,dataRef);
    UInt8 * pixels = (UInt8 *) CFDataGetMutableBytePtr(mutuableDataRef);
    
	for (int i=0; i<length; i+=4)
	{
		
        
        int r = i;
        int g = i+1;
        int b = i+2;
        
        int red = pixels[r];
        int green =pixels[g];
        int blue = pixels[b];
        
        pixels[r] = SAFECOLOR(red*value);
      
        pixels[g] = SAFECOLOR(green*value);
        pixels[b] = SAFECOLOR(blue*value);
	}
	
	CGContextRef ctx = CGBitmapContextCreate(pixels,
											 CGImageGetWidth(imageRef),
											 CGImageGetHeight(imageRef),
											 CGImageGetBitsPerComponent(imageRef),
											 CGImageGetBytesPerRow(imageRef),
											 CGImageGetColorSpace(imageRef),
											 CGImageGetAlphaInfo(imageRef)
											 );
	
	CGImageRef newImageRef = CGBitmapContextCreateImage(ctx);
	UIImage *img = [UIImage imageWithCGImage:newImageRef
                                              scale:self.imageView.image.scale
                                        orientation:self.imageView.image.imageOrientation];
    self.imageView.image=img;
        
}


@end
