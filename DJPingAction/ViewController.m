//
//  ViewController.m
//  DJPingAction
//
//  Created by jian deng on 08/09/2017.
//  Copyright © 2017 jian deng. All rights reserved.
//

#import "ViewController.h"
#import "DJPingAction.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *hostTextFiled;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self clickPingButton:nil];
//    });
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clickPingButton:(id)sender {
    NSString * host = self.hostTextFiled.text;
    host = @"https://sgv-netcon.wifi8.com/api";
    NSTimeInterval timOutLimit = 0.5f;
    [DJPingAction startWithHost:host
                   timeOutLimit:timOutLimit
                stopWhenReached:NO
                       maxCount:2
                       feedback:^(DJPingItem *item) {
        NSLog(@"ping Action item = %@",item);
    } complete:^{
        NSLog(@"ping Action finished!");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
