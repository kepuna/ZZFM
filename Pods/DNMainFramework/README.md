# DNMainFramework

[![CI Status](https://img.shields.io/travis/540563689@qq.com/DNMainFramework.svg?style=flat)](https://travis-ci.org/540563689@qq.com/DNMainFramework)
[![Version](https://img.shields.io/cocoapods/v/DNMainFramework.svg?style=flat)](https://cocoapods.org/pods/DNMainFramework)
[![License](https://img.shields.io/cocoapods/l/DNMainFramework.svg?style=flat)](https://cocoapods.org/pods/DNMainFramework)
[![Platform](https://img.shields.io/cocoapods/p/DNMainFramework.svg?style=flat)](https://cocoapods.org/pods/DNMainFramework)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

可以在`AppDelegate`里进行初始化操作 例如

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ZFMHomeViewController *vc1 = [[ZFMHomeViewController alloc] init];
    vc1.title = @"首页";
    ZFMListenViewController *vc2 = [[ZFMListenViewController alloc] init];
    vc2.title = @"发现新资源";
    ZFMDiscoverViewController *vc3 = [[ZFMDiscoverViewController alloc] init];
    vc3.title = @"我听";
    ZFMMineViewController *vc4 = [[ZFMMineViewController alloc] init];
    vc4.title = @"更多";
    
    // 初始化子控制器
   [[MainFrameworkAPI sharedInstance] addChildContollers:@[vc1,vc2,vc3,vc4] titles:@[@"首页",@"发现",@"我的",@"更多"] imagesNormal:@[@"btnGnbHomeOff",@"btnGnbSearchOff",@"btnGnbHomeMyOff",@"btnGnbMoreOff"] imagesSeleted:@[@"btnGnbHomeOn",@"btnGnbSearchOn",@"btnGnbHomeMyOn",@"btnGnbMoreOn"] inBundle:ZFMResourceMain];
    
    // 更新系统Tabbar样式
    [[MainFrameworkAPI sharedInstance] updateTabBarWithConfig:^(NXTabBarConfig *config) {
        config.style = TabBarStyleCustom;
        config.globalBackgroundColor = [UIColor darkTextColor];
        config.titleColorNormal = [UIColor colorWithRed:126 /255.0 green:126 /255.0 blue:126 /255.0 alpha:1];
        config.titleColorSelected = [UIColor colorWithRed:9 / 255.0 green:165 / 255.0 blue:90 / 255.0 alpha:1];;
        config.font = [UIFont boldSystemFontOfSize:11];
    }];
    
    self.window.rootViewController = [[MainFrameworkAPI sharedInstance] rootTabBarController];
    return YES;
}

```

效果如下：

![](./images/img1.png)

**同样也可以自定义Tabbar**

```

// 更新Tabbar样式
    [[MainFrameworkAPI sharedInstance] updateTabBarWithConfig:^(NXTabBarConfig *config) {
        config.style = TabBarStyleCustom;
        config.globalBackgroundColor = [UIColor darkTextColor];
        config.titleColorNormal = [UIColor colorWithRed:126 /255.0 green:126 /255.0 blue:126 /255.0 alpha:1];
        config.titleColorSelected = [UIColor colorWithRed:9 / 255.0 green:165 / 255.0 blue:90 / 255.0 alpha:1];;
        config.font = [UIFont boldSystemFontOfSize:11];
    }];

    // 自定义导航条
    NXTabBar *tabBar = [[NXTabBar alloc] init];
    [tabBar setCenterIcon:[UIImage zz_imageName:@"btnPlayerPlay" inBundle:ZFMResourceMain]];
    [tabBar setCenterIconClickBlock:^{
        NSLog(@"#### 点击我干嘛 ####");
    }];
    
    self.window.rootViewController = [[MainFrameworkAPI sharedInstance] rootTabBarControllerAndCustomTabBar:tabBar];
    
```

![](./images/img3.png)

**同样 可以更新导航的样式**

```
 // 更新系统nav样式
 [[MainFrameworkAPI sharedInstance] updateNavWithConfig:^(NavigationConfig *config) {
        config.globalBackgroundColor = [UIColor darkTextColor]; // 背景色
        config.titleColor = [UIColor whiteColor];
        config.titleFont = [UIFont boldSystemFontOfSize:20];
        config.itemFont = [UIFont systemFontOfSize:12];
        config.backIcon = [UIImage imageNamed:@"btnBackBold"]; // 设置返回icon
  }];
    
```
![](./images/img2.png)

## Installation

DNMainFramework is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DNMainFramework'
```

## Author

540563689@qq.com, zhengjia@donews.com

## License

DNMainFramework is available under the MIT license. See the LICENSE file for more info.
