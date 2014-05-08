//
//  BRSViewController.m
//  MinimalPanelControlsExample
//
//  Created by hector urtubia on 5/3/14.
//  Copyright (c) 2014 Big Robot Studios, LLC. All rights reserved.
//

#import "BRSViewController.h"
#import <BRSMinimalKnob.h>
#import <BRSMinimalVSlider.h>

@interface BRSViewController ()
@property (nonatomic) UILabel* valueLabel;

@end

@implementation BRSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
	
    UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 140, 30)];
    l1.text = @"BRSMinimalKnob";
    l1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:l1];
    
    UILabel *l2 = [[UILabel alloc] initWithFrame:CGRectMake(140, 30, 180, 30)];
    l2.text = @"BRSMinimalVSlider";
    l2.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:l2];
    
    
    BRSMinimalKnob *knob1 = [[BRSMinimalKnob alloc] initWithFrame:CGRectMake(20,80,100,100)];
    [self.view addSubview:knob1];
    
    BRSMinimalKnob *knob2 = [[BRSMinimalKnob alloc] initWithFrame:CGRectMake(40, 220, 60, 60)];
    knob2.knobBackgroundColor = [UIColor orangeColor];
    knob2.knobFillColor = [UIColor  blueColor];
    knob2.knobCenterColor = [UIColor darkGrayColor];
    [self.view addSubview:knob2];

    BRSMinimalVSlider *slider1 = [[BRSMinimalVSlider alloc] initWithFrame:CGRectMake(180, 80, 30, 230)];
    [self.view addSubview:slider1];
    
    BRSMinimalVSlider *slider2 = [[BRSMinimalVSlider alloc] initWithFrame:CGRectMake(240, 80, 30, 230)];
    slider2.sliderBackgroundColor = [UIColor orangeColor];
    slider2.sliderFillColor = [UIColor blueColor];
    [self.view addSubview:slider2];
    
    [knob1 addTarget:self action:@selector(someValueChanged:) forControlEvents:UIControlEventValueChanged];
    [knob2 addTarget:self action:@selector(someValueChanged:) forControlEvents:UIControlEventValueChanged];
    [slider1 addTarget:self action:@selector(someValueChanged:) forControlEvents:UIControlEventValueChanged];
    [slider2 addTarget:self action:@selector(someValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    _valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 320, self.view.bounds.size.width, 80)];
    _valueLabel.text = @"";
    _valueLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_valueLabel];
}

-(void) someValueChanged:(id) sender
{
    int val = 0;
    if([sender isKindOfClass:[BRSMinimalVSlider class]]){
        val = [((BRSMinimalVSlider *)sender) value] * 100;
    }else if([sender isKindOfClass:[BRSMinimalKnob class]]){
        val = [((BRSMinimalKnob*) sender) value] * 100;
    }
    NSString *newString = [NSString stringWithFormat:@"%d", val];
    self.valueLabel.text = newString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
