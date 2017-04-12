#import "DayiGroups.h"
@implementation DayiGroups
-(NSMutableArray *)getSectionsTitles:( NSMutableArray *)arrToSort
{
    //先创建一个临时的变动的数组
    NSMutableArray * chineseStringsArray = [NSMutableArray new];
    for (int i = 0; i < [arrToSort count]; i ++)
    {
        //临时数据模型
        ChineseString * chineseString = [[ChineseString alloc]init];
        //给模型赋值
        chineseString.string = [NSString stringWithString:[arrToSort objectAtIndex:i]];
        if (chineseString.string == nil)
        {
            chineseString.string = @"";
        }
        if (![chineseString.string isEqualToString:@""])
        {
            NSString * pinYinResult = [NSString string];
            //按模型中row的个数循环
            for (int j = 0; j < chineseString.string.length;  j ++)
            {
                NSString * singlePinyinLetter = [[NSString stringWithFormat:@"%c",pinyinFirstLetter([chineseString.string characterAtIndex:j])] uppercaseString];//字符串的首字母大写
                pinYinResult = [pinYinResult stringByAppendingString:singlePinyinLetter];
            }
            chineseString.pinYin = pinYinResult;
        }
        else
        {
            chineseString.pinYin = @"";
        }
//        NSLog(@"string = %@",chineseString);
        [chineseStringsArray addObject:chineseString];
    }
    //获得的是chineseStringsArray，里面有什么呢
    //排序
    NSArray * sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"pinYin" ascending:YES]];
    
    [chineseStringsArray sortUsingDescriptors:sortDescriptors];
    NSMutableArray * arrayForArrays = [NSMutableArray array];
    NSMutableArray * titiesForKey = [NSMutableArray array];
    BOOL checkValueAtIndex = NO;
    NSMutableArray * TemArrForGrouping = nil;
    for (int index = 0; index < [chineseStringsArray count]; index ++)
    {
        ChineseString * chineseStr = (ChineseString *)[chineseStringsArray objectAtIndex:index];
        NSMutableString * strchar = [NSMutableString stringWithString:chineseStr.pinYin];
        NSString * sr = [strchar substringToIndex:1];//每个字符串的第一个字符
        //检查是否已经选择头健
        
        if (![titiesForKey containsObject:[sr uppercaseString]])
        {
            [titiesForKey addObject:[sr uppercaseString]];
            TemArrForGrouping = [[NSMutableArray alloc]init];
            checkValueAtIndex = NO;
            
        }
        if ([titiesForKey containsObject:[sr uppercaseString]])
        {
            [TemArrForGrouping addObject:[chineseStringsArray objectAtIndex:index]];
            if (checkValueAtIndex == NO)
            {
                [arrayForArrays addObject:TemArrForGrouping];
                checkValueAtIndex = YES;
            }
        }
        
    }
    return titiesForKey;//单单只是一个只有首字母的数组
}
-(NSMutableArray *)getResultGroups:( NSMutableArray *)arrToSort
{
    //先创建一个临时的变动的数组
    NSMutableArray * chineseStringsArray = [NSMutableArray new];
    for (int i = 0; i < [arrToSort count]; i ++)
    {
        //临时数据模型
        ChineseString * chineseString = [[ChineseString alloc]init];
        //给模型赋值
        chineseString.string = [NSString stringWithString:[arrToSort objectAtIndex:i]];
        if (chineseString.string == nil)
        {
            chineseString.string = @"";
        }
        if (![chineseString.string isEqualToString:@""])
        {
            NSString * pinYinResult = [NSString string];
            //按模型中row的个数循环
            for (int j = 0; j < chineseString.string.length;  j ++)
            {
                NSString * singlePinyinLetter = [[NSString stringWithFormat:@"%c",pinyinFirstLetter([chineseString.string characterAtIndex:j])] uppercaseString];//字符串的首字母大写
                pinYinResult = [pinYinResult stringByAppendingString:singlePinyinLetter];
            }
            chineseString.pinYin = pinYinResult;
        }
        else
        {
            chineseString.pinYin = @"";
        }
//        NSLog(@"string = %@",chineseString);
        [chineseStringsArray addObject:chineseString];
    }
    //获得的是chineseStringsArray，里面有什么呢
    //排序
    NSArray * sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"pinYin" ascending:YES]];
    
    [chineseStringsArray sortUsingDescriptors:sortDescriptors];
    NSMutableArray * arrayForArrays = [NSMutableArray array];
    NSMutableArray * titiesForKey = [NSMutableArray array];
    BOOL checkValueAtIndex = NO;
    NSMutableArray * TemArrForGrouping = nil;
    for (int index = 0; index < [chineseStringsArray count]; index ++)
    {
        ChineseString * chineseStr = (ChineseString *)[chineseStringsArray objectAtIndex:index];
        NSMutableString * strchar = [NSMutableString stringWithString:chineseStr.pinYin];
        NSString * sr = [strchar substringToIndex:1];//每个字符串的第一个字符
        //检查是否已经选择头健
        
        if (![titiesForKey containsObject:[sr uppercaseString]])
        {
            [titiesForKey addObject:[sr uppercaseString]];
            TemArrForGrouping = [[NSMutableArray alloc]init];
            checkValueAtIndex = NO;
            
        }
        if ([titiesForKey containsObject:[sr uppercaseString]])
        {
            [TemArrForGrouping addObject:[chineseStringsArray objectAtIndex:index]];
            if (checkValueAtIndex == NO)
            {
                [arrayForArrays addObject:TemArrForGrouping];
                checkValueAtIndex = YES;
            }
        }
        
    }
    return arrayForArrays;
    //数组中套着一层数组，最后才是字符串    A{A1,A2,A3,A4};
}
-(NSString *)getTextForLable:(NSString* )Istring
{
    ChineseString * str = (ChineseString *)Istring;
    return str.string;
    /*  如何调用 样式，_dataSource处理后的结果，就是 A{A1,A2,A3,A4};
     if ([_dataSource count] > indexPath.section)
     {
     NSArray * arr = [self.dataSource objectAtIndex:indexPath.section];
     if ([arr count] > indexPath.row)
     {
     //ChineseString * str = (ChineseString *)[arr objectAtIndex:indexPath.row];
     cell.textLabel.text = [group getTextForLable:[arr objectAtIndex:indexPath.row]];
     }
     */
}
@end
