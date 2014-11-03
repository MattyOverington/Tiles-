//
//  StartingViewController.m
//  Tiles!® Board Controller
//
//  Created by Tom Copcutt on 10/14/14.
//
//

#import "StartingViewController.h"

@interface StartingViewController ()



@end

@implementation StartingViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    GameTableViewController* destination = segue.destinationViewController;
    destination.controller = self.controller;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.controller = [[Controller alloc] init];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateView) userInfo:nil repeats:YES];
}

- (IBAction)connectToArduinoButton:(id)sender {
    [self.controller.bleManager beginScanning];
}

- (IBAction)disconnectFromDevice:(id)sender {
    [self.controller.bleManager disconnectFromDevice:self.controller.connectedDevice];
}

- (void) updateView {
    if (self.controller.isConnectedToBluno) {
        self.disconnectButton.enabled = YES;
        self.connectButton.enabled = NO;
    } else {
        self.disconnectButton.enabled = NO;
        self.connectButton.enabled = YES;
    }
}

@end
