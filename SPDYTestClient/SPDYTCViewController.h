@interface SPDYTCViewController : UIViewController<NSURLConnectionDelegate> {

	NSMutableData* _responseData;
	
	IBOutlet UITextView*							_textView;
	IBOutlet UIActivityIndicatorView* _activityIndicatorView;
	IBOutlet UIButton*                _button;

}

- (IBAction)makeSPDYRequest:(id)sender;

@end
