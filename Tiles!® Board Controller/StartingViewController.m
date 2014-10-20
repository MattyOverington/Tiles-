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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)connectToArduinoButton:(id)sender {
    [self.controller.bleManager beginScanning];
}

@end
