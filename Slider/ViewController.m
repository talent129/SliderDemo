//
//  ViewController.m
//  Slider
//
//  Created by mac on 17/5/25.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "ViewController.h"
#import "SliderView.h"

#define SCREEN_Width    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_Height   ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()

@property (nonatomic, strong) SliderView *sliderView;

@property (nonatomic, strong) UISlider *slider;

@end

@implementation ViewController

#pragma mark -
- (SliderView *)sliderView
{
    if (!_sliderView) {
        _sliderView = [[SliderView alloc] initWithFrame:CGRectMake(10, SCREEN_Height / 4.0, SCREEN_Width - 20, SCREEN_Height/2.0)];
        _sliderView.backgroundColor = [UIColor orangeColor];
    }
    return _sliderView;
}

- (UISlider *)slider
{
    if (!_slider) {
        _slider = [[UISlider alloc] initWithFrame:CGRectMake(20, SCREEN_Height/4.0 + SCREEN_Height/2.0 + 20, SCREEN_Width - 40, 20)];
        _slider.minimumValue = 0;
        _slider.maximumValue = 1;
        _slider.value = 0;
        [_slider addTarget:self action:@selector(slicerAction) forControlEvents:UIControlEventValueChanged];
    }
    return _slider;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createUI];
}

#pragma mark -createUI
- (void)createUI
{
    [self.view addSubview:self.sliderView];
    [self.view addSubview:self.slider];
}

- (void)slicerAction
{
    NSLog(@"%f", self.slider.value);
    self.sliderView.percentage = self.slider.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
