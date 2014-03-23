//
//  ViewController.m
//  Scanner-Review
//
//  Created by wangtao on 14-3-20.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

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
    
    NSScanner *scanner = [NSScanner scannerWithString:@"fff 237 fff small cases of bananas"];
    NSLog(@"scanner string=%@", [scanner string]);
    
    NSString *separatorString = @" of";
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
    [scanner scanString:separatorString intoString:NULL]; // 跳过某个字段
    NSLog(@"scan location=%d", [scanner scanLocation]); //
    NSString *product ;
    product = [[scanner string] substringFromIndex:[scanner scanLocation]]; // 从扫描到位置开始截取到最后
    NSLog(@"product=%@", product);
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
