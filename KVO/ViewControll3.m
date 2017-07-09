//
//  ViewControll3.m
//  KVO
//
//  Created by Thiago Hissa on 2017-07-09.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

#import "ViewControll3.h"

@interface ViewControll3 ()
@property (weak, nonatomic) IBOutlet UIView *whiteView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstrain;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (readonly, nonatomic) CGFloat oldConstrain;
@end

@implementation ViewControll3

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(keyboardChanged:) name:UIKeyboardDidChangeFrameNotification object:nil];
    _oldConstrain = self.bottomConstrain.constant;
    // Do any additional setup after loading the view.
}

-(void)keyboardChanged:(NSNotification*)notification{
    NSLog(@"%@",notification.userInfo);
    NSValue *value = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = value.CGRectValue;
    
    CGFloat yPos = rect.origin.y;
    CGFloat viewHeight = self.view.bounds.size.height;
    
    if(yPos == viewHeight){
        self.bottomConstrain.constant = self.oldConstrain;
    }
    else{
        self.bottomConstrain.constant = viewHeight - yPos;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tapToDismissKeyboard:(id)sender {
    [self.view endEditing:YES];
}

@end
