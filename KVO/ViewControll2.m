//
//  ViewControll2.m
//  KVO
//
//  Created by Thiago Hissa on 2017-07-09.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

#import "ViewControll2.h"

@interface ViewControll2 ()
@property (weak, nonatomic) IBOutlet UILabel *label2;

@end

@implementation ViewControll2

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"stepperNotification" object:nil];
}

-(void)handleNotification:(NSNotification*)notification{
    NSNumber *value = notification.userInfo[@"stepperValue"];
    self.label2.text = [NSString stringWithFormat:@"%@", value];
    NSLog(@"Notification Received");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"stepperNotification" object:nil];
}

@end
