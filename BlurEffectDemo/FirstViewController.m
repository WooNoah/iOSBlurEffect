//
//  FirstViewController.m
//  BlurEffectDemo
//
//  Created by tb on 16/12/21.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "FirstViewController.h"
#import "UIImage+BlurEffective.h"

#define imageObject [UIImage imageNamed:@"landscape"]

@interface FirstViewController ()

@property (nonatomic,strong) UIScrollView *backScrollView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubImages];
    
}

- (void)setupSubImages {
    
    const CGFloat imgWidth = 500;
    const CGFloat imgHeight = imgWidth/2;
    
    self.backScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    self.backScrollView.contentSize = CGSizeMake(imgWidth + 20 + 150, imgHeight * 6);
    [self.view addSubview:self.backScrollView];
    
    //Normal
    UIImageView *firstImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, imgWidth, imgHeight)];
    firstImg.image = imageObject;
    [self.backScrollView addSubview:firstImg];
    
    UILabel *firstLbl = [[UILabel alloc]initWithFrame:CGRectMake(imgWidth + 20, 10, 100, 44)];
    firstLbl.text = @"Normal";
    [self.backScrollView addSubview:firstLbl];
    
    //vImage
    //耗时操作，需要添加到子线程中处理
    UIImageView *secondImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, (imgHeight + 20), imgWidth, imgHeight)];
    secondImg.image = [imageObject boxblurWithBlurNumber:10];
    [self.backScrollView addSubview:secondImg];
    
    UILabel *secondLbl = [[UILabel alloc]initWithFrame:CGRectMake(imgWidth + 20, (imgHeight + 20), 100, 44)];
    secondLbl.text = @"vImage";
    [self.backScrollView addSubview:secondLbl];
    
    //CoreImage
    //耗时操作，需要添加到子线程中处理
    UIImageView *thirdImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 2 * (imgHeight + 20), imgWidth, imgHeight)];
    UIImage *scaleImg = [imageObject convertToSize:CGSizeMake(imgWidth, imgHeight)];
    thirdImg.image = [scaleImg blurEffectWithRect:(CGRect){0, 0, imgWidth, imgHeight} inputRadius:10];
    
    [self.backScrollView addSubview:thirdImg];
    
    UILabel *thirdLbl = [[UILabel alloc]initWithFrame:CGRectMake(imgWidth + 20, 2 * (imgHeight + 20), 100, 44)];
    thirdLbl.text = @"CoreImage";
    [self.backScrollView addSubview:thirdLbl];
    
    //ToolBar
    UIImageView *forthImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 3 * (imgHeight + 20), imgWidth, imgHeight)];
    forthImg.image = imageObject;
    UIToolbar *blurMaskView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, imgWidth, imgHeight)];
    [forthImg addSubview:blurMaskView];
    
    [self.backScrollView addSubview:forthImg];
    
    UILabel *forthLbl = [[UILabel alloc]initWithFrame:CGRectMake(imgWidth + 20, 3 * (imgHeight + 20), 100, 44)];
    forthLbl.text = @"ToolBar";
    [self.backScrollView addSubview:forthLbl];
    
    
    //Apple Category
    UIImageView *fifthImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 4 * (imgHeight + 20), imgWidth, imgHeight)];
    fifthImg.image = [imageObject imageByApplyingDarkEffect];
    [self.backScrollView addSubview:fifthImg];
    
    UILabel *fifthLbl = [[UILabel alloc]initWithFrame:CGRectMake(imgWidth + 20, 4 * (imgHeight + 20), 200, 44)];
    fifthLbl.text = @"Apple Category";
    [self.backScrollView addSubview:fifthLbl];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
