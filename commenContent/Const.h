//
//  Const.h
//

#import "SetColor.h"


#define BASE_URL @"http://fish.zjit.org/fishPond/"
//#define BASE_URL @"http://119.29.40.41/fishPond/"
//#define BASE_URL @"http://www.zjit.org/fishPond/"



// color
#define COLOR_MAIN [SetColor setcolor:@"#24bcff"]
#define COLOR_GRAY [SetColor setcolor:@"#585153"]
#define COLOR_BGGRAY [SetColor setcolor:@"#F2F2F2"]
#define COLOR_WARNING [UIColor redColor]

// 微信支付
#define WX_PAY_APP_ID @"wx8b19e409825127ff"
#define WX_PAY_PARTNER_ID @"1260477101"
#define WX_PAY_KEY @"8124D27CCD6A47C28534C50D8B094AA8"
#define WX_PAY_SECRET @"8fd962faddf1bd2c8c4f1e341e297c00"
// 支付宝
#define ALIPAY_APP_SCHEME @"wenkorapp201512"

// QQ
#define QQ_APP_ID @"1104692849"

// Baidu
#define BAIDU_APP_ID @"CvV04jMFRqohfYLLhnukuZsW"


// 界面宏
// 界面宽度
#define iPhoneWidth             [UIScreen mainScreen].bounds.size.width
// 界面高度
#define iPhoneHeight             [UIScreen mainScreen].bounds.size.height
//颜色
#define UIColorWithRGB(R,G,B,A) [UIColor colorWithRed:(float)R/255.0f green:(float)G/255.0f blue:(float)B/255.0f alpha:(float)A]
//默认字体
#define defaultFontSize(s) [UIFont systemFontOfSize:s]
#define defaultBoldFontSize(s) [UIFont boldSystemFontOfSize:s]


