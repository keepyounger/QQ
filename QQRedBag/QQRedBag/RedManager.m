//
//  RedManager.m
//  autoGetRedEnv
//
//  Created by 李向阳 on 2016/11/8.
//
//

#import "RedManager.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JRSwizzle.h"

void injected_function(void);

__attribute((constructor)) void injected_function(){
    [[NSNotificationCenter defaultCenter] addObserver:[RedManager sharedManager]
                                             selector:@selector(appDidFinished)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}

@interface RedManager ()

@property (nonatomic, strong) NSMutableDictionary *settingInfo;

@end

@implementation RedManager

static RedManager *_manager = nil;

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[RedManager alloc] init];
    });
    return _manager;
}

- (void)saveSetting
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    if (docDir){
        NSString *path = [docDir stringByAppendingPathComponent:@"RedSettings.plist"];
        [self.settingInfo writeToFile:path atomically:YES];
    }
}

- (NSMutableDictionary *)settingInfo
{
    if (!_settingInfo) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docDir = [paths objectAtIndex:0];
        if (!docDir){
            return nil;
        }
        NSString *path = [docDir stringByAppendingPathComponent:@"RedSettings.plist"];
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
        if (!dict) {
            dict = [NSMutableDictionary dictionary];
        }
        _settingInfo = dict;
    }
    return _settingInfo;
}

- (void)appDidFinished
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [[NSBundle class] jr_swizzleMethod:@selector(infoDictionary) withMethod:@selector(xy_infoDictionary) error:nil];
        [[NSBundle class] jr_swizzleMethod:@selector(bundleIdentifier) withMethod:@selector(xy_bundleIdentifier) error:nil];
        
        Class class = objc_getClass("QQSettingsViewController");
        [class jr_swizzleMethod:@selector(viewDidLoad) withMethod:@selector(xy_viewDidLoad) error:nil];
        
        class = objc_getClass("QQMessageRecallModule");
        [class jr_swizzleMethod:@selector(handleRecallNotify:isOnline:) withMethod:@selector(xy_handleRecallNotify:isOnline:) error:nil];
        
//        class = objc_getClass("QIMService");
//        [class jr_swizzleMethod:@selector(postRegisteNotification:Object:userInfo:) withMethod:@selector(xy_postRegisteNotification:Object:userInfo:) error:nil];
        
        //QQChatViewTable
        class = objc_getClass("QQChatViewTable");
        [class jr_swizzleMethod:@selector(tableView:willDisplayCell:forRowAtIndexPath:) withMethod:@selector(xy_tableView:willDisplayCell:forRowAtIndexPath:) error:nil];
        
        [[UITouch class] jr_swizzleMethod:@selector(locationInView:) withMethod:@selector(xy_locationInView:) error:nil];

        [CLLocation jr_swizzleMethod:@selector(coordinate) withMethod:@selector(xy_coordinate) error:nil];
        
    });
}

- (void)setRedState:(NSString *)redState
{
    self.settingInfo[@"redState"] = redState;
}

- (NSString *)redState
{
    return self.settingInfo[@"redState"];
}

- (void)setSelfState:(NSString *)selfState
{
    self.settingInfo[@"selfState"] = selfState;
}

- (NSString *)selfState
{
    return self.settingInfo[@"selfState"];
}

- (void)setDelayRandomState:(NSString *)delayRandomState
{
    self.settingInfo[@"delayRandomState"] = delayRandomState;
}

- (NSString *)delayRandomState
{
    return self.settingInfo[@"delayRandomState"];
}

- (void)setDelayTime:(NSString *)delayTime
{
    self.settingInfo[@"delayTime"] = delayTime;
}

- (NSString *)delayTime
{
    return self.settingInfo[@"delayTime"];
}

- (void)setRevokeState:(NSString *)revokeState
{
    self.settingInfo[@"revokeState"] = revokeState;
}

- (NSString *)revokeState
{
    return self.settingInfo[@"revokeState"];
}

- (CLLocationCoordinate2D)location
{
    NSArray *array = [self.locationStr componentsSeparatedByString:@","];
    if (array.count>=2) {
        return CLLocationCoordinate2DMake([array[1] doubleValue], [array[0] doubleValue]);
    }
    return CLLocationCoordinate2DMake(0, 0);
}

- (void)setLocationStr:(NSString *)locationStr
{
    self.settingInfo[@"locationStr"] = locationStr;
}

- (NSString *)locationStr
{
    return self.settingInfo[@"locationStr"];
}

- (void)setLocationState:(NSString *)locationState
{
    self.settingInfo[@"locationState"] = locationState;
}

- (NSString *)locationState
{
    return self.settingInfo[@"locationState"];
}

@end
