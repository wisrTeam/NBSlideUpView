#import "NBSlideUpView.h"
#import "NBSlideUpViewSampleContentView.h"
#import "NBViewController.h"

@interface NBViewController () <NBSlideUpViewSampleContentViewDelegate>

@property (nonatomic, strong) NBSlideUpView *slideUpView;

@end

@implementation NBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.slideUpView = [[NBSlideUpView alloc] initWithSuperview:self.view viewableHeight:200];
    self.slideUpView.delegate = self;
    
    NBSlideUpViewSampleContentView *sampleContentView = [[NBSlideUpViewSampleContentView alloc] initWithDelegate:self];
    [self.slideUpView.contentView addSubview:sampleContentView];
}

- (IBAction)animateIn:(id)sender {
    [self.slideUpView animateIn];
}

#pragma mark - NBSlideUpViewDelegate

- (void)slideUpViewDidAnimateIn:(UIView *)slideUpView {
    NSLog(@"NBSlideUpView animated in.");
}

- (void)slideUpViewDidAnimateOut:(UIView *)slideUpView {
    NSLog(@"NBSlideUpView animated out.");
}

- (void)slideUpViewDidAnimateRestore:(UIView *)slideUpView {
    NSLog(@"NBSlideUpView animated restore.");
}

#pragma mark - NBSlideUpViewSampleContentViewDelegate

- (void)slideUpViewSampleContentViewDidRequestAnimateOut:(NBSlideUpViewSampleContentView *)slideUpViewSampleContentView {
    [self.slideUpView animateOut];
}

@end
