//
//  CountriesVC.m
//  work_1_12
//
//  Created by developer on 1/13/17.
//  Copyright © 2017 developer. All rights reserved.
//

#import "CountriesVC.h"
#import "ProfileVC.h"
@interface CountriesVC ()

@property (weak, nonatomic) IBOutlet UITableView *countryTableView;
@property (strong, nonatomic) NSArray *countries;
@property (strong, nonatomic) NSString *selectedCountry;
@property (weak, nonatomic) NSString* country;
@end

@implementation CountriesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadCountries];
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
    
    
   
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if ([segue.identifier isEqualToString:@"ShowCountries"]) {
            CountriesVC* vc = segue.destinationViewController;
            vc.selectedCountry = self.selectedCountry;
        }
   
}

*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [self.countries count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CountryCell" forIndexPath:indexPath];
    
    NSDictionary* countriesInfo = [self.countries objectAtIndex:indexPath.row];
    cell.textLabel.text=[countriesInfo valueForKey:@"label"];
    return cell;
}


- (void)loadCountries {
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"countries_json" ofType:@"txt"];
    NSLog(@"===> %@", filePath);
    
    NSData* fileData = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error = nil;
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:fileData options:kNilOptions error:&error];
    NSLog(@"%@",jsonObject);
    
    self.countries = [jsonObject valueForKey:@"countries"];
    
    [self.countryTableView reloadData];
    
    
    if (error != nil)
    {
        NSLog(@"Error parsing JSON:\n%@",error.userInfo);
        return;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self dismissViewControllerAnimated:NO completion:nil];    
    
}



@end
