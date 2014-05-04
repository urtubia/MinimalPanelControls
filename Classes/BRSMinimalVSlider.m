#import "BRSMinimalVSlider.h"

@implementation BRSMinimalVSlider

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        _sliderBackgroundColor = [UIColor lightGrayColor];
        _sliderFillColor = [UIColor darkGrayColor];
        _value = 0.5;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	int width = self.bounds.size.width;
	int height = self.bounds.size.height;
    
    CGContextSetFillColorWithColor(context, self.sliderBackgroundColor.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, width, height));
    
    double sliderStartHeight = (1 - self.value) * height;
    double sliderHeight = self.value * height;
    
    CGContextSetFillColorWithColor(context, self.sliderFillColor.CGColor);
    CGContextFillRect(context, CGRectMake(0, sliderStartHeight, width, sliderHeight));
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch
					 withEvent:(UIEvent *)event
{
	CGPoint p = [touch locationInView:self];
    self.value = (1 - (p.y / self.bounds.size.height));
	return YES;
}
- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint p = [touch locationInView:self];
    self.value = (1 - (p.y / self.bounds.size.height));
    return YES;
}

-(void) endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint p = [touch locationInView:self];
    self.value = (1 - (p.y / self.bounds.size.height));
}

-(void) setValue:(float) newValue
{
    _value = newValue;
    if(_value < 0) _value = 0;
    if(_value > 1) _value = 1;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    [self setNeedsDisplay];
}

@end