//
//  ViewController.m
//  Scanner-Review
//
//  Created by wangtao on 14-3-20.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//  http://blog.csdn.net/likendsl/article/details/7974761
//  NSScanner类用于在字符串中扫描指定的字符，尤其是把它们翻译/转换为数字和别的字符串

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // You can set an NSScanner object to ignore a set of characters as it scans the string using the setCharactersToBeSkipped: method. The default set of characters to skip is the whitespace and newline character set.
    
   // To retrieve the unscanned remainder of the string, use [[scanner string] substringFromIndex:[scanner scanLocation]].
    
    NSScanner *scanner = [NSScanner scannerWithString:@"fff 237 fff small casesof bananas"];
    NSLog(@"scanner string=%@", [scanner string]);
    
    NSString *separatorString = @"of";
    [scanner scanString:@"fff " intoString:NULL];
    
    NSInteger integer = 0;
    [scanner scanInteger:&integer];
    NSLog(@"scan location=%d", [scanner scanLocation]); // 3
    NSLog(@"%d", integer);
    NSString *container;
    [scanner scanUpToString:separatorString intoString:&container];
    NSLog(@"container=%@", container);
    NSLog(@"scan location=%d", [scanner scanLocation]); //
    
    NSLog(@"separatorString=%@", separatorString);
    // Invoke this method with NULL as stringValue to simply scan past a given string
    BOOL  result = [scanner scanString:separatorString intoString:NULL]; // 跳过某个字段
    NSLog(@"%d", result);
    NSLog(@"scan location=%d", [scanner scanLocation]); //
    NSString *product ;
    product = [[scanner string] substringFromIndex:[scanner scanLocation]]; // 从扫描到位置开始截取到最后
    NSLog(@"product=%@", product);
    
    
    NSString *string = @"Product: Acme Potato Peeler; Cost: 0.98 73Product: Chef Pierre Pasta Fork; Cost: 0.75 19Product: Chef Pierre Colander; Cost: 1.27 2";
    
    NSCharacterSet *semicolonSet;
    NSScanner *theScanner;
    
    NSString *PRODUCT = @"Product:";
    NSString *COST = @"Cost:";
    
    NSString *productName;
    float productCost;
    NSInteger productSold;
    
    semicolonSet = [NSCharacterSet characterSetWithCharactersInString:@";"];
    theScanner = [NSScanner scannerWithString:string];
    
    // Returns a Boolean value that indicates whether the receiver has exhausted all significant characters
    while ([theScanner isAtEnd] == NO) {
        if ([theScanner scanString:PRODUCT intoString:NULL] &&
            
            [theScanner scanUpToCharactersFromSet:semicolonSet intoString:&productName] &&
            
            [theScanner scanString:@";" intoString:NULL] &&
            
            [theScanner scanString:COST intoString:NULL] &&
            
            [theScanner scanFloat:&productCost] &&
            
            [theScanner scanInteger:&productSold]) {
            NSLog(@"Sales of %@: $%1.2f", productName, productCost * productSold);
        }
    }
    
    // Set up for reading testData
    NSString *testData = @"Los Angeles;8.25;0.580561574;1\nTokyo;1.9;0.643872234;1\nHonolulu;0;0;0\nToronto;7.9;5.3322;3";
    
    NSScanner *myScanner = [NSScanner scannerWithString:testData];
    
    NSString    *location;
    float       theRevenue;
    float       thePercent;
    int         theRank;
    
    // delimiter 分隔符 semicolon 分号
    NSCharacterSet *characterSet;
    characterSet = [NSCharacterSet characterSetWithCharactersInString:@";,"];
    
    // Double check scanner string
    NSLog (@"Scanner string\n");
    NSLog (@"%@",[myScanner string]);
    
    while ([myScanner isAtEnd] == NO) {
        if ([myScanner scanUpToCharactersFromSet:characterSet intoString:&location]) {
            NSLog(@"location= %@", location);
        }
        
        // skiping the ; and ,delimiter
        if ([myScanner scanString:@";" intoString:NULL]) {
            [myScanner scanFloat:&theRevenue];
            NSLog(@"theRevenue=%1.2f", theRevenue);
        }
        
        if ([myScanner scanString:@";" intoString:NULL]) {
            [myScanner scanFloat:&thePercent];
            NSLog(@"thePercent=%1.2f", thePercent);
        }
        
        if ([myScanner scanString:@";" intoString:NULL]) {
            [myScanner scanInt:&theRank];
            NSLog(@"theRank=%d", theRank);
        }
//        [myScanner scanString:@"," intoString:NULL];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
