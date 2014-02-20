#import "SPDYTCViewController.h"
#import <CocoaSPDY/SPDYProtocol.h>

@interface SPDYTCViewController()

@end

@implementation SPDYTCViewController

- (void)viewDidLoad {
	[SPDYURLConnectionProtocol registerOrigin:@"https://spdy-test-server"];
	[_activityIndicatorView stopAnimating];
}

- (IBAction)makeSPDYRequest:(id)sender {
	_textView.text = @"";
	_button.enabled = NO;
	[_activityIndicatorView startAnimating];

	NSURLRequest*		 request    = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://spdy-test-server/api"]];
	NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	[connection start];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse*)response {
	_responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData*)data {
	[_responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection {
	_textView.text = [[NSString alloc] initWithData:_responseData encoding:NSUTF8StringEncoding];
	_textView.textColor = [UIColor blackColor];
	_button.enabled = YES;
	[_activityIndicatorView stopAnimating];
}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error {
	_textView.text = error.description;
	_textView.textColor = [UIColor redColor];
	_button.enabled = YES;
	[_activityIndicatorView stopAnimating];
}

@end
