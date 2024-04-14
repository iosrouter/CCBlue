#import <Foundation/Foundation.h>
#import "CCBlueItemsController5.h"
#import <Preferences/PSSpecifier.h>
#import <rootless.h>
#import <UIKit/UIKit.h>

#define CCBLUE_PREFS ROOT_PATH_NS(@"/var/mobile/Library/Preferences/com.iosrouter.ccblue.prefs.plist") 

@interface BluetoothManager : NSObject
+ (id)sharedInstance;
- (NSArray *)pairedDevices;
@end

@interface BluetoothDevice
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *address;
@end

@implementation CCBlueItemsController5

-(NSArray *)getBluetoothDevicesInList {
	NSMutableArray *devices = [NSMutableArray new];
	Class BluetoothManager = NSClassFromString(@"BluetoothManager");
	id manager = [BluetoothManager sharedInstance];
	NSArray *connectedDevices = [manager pairedDevices];
    for (int i = 0; i < connectedDevices.count; i++) {
        BluetoothDevice *device = connectedDevices[i];
        NSString *deviceNameAndAddress = [NSString stringWithFormat:@"%@ (%d)", [device name], i];
        [devices addObject:deviceNameAndAddress];
    }
	//for (BluetoothDevice *device in connectedDevices) {
    //    NSString *deviceNameAndAddress = [NSString stringWithFormat:@"%@ (%@)", [device name], [device address]];
	//	[devices addObject:deviceNameAndAddress];
	//}
	return devices;
}

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)deviceTapped:(PSSpecifier *)specifier {
    NSMutableDictionary *prefs = [NSMutableDictionary dictionaryWithContentsOfFile:CCBLUE_PREFS];
    NSString *device = specifier.name;
    prefs[@"selectedDevice5"] = device;
    [prefs writeToFile:CCBLUE_PREFS atomically:YES];
    [self reloadSpecifiers];
    // Send UIAlert to user
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Device selected" message:[NSString stringWithFormat:@"You have selected %@", device] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
}



-(NSArray *)specifiers {
    @try {
        if (![[NSFileManager defaultManager] fileExistsAtPath:CCBLUE_PREFS]) {
            NSMutableDictionary *prefs = [NSMutableDictionary new];
            prefs[@"selectedDevice5"] = @"";
            [prefs writeToFile:CCBLUE_PREFS atomically:YES];
        }
    } @catch (NSException *exception) {
        NSLog(@"iosrouter Error: %@", exception);
    }
	if (!_specifiers) {
        NSMutableArray *specifiers = [NSMutableArray new];
        NSArray *devices = [self getBluetoothDevicesInList];
        for (NSString *device in devices) {
            NSString *deviceSelected = [NSDictionary dictionaryWithContentsOfFile:CCBLUE_PREFS][@"selectedDevice5"];
            if ([device isEqualToString:deviceSelected]) {
                PSSpecifier *specifier = [PSSpecifier preferenceSpecifierNamed:[NSString stringWithFormat:@"(✔) %@", device] target:self set:NULL get:NULL detail:NULL cell:PSButtonCell edit:NULL];
                specifier->action = @selector(deviceTapped:);
                [specifiers addObject:specifier];
            }else {
                PSSpecifier *specifier = [PSSpecifier preferenceSpecifierNamed:device target:self set:NULL get:NULL detail:NULL cell:PSButtonCell edit:NULL];
                specifier->action = @selector(deviceTapped:);
                [specifiers addObject:specifier];
            }
        }
        _specifiers = specifiers;
	}

	return _specifiers;
}

@end