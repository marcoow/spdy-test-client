@interface SPDYTCViewController : UIViewController {

	IBOutlet UITextView*							textView;
	IBOutlet UIActivityIndicatorView* activityIndicatorView;

}

- (IBAction)makeSPDYRequest:(id)sender;

@end
