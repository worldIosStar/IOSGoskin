//
//  FastOrderVC.m
//  work_1_12
//
//  Created by developer on 1/13/17.
//  Copyright © 2017 developer. All rights reserved.
//

#import "FastOrderVC.h"
#import "ProductCell.h"
#import "SVProgressHUD.h"
@interface FastOrderVC ()
@property (weak, nonatomic) IBOutlet UITableView* productTableView;
@property (strong, nonatomic) NSArray *products;
@end

@implementation FastOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self loadProducts];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self loadProducts];
    [SVProgressHUD dismiss];
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



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [self.products count];
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductCell* cell = (ProductCell*)[tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
    
    NSDictionary* productInfo = [self.products objectAtIndex:indexPath.row];
    
    NSString* productName = [productInfo valueForKey:@"productName"];
     NSString* priceLabel = [productInfo valueForKey:@"price"];
     NSString* descLabel = [productInfo valueForKey:@"detail"];
    NSString *strPriceSymbol = productInfo[@"priceCurrencySymbol"];
    NSString* imagePath = [productInfo valueForKey:@"imageUrlSmall"];
    
    cell.nameLabel.text = productName;
    cell.priceLabel.text = priceLabel;
    cell.priceLabel.text = strPriceSymbol;
    cell.descLabel.text = descLabel;
    
    NSURL* imageUrl = [NSURL URLWithString:imagePath];
    NSData* imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage* image = [UIImage imageWithData:imageData];
    cell.productImageView.image = image;
    
    return cell;
}


- (void)loadProducts {
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"products_json" ofType:@"txt"];
    NSLog(@"===> %@", filePath);
    
    NSData* fileData = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error = nil;
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:fileData options:kNilOptions error:&error];
    NSLog(@"%@",jsonObject);
    
    self.products = [jsonObject valueForKey:@"products"];
    
    [self.productTableView reloadData];
    
    
    if (error != nil)
    {
        NSLog(@"Error parsing JSON:\n%@",error.userInfo);
        return;
    }
}

- (IBAction)tapNextButton:(id)sender {
    [self performSegueWithIdentifier:@"ShowOrderDetailVC" sender:nil];
}

@end
