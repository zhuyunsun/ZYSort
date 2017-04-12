/*
 1,封装了3个方法，用了2个类；
 2,第一个方法，获取数据源中存在的中文首字母；
 3,第二个方法，获取一个根据首字母而把数据放在不同的数组的数组，也就是说:获取的数组里面还包含着数组，
    然后才是字符串数据，如A{A1,A2,A3,A4},而A1,A2,A3,A4都是数组
 4,第三个方法，将国际标准字节处理成我们的中文数据，
 5,一个是没有处理的数组,一个是已经处理了的数组,还有一个是首字母数组
*/


#import <Foundation/Foundation.h>
#import "Pinyin.h"
#import "ChineseString.h"
@interface DayiGroups : NSObject
-(NSMutableArray *)getSectionsTitles:( NSMutableArray *)arrToSort;
-(NSMutableArray *)getResultGroups:( NSMutableArray *)arrToSort;
-(NSString *)getTextForLable:(NSString * )Istring;
@end
