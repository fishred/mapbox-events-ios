#import "AppDelegate.h"

@import MapboxMobileEvents;

@interface AppDelegate ()
@property(nonatomic,retain) CLLocationManager *locationManager;
@end

#pragma mark -

@implementation AppDelegate


- (void)leaksTest {
    self.locationManager  = [[CLLocationManager alloc] init];
    [self.locationManager requestAlwaysAuthorization];
    // Do any additional setup after loading the view.
    [MMEEventsManager.sharedManager initializeWithAccessToken:@"pk.eyJ1IjoicmNsZWVkZXYiLCJhIjoiY2plaXFraWZ5MXFsejJxbGloZjJ0NGxrbiJ9.7hPRHHLNZLEhREJ963veeQ" userAgentBase:@"rcleetest" hostSDKVersion:@"0.0.0"];
    MMEEventsManager.sharedManager.baseURL = [NSURL URLWithString:@"https://api-events-staging.tilestream.net"];
    [MMEEventsManager.sharedManager sendTurnstileEvent];
    MMEEventsManager.sharedManager.skuId = @"00";
    [MMEEventsManager.sharedManager flush];


    [MMEEventsManager.sharedManager initializeWithAccessToken:@"pk.eyJ1IjoicmNsZWVkZXYiLCJhIjoiY2plaXFraWZ5MXFsejJxbGloZjJ0NGxrbiJ9.7hPRHHLNZLEhREJ963veeQ" userAgentBase:@"rcleetest" hostSDKVersion:@"0.0.0"];
    MMEEventsManager.sharedManager.baseURL = [NSURL URLWithString:@"https://api-events-staging.tilestream.net"];
    [MMEEventsManager.sharedManager sendTurnstileEvent];
    MMEEventsManager.sharedManager.skuId = @"00";
    [MMEEventsManager.sharedManager flush];
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if ([NSProcessInfo.processInfo.arguments containsObject:@"-leaks"]) {
        [self leaksTest];
    }

    return YES;
}

@end
