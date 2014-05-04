#import "BRSMinimalKnob.h"

@interface BRSMinimalKnob()
@property (nonatomic) float touchDownValue;
@property (nonatomic) float touchDownY;
@end

@implementation BRSMinimalKnob

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        _backgroundColor = [UIColor whiteColor];
        _knobBackgroundColor = [UIColor lightGrayColor];
        _knobFillColor = [UIColor darkGrayColor];
        _value = 0.5;
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	int width = self.bounds.size.width;
	int height = self.bounds.size.height;
	
    int knobMargin = 2;
	CGRect knobRect = CGRectMake(knobMargin, knobMargin, width - 2 * knobMargin, height - 2 * knobMargin);
	
	int knobRectCenterX = knobRect.size.width / 2 + knobRect.origin.x;
	int knobRectCenterY = knobRect.size.height / 2 + knobRect.origin.y;
    
    CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);
    CGContextFillRect(context, self.bounds);

	CGContextSetFillColorWithColor(context, self.knobBackgroundColor.CGColor);
	CGContextBeginPath(context);
	CGContextAddArc(context, knobRectCenterX, knobRectCenterY, knobRect.size.width / 2, (2 * M_PI) / 3, (M_PI)/ 3, 0);
	CGContextAddArc(context, knobRectCenterX, knobRectCenterY, knobRect.size.width / 3.5, (M_PI)/ 3, (2 * M_PI) / 3, 1);
	CGContextClosePath(context);
	CGContextFillPath(context);
	
    CGContextSetFillColorWithColor(context, self.knobFillColor.CGColor);

	CGContextBeginPath(context);
	
    float endAngle = (((14 * M_PI / 6) - (2 * M_PI / 3)) * _value) + (2 * M_PI / 3);
	CGContextAddArc(context, knobRectCenterX, knobRectCenterY, knobRect.size.width / 2, (2 * M_PI) / 3, endAngle, 0);
	CGContextAddArc(context, knobRectCenterX, knobRectCenterY, knobRect.size.width / 3.2, endAngle, (2 * M_PI) / 3, 1);
	CGContextClosePath(context);
	CGContextFillPath(context);
    
    CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);
    CGContextBeginPath(context);
    CGContextAddArc(context, knobRectCenterX, knobRectCenterY, knobRect.size.width / 3.2, 0, 2 * M_PI, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch
					 withEvent:(UIEvent *)event
{
	CGPoint p = [touch locationInView:self];
    _touchDownY = p.y;
    _touchDownValue = _value;
	return YES;
	
}

-(void) endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint p = [touch locationInView:self];
    self.value = _touchDownValue + ((_touchDownY - (double)p.y) / 700);
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint p = [touch locationInView:self];
    self.value = _touchDownValue + ((_touchDownY - (double)p.y) / 700);
	
	[self setNeedsDisplay];
	
	return YES;
}

-(void) setValue:(float) newValue {
    _value = newValue;
    if(_value <= 0) _value = 0.0000001;
	if(_value >= 1) _value = 1;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    [self setNeedsLayout];
}

- (void)dealloc {
    
}


@end
