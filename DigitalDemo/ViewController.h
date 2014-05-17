//
//  ViewController.h
//  DigitalDemo
//
//  Created by lic&z on 14-5-18.
//  Copyright (c) 2014年 lic&z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *resultlabel;

@property (nonatomic, retain) NSString *digitStr;
@property (nonatomic, retain) NSMutableString *currentNumMutableStr;

- (IBAction)numberButton:(id)sender;
- (IBAction)cancleButton:(id)sender;
- (IBAction)clearButton:(id)sender;

@end
