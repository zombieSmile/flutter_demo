#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "NewViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    // 获取FlutterViewController(是应用程序的默认Controller)
    FlutterViewController *controller = (FlutterViewController *)self.window.rootViewController;
    
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navigationController;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.window makeKeyAndVisible];
    
    // 获取MethodChannel(方法通道)
    FlutterMethodChannel *gotoNewPageChannel = [FlutterMethodChannel methodChannelWithName:@"test/gotoNewPage" binaryMessenger:controller.binaryMessenger];
    
    // 监听方法调用(会调用传入的回调函数)
    [gotoNewPageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([@"gotoNewPage" isEqualToString:call.method]) {
            NewViewController *newController = [[NewViewController alloc] init];
            [self.navigationController pushViewController:newController animated:YES];
            result(@YES);
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];
    
    
    
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
