//
//  QMUIConfigurationTemplate.m
//  qmui
//
//  Created by QMUI Team on 15/3/29.
//  Copyright (c) 2015年 QMUI Team. All rights reserved.
//

#import "QMUIConfigurationTemplatePinkRose.h"

@implementation QMUIConfigurationTemplatePinkRose

#pragma mark - <QMUIConfigurationTemplateProtocol>

- (void)applyConfigurationTemplate {
    [super applyConfigurationTemplate];
    
    QMUICMI.navBarBackgroundImage = [QDUIHelper navigationBarBackgroundImageWithThemeColor:UIColor.qd_tintColor];
    
    QMUICMI.tabBarTintColor = UIColor.qd_tintColor;
    QMUICMI.tabBarItemTitleColorSelected = TabBarTintColor;
}

// QMUI 2.3.0 版本里，配置表新增这个方法，返回 YES 表示在 App 启动时要自动应用这份配置表。仅当你的 App 里存在多份配置表时，才需要把除默认配置表之外的其他配置表的返回值改为 NO。
- (BOOL)shouldApplyTemplateAutomatically {
    [QMUIThemeManager.sharedInstance addThemeIdentifier:self.themeName theme:self];
    
    NSString *selectedThemeIdentifier = [[NSUserDefaults standardUserDefaults] stringForKey:QDSelectedThemeIdentifier];
    BOOL result = [selectedThemeIdentifier isEqualToString:self.themeName];
    if (result) {
        QMUIThemeManager.sharedInstance.currentTheme = self;
    }
    return result;
}

#pragma mark - <QDThemeProtocol>

- (UIColor *)themeTintColor {
    return UIColorTheme9;
}

- (NSString *)themeName {
    return QDThemeIdentifierPinkRose;
}

@end
