//
//  UtilsMacro.h
//  DigitalDemo
//
//  Created by lic&z on 14-5-18.
//  Copyright (c) 2014年 lic&z. All rights reserved.
//

#ifndef DigitalDemo_UtilsMacro_h
#define DigitalDemo_UtilsMacro_h

#define NUMBER_LEN      resultlabel.text.length

typedef NS_ENUM(NSInteger, DecimalFlag) {
    DecimalFlagZero = 0,                //输入一位整数
    DecimalFlagOne  = 1,                //输入第一位小数
    DecimalFlagTwo  = 2                 //输入第二位小数
};

typedef NS_ENUM(NSInteger, DelNumFlag) {
    DelNumFlagZero = 0,                 //删除一位整数
    DelNumFlagOne  = 1,                 //删除第一位小数
    DelNumFlagTwo  = 2                  //删除第二位小数
};

typedef unsigned short WORD;



#endif
