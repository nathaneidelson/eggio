//
//  ViewController.h
//  eggio
//
//  Created by Nathan Eidelson on 2/23/15.
//  Copyright (c) 2015 Eggio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)click_begin_meditation:(id)sender;
- (IBAction)time_between_changed:(id)sender;
- (IBAction)duration_changed:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *button_begin_meditation;

@property (weak, nonatomic) IBOutlet UILabel *label_time_between;
@property (weak, nonatomic) IBOutlet UILabel *label_duration;

@property (weak, nonatomic) IBOutlet UITextField *field_time_between;
@property (weak, nonatomic) IBOutlet UITextField *field_duration;

@property (weak, nonatomic) IBOutlet UIStepper *stepper_time_between;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_duration;


@end

