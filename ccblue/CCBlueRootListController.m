#import <Foundation/Foundation.h>
#import "CCBlueRootListController.h"
#import <Preferences/PSSpecifier.h>

@interface BluetoothManager : NSObject
+ (id)sharedInstance;
- (NSArray *)pairedDevices;
@end


@implementation CCBlueRootListController : PSListController





-(void)viewDidLoad {
	[super viewDidLoad];

}

-(NSArray *)getBluetoothDevicesInList {
	NSMutableArray *devices = [NSMutableArray new];
	Class BluetoothManager = NSClassFromString(@"BluetoothManager");
	id manager = [BluetoothManager sharedInstance];
	NSArray *connectedDevices = [manager pairedDevices];
	for (id device in connectedDevices) {
		[devices addObject:[device name]];
	}
	return devices;
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
	return _specifiers;
}


@end
