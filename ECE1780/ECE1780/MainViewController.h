//
//  MainViewController.h
//  ECE1780
//
//  Created by Rohan Bali on 2013-10-22.
//  Copyright (c) 2013 Rohan Bali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioController.h"
#import "FFTAccelerate.h"

@interface MainViewController : UIViewController <AudioControllerDelegate> {
    AudioController *audioManager;
}

@property (strong, nonatomic) IBOutlet UILabel *outputLabel;

@end
