//
//  LoginVC.m
//  work_1_12
//
//  Created by developer on 1/13/17.
//  Copyright © 2017 developer. All rights reserved.
//

#import "LoginVC.h"
#import "SVProgressHUD.h"
@interface LoginVC ()

@property (weak, nonatomic) IBOutlet UITableView* infoTableView;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginVC

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //after loading, view select
    
    [self initTextField];
    
}

- (void) initTextField {
    NSString *strEmail = [[NSUserDefaults standardUserDefaults] objectForKey:@"email"];
    NSString *strPassword = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    
    if(strEmail == nil) {
        strEmail = @"";
    }
    
    if(strPassword == nil) {
        strPassword = @"";
    }
    
    self.emailTextField.text = strEmail;
    self.passwordTextField.text = strPassword;
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


- (IBAction)tapSignInButton:(id)sender {

    NSString *strEmail=self.emailTextField.text;
    NSString *strPassword=self.passwordTextField.text;
    if([strEmail isEqualToString:@""]){
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Email error!"
                                      message:@"Insert your Email!"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        
        [alert addAction:ok];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];
    }

    if([strPassword isEqualToString:@""]){
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Password error!"
                                      message:@"Insert your Password!"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        
        [alert addAction:ok];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
        
    if ([strEmail isEqualToString:@"test"] && [strPassword isEqualToString:@"test"]){
        
        [SVProgressHUD showWithStatus:@"Authenticating..."];
       // [SVProgressHUD showImage:@"loadingCream" status:@"Authenticating..."];
//        [SVProgressHUD showWithStatus:@"Authenticating..."];
//        [SVProgressHUD setSuccessImage:@"loadingCream"];
       
        [[NSUserDefaults standardUserDefaults] setObject:strEmail forKey:@"email"];
        [[NSUserDefaults standardUserDefaults] setObject:strPassword forKey:@"password"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        [self performSegueWithIdentifier:@"ShowMainVC" sender:nil];
        
    }
    
    else {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Error!"
                                      message:@"Login Failed!"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        
        [alert addAction:ok];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];

        
    }


}

- (void)keyboardWillShow:(NSNotification*)notif {
    
    CGRect keyboardBounds;
    [[notif.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [notif.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    // Need to translate the bounds to account for rotation.
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
    [self animateTextFieldUp:YES duration:(CGFloat)duration.floatValue keyboardBounds:keyboardBounds];
}

- (void)keyboardWillHide:(NSNotification*)notif {
    
    CGRect keyboardBounds;
    [[notif.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [notif.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    // Need to translate the bounds to account for rotation.
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
    [self animateTextFieldUp:NO duration:(CGFloat)duration.floatValue keyboardBounds:keyboardBounds];
}


- (IBAction)tapJoinNowButton:(id)sender {
    
    [self performSegueWithIdentifier:@"ShowSignupVC" sender:nil];
}

- (void)animateTextFieldUp:(BOOL)up duration:(CGFloat)duration keyboardBounds:(CGRect)keyboardBounds {
    
    self.infoTableView.scrollEnabled = up;
    
        [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
    }];
}




@end
