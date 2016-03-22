//
//  HomeViewController.h
//  Native_H5_InterCommunicate
//
//  Created by 余钦 on 16/3/22.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol HomeJsExport <JSExport>
- (void)pushViewController:(NSString *)ControlerName title:(NSString *)title;
- (void)showAlertController;
@end

@interface HomeViewController : UIViewController

@end
