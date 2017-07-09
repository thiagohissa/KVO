//
//  ViewControll1.m
//  KVO
//
//  Created by Thiago Hissa on 2017-07-09.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

#import "ViewControll1.h"

@interface ViewControll1 ()
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation ViewControll1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperFunction:(id)sender {
    NSDictionary *dictionary = @{@"stepperValue":[NSNumber numberWithDouble:self.stepper.value]};
    NSNotification *notification = [[NSNotification alloc] initWithName:@"stepperNotification" object:nil userInfo:dictionary];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotification:notification];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
