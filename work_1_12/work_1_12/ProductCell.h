//
//  ProductCell.h
//  work_1_12
//
//  Created by developer on 1/14/17.
//  Copyright © 2017 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView* wrapper;
@property (weak, nonatomic) IBOutlet UIImageView* productImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView* activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel* nameLabel;
@property (weak, nonatomic) IBOutlet UILabel* priceLabel;
@property (weak, nonatomic) IBOutlet UILabel* descLabel;
@property (weak, nonatomic) IBOutlet UITextField* amountField;
@property (weak, nonatomic) IBOutlet UILabel* totalCostLabel;

@property (weak, nonatomic) IBOutlet UIButton* plusButton;
@property (weak, nonatomic) IBOutlet UIButton* minuseButton;
@property (weak, nonatomic) IBOutlet UIButton* thumbButton;

@end
