#import "CCBlue.h"
#import <rootless.h> 

@interface BluetoothManager : NSObject
- (void)connectDevice:(id)device;
- (void)disconnectDevice:(id)device;
+ (id)sharedInstance;
- (NSArray *)pairedDevices;
@end

@interface BluetoothDevice
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *address;
- (void)connect;
- (void)disconnect;
@end

BOOL CCBlueEnabled = NO;

@implementation CCBlue

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

#define CCBLUE_PREFS ROOT_PATH_NS(@"/var/mobile/Library/Preferences/com.iosrouter.ccblue.prefs.plist") 

// Most third-party Control Center modules out there use non-CAML approach because it's easier to get icon images than create CAML
// Choose either CAML and non-CAML portion of the code for your final implementation of the toggle
// IMPORTANT: To prepare your icons and configure the toggle to its fullest, check out CCSupport Wiki: https://github.com/opa334/CCSupport/wiki

#pragma mark - CAML approach

// CAML descriptor of your module (.ca directory)
// Read more about CAML here: https://medium.com/ios-creatix/apple-make-your-caml-format-a-public-api-please-9e10ba126e9d
- (CCUICAPackageDescription *)glyphPackageDescription {
    return [CCUICAPackageDescription descriptionForPackageNamed:@"CCBlue" inBundle:[NSBundle bundleForClass:[self class]]];
}

#pragma mark - End CAML approach

#pragma mark - Non-CAML approach

// Icon of your module
- (UIImage *)iconGlyph {
    return [UIImage imageNamed:@"icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

// Optional: Icon of your module, once selected 
- (UIImage *)selectedIconGlyph {
    return [UIImage imageNamed:@"icon-selected" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

// Selected color of your module
- (UIColor *)selectedColor {
    return [UIColor whiteColor];
}

#pragma mark - End Non-CAML approach

// Current state of your module
- (BOOL)isSelected {
    return CCBlueEnabled;
}

- (void)setSelected:(BOOL)selected {
    NSLog(@"iosrouter %@", selected ? @"YES" : @"NO");
    if (CCBlueEnabled == NO) {
        NSMutableDictionary *prefs = [NSMutableDictionary dictionaryWithContentsOfFile:CCBLUE_PREFS];
        NSString *device = prefs[@"selectedDevice"];
        NSString *inArray = [device componentsSeparatedByString:@"("][1];
        inArray = [inArray stringByReplacingOccurrencesOfString:@")" withString:@""];
        int numb = [inArray intValue];
        Class BluetoothManager = NSClassFromString(@"BluetoothManager");
        id manager = [BluetoothManager sharedInstance];
        NSArray *connectedDevices = [manager pairedDevices];
        BluetoothDevice *deviceA = connectedDevices[numb];
        [deviceA connect];
        CCBlueEnabled = YES;

        
    } else {
        NSMutableDictionary *prefs = [NSMutableDictionary dictionaryWithContentsOfFile:CCBLUE_PREFS];
        NSString *device = prefs[@"selectedDevice"];
        NSString *inArray = [device componentsSeparatedByString:@"("][1];
        inArray = [inArray stringByReplacingOccurrencesOfString:@")" withString:@""];
        int numb = [inArray intValue];
        Class BluetoothManager = NSClassFromString(@"BluetoothManager");
        id manager = [BluetoothManager sharedInstance];
        NSArray *connectedDevices = [manager pairedDevices];
        BluetoothDevice *deviceA = connectedDevices[numb];
        [deviceA disconnect];
        CCBlueEnabled = NO;
    }
}



@end
