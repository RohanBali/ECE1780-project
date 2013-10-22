//
//  MainViewController.m
//  ECE1780
//
//  Created by Rohan Bali on 2013-10-22.
//  Copyright (c) 2013 Rohan Bali. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - Lifecycle Methods

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
    audioManager = [AudioController sharedAudioManager];
    audioManager.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - AudioController Delegate Methods

- (void) receivedAudioSamples:(SInt16 *)samples length:(int)len {
    
    int numSamples = len;
    float *frequency = (float *)malloc(sizeof(float)*numSamples);
    float *buffer = (float *)malloc(sizeof(float)*numSamples);

    
    for (int i = 0; i < len; i++) {
        float currentFrame = samples[i] / 32768.0f;
        buffer[i] = currentFrame;
    }
    
    FFTAccelerate *fftAccel = new FFTAccelerate(numSamples);
    fftAccel->doFFTReal((float *)buffer, frequency, numSamples);
    
    for (int i=0; i<numSamples; i++) {
        NSLog(@"index: %d, amp: %.5f",i, frequency[i]);
    }
    delete(fftAccel);
}


@end
