//
//  ProfileVC.m
//  work_1_12
//
//  Created by developer on 1/13/17.
//  Copyright © 2017 developer. All rights reserved.
//

#import "ProfileVC.h"
#import "CountriesVC.h"

@interface ProfileVC ()
@property (strong, nonatomic) IBOutlet UITextField *countryTextfield;

@end

@implementation ProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//       
//    if ([segue.identifier isEqualToString:@"ShowCountries"]) {
//        
//        CountriesVC* vc = segue.destinationViewController;
//        vc.parentVC = self;
//    }

    
}



- (IBAction)tapCancelButton:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self performSegueWithIdentifier:@"ShowCountriesVC" sender:nil];
    return NO;
}



@end
