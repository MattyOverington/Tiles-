//
//  StartingViewController.h
//  Tiles!® Board Controller
//
//  Created by Tom Copcutt on 10/14/14.
//
//

#import <UIKit/UIKit.h>
#import "Controller.h"
#import "GameTableViewController.h"

@interface StartingViewController : UIViewController

@property Controller* controller;

- (IBAction)connectToArduinoButton:(id)sender;
- (IBAction)disconnectFromDevice:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *connectionInfoLabel;
@property (weak, nonatomic) IBOutlet UIButton *disconnectButton;
@property (weak, nonatomic) IBOutlet UIButton *connectButton;


@end
