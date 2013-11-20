//
//  APPViewController.m
//  CameraApp
//
//  Created by Rafael Garcia Leiva on 10/04/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "APPViewController.h"
#import <floopsdk/FloopSdk.h>

@interface APPViewController ()

@property (weak, nonatomic) IBOutlet UIButton *takePhotoButton;
@end

@implementation APPViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    BOOL hasCamera = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    self.takePhotoButton.enabled = hasCamera;
    
    if (!hasCamera)
    {
        NSLog(@"camera not available");
    }
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
}

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];

    
}

#pragma mark - Image Picker Controller delegate methods

- (UIImage*)putAMonkeyOnIt:(UIImage*)img
{
    UIImage *backgroundImage = img;
    UIImage *watermarkImage = [UIImage imageNamed:@"18-monkey-with-banana.png"];
    
    UIGraphicsBeginImageContext(backgroundImage.size);
    [backgroundImage drawInRect:CGRectMake(0, 0, backgroundImage.size.width, backgroundImage.size.height)];
    [watermarkImage drawInRect:CGRectMake(backgroundImage.size.width - watermarkImage.size.width, backgroundImage.size.height - watermarkImage.size.height, watermarkImage.size.width, watermarkImage.size.height)];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = [self putAMonkeyOnIt:chosenImage];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {

    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)share:(UIButton *)sender
{
    [self.aiView startAnimating];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [[FloopSdkManager sharedInstance] shareImage:self.imageView.image completion:^(FloopSharingResult* result, NSError *error) {
        NSLog(@"shareImage returned with %@, %@", result, error);
        [self.aiView stopAnimating];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}

@end
