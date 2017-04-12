//
//  ViewController.m
//  ZYSort
//
//  Created by 朱运 on 2017/4/12.
//  Copyright © 2017年 朱运. All rights reserved.
//

#import "ViewController.h"
#import "DayiGroups.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView * _myTableview;
    NSMutableArray * _dataSource;
    NSMutableArray * _resultArray;
    NSMutableArray * _titleArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * arr = @[@"阿满",@"差一点",@"少年啊",@"黑社会",@"墙一直在",@"看不懂",@"死光了",@"欺世盗名",@"牛了",@"乔布斯",@"iOS",@"睡了",@"认识不",@"无力回头"];
    _dataSource = [[NSMutableArray alloc]initWithArray:arr];
    _resultArray = [DayiGroups getResultGroups:_dataSource];
    _titleArray = [DayiGroups getSectionsTitles:_dataSource];
//    NSLog(@"排序标题 = %@ --- %@",_resultArray,_titleArray);

    _myTableview = [[UITableView alloc]init];
    CGRect baseRect = self.view.bounds;
    baseRect.origin.y = 20;
    baseRect.size.height = self.view.bounds.size.height - 20;
    _myTableview.frame = baseRect;
    _myTableview.dataSource = self;
    _myTableview.delegate = self;
    [self.view addSubview:_myTableview];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _titleArray[section];
}
-(NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView{
    tableView.sectionIndexBackgroundColor = [UIColor clearColor];//索引背景色
    tableView.sectionIndexColor = [UIColor blueColor];//索引文字颜色
    NSMutableArray * existTitles = [NSMutableArray array];
    //section数组为空的title过滤掉，不显示
    for (int i = 0; i < [_titleArray count]; i++) {
        if ([[_resultArray objectAtIndex:i] count] > 0) {
            [existTitles addObject:[_titleArray objectAtIndex:i]];
        }
    }
    return existTitles;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _resultArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_resultArray objectAtIndex:section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * sortString =  @"sortString";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:sortString];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:sortString];
    }
    NSArray * arr = [_resultArray objectAtIndex:indexPath.section];
    NSString * lableString = [arr objectAtIndex:indexPath.row];
    NSString * messages = [DayiGroups getTextForLable:lableString];
    cell.textLabel.text = messages;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
@end
