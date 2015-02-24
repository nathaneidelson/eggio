//
//  ViewController.m
//  eggio
//
//  Created by Nathan Eidelson on 2/23/15.
//  Copyright (c) 2015 Eggio. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

#define total_duration 300
#define num_windows 5


@interface ViewController ()

@property (nonatomic) int time;

@property (nonatomic) bool meditating;

@property (nonatomic) NSArray *delay_for_window;

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.field_time_between.text = @"1";
  self.field_duration.text = @"1";
  
  self.delay_for_window = @[@5, @10, @-1, @10, @5];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (int)delayForTime:(int)time
{
  int time_per_window = total_duration / num_windows;
  int window = time / time_per_window;
  
  return [self.delay_for_window[window] integerValue];
}

- (void)beginMeditation
{
  self.time = 0;

  while (self.meditating && self.time < total_duration)
  {
    int delay = [self delayForTime:self.time];
    printf("Time: %d Delay: %d \n", self.time, delay);
    
    if (delay != -1) {
      //sleep(delay);
      AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
      self.time += delay;
    } else {
     // sleep(1);
      self.time += 1;
    }
  }
  
  // Signal end
  AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
  AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);

}


- (IBAction)click_begin_meditation:(id)sender
{
  if (self.meditating)
  {
    self.meditating = false;
    [self.button_begin_meditation setTitle:@"Start Meditation" forState:UIControlStateNormal];
  } else {
    self.meditating = true;
    [self.button_begin_meditation setTitle:@"Stop Meditation" forState:UIControlStateNormal];
    [NSThread detachNewThreadSelector:@selector(beginMeditation)
                             toTarget:self
                           withObject:nil];
  }
}

- (IBAction)time_between_changed:(id)sender
{
  self.field_time_between.text = [NSString stringWithFormat:
                                  @"%d", (int)self.stepper_time_between.value];
}

- (IBAction)duration_changed:(id)sender
{
  self.field_duration.text = [NSString stringWithFormat:
                                  @"%d", (int)self.stepper_duration.value];
}

@end
