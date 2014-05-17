//
//  ViewController.m
//  DigitalDemo
//
//  Created by lic&z on 14-5-18.
//  Copyright (c) 2014年 lic&z. All rights reserved.
//

#import "ViewController.h"

BOOL g_bFinstInput = YES;                //首次输入
WORD g_wDecimalFlag = DecimalFlagZero;   //0: 输入整数    1: 输入第一位小数    2: 输入第二位小数
WORD g_wDelNumFlag = DelNumFlagZero;     //0: 删除整肃    1: 删除第一位小数    2: 删除第二位小数

@interface ViewController ()

@end

@implementation ViewController

@synthesize digitStr;
@synthesize currentNumMutableStr;
@synthesize resultlabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    resultlabel.font = [UIFont fontWithName:@"Quartz" size:80.0f];
    resultlabel.text = @"0";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberButton:(id)sender
{
    //获取数字按键值
    UIButton *button = (UIButton *)sender;
    if (button.tag == 10)
    {
        digitStr = [NSString stringWithFormat:@"."];
    }
    else
    {
        digitStr = [NSString stringWithFormat:@"%ld", (long)button.tag];
    }
    
    //首次输入
    if (g_bFinstInput)
    {
        if ([digitStr isEqualToString:@"."])
        {
            resultlabel.text = @"0.00";
            g_wDecimalFlag = DecimalFlagOne;
        }
        else
        {
            resultlabel.text = [NSString stringWithFormat:@"%@.00", digitStr];
            g_wDecimalFlag = DecimalFlagZero;
        }
        
        g_bFinstInput = NO;
    }
    else
    {
        //整数输入小数
        if (g_wDecimalFlag == DecimalFlagZero && [digitStr isEqualToString:@"."]) {
            g_wDecimalFlag = DecimalFlagOne;
        }
        
        switch (g_wDecimalFlag) {
            case DecimalFlagZero:
            {
                if (![digitStr isEqualToString:@"."])
                {
                    currentNumMutableStr = [NSMutableString stringWithString:resultlabel.text];
                    [currentNumMutableStr insertString:digitStr atIndex:NUMBER_LEN - 3];
                    resultlabel.text = [NSString stringWithFormat:@"%@", currentNumMutableStr];
                    g_wDelNumFlag = DecimalFlagZero;
                }
            }
                break;
                
            case DecimalFlagOne:
            {
                if (![digitStr isEqualToString:@"."])
                {
                    currentNumMutableStr = [NSMutableString stringWithString:resultlabel.text];
                    [currentNumMutableStr replaceCharactersInRange:NSMakeRange(NUMBER_LEN - 2, 1) withString:digitStr];
                    resultlabel.text = [NSString stringWithFormat:@"%@", currentNumMutableStr];
                    g_wDecimalFlag = DecimalFlagTwo;
                    g_wDelNumFlag = DecimalFlagOne;
                }
            }
                break;
                
            case DecimalFlagTwo:
            {
                if (![digitStr isEqualToString:@"."])
                {
                    currentNumMutableStr = [NSMutableString stringWithString:resultlabel.text];
                    [currentNumMutableStr replaceCharactersInRange:NSMakeRange(NUMBER_LEN - 1, 1) withString:digitStr];
                    resultlabel.text = [NSString stringWithFormat:@"%@", currentNumMutableStr];
                    g_wDecimalFlag = DecimalFlagTwo;
                    g_wDelNumFlag = DecimalFlagTwo;
                }
            }
                break;
                
            default:
                break;
        }
    }
}

- (IBAction)cancleButton:(id)sender
{
    if ([resultlabel.text isEqualToString:@"0.00"] || [resultlabel.text isEqualToString:@"0"])
    {
        resultlabel.text = @"0";
        g_bFinstInput = YES;
        g_wDecimalFlag = DecimalFlagZero;
        
        return;
    }
    
    switch (g_wDelNumFlag) {
        case DelNumFlagZero:
        {
            currentNumMutableStr = [NSMutableString stringWithString:resultlabel.text];
            [currentNumMutableStr deleteCharactersInRange:NSMakeRange(NUMBER_LEN - 4, 1)];
            if ([currentNumMutableStr isEqualToString:@".00"]) {
                resultlabel.text = @"0";
                g_bFinstInput = YES;
                return;
            }
            resultlabel.text = [NSString stringWithFormat:@"%@", currentNumMutableStr];
            g_wDecimalFlag = DecimalFlagZero;
        }
            break;
            
        case DelNumFlagOne:
        {
            currentNumMutableStr = [NSMutableString stringWithString:resultlabel.text];
            [currentNumMutableStr deleteCharactersInRange:NSMakeRange(NUMBER_LEN - 2, 2)];
            if ([currentNumMutableStr isEqualToString:@"0."]) {
                resultlabel.text = @"0";
                g_bFinstInput = YES;
                return;
            }
            resultlabel.text = [NSString stringWithFormat:@"%@00", currentNumMutableStr];
            g_wDecimalFlag = DecimalFlagOne;
            g_wDelNumFlag = DelNumFlagZero;
        }
            break;
            
        case DelNumFlagTwo:
        {
            currentNumMutableStr = [NSMutableString stringWithString:resultlabel.text];
            [currentNumMutableStr deleteCharactersInRange:NSMakeRange(NUMBER_LEN - 1, 1)];
            resultlabel.text = [NSString stringWithFormat:@"%@0", currentNumMutableStr];
            g_wDecimalFlag = DecimalFlagTwo;
            g_wDelNumFlag = DelNumFlagOne;
        }
            break;
            
        default:
            break;
    }
}

- (IBAction)clearButton:(id)sender
{
    resultlabel.text = @"0";
    g_bFinstInput = YES;
    g_wDecimalFlag = DecimalFlagZero;
}

@end
