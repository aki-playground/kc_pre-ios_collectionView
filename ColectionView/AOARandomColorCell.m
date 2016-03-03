//
//  AOARandomColorCell.m
//  ColectionView
//
//  Created by Akixe on 3/3/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "AOARandomColorCell.h"

@interface AOARandomColorCell ()

@property (nonatomic) BOOL shouldAnimateChangeOfColor;

@end
@implementation AOARandomColorCell

-(void) awakeFromNib {
    self.shouldAnimateChangeOfColor = NO;
    //setuk KVO
    [self setupKVO];
}

-(void) prepareForReuse{
    [super prepareForReuse];
    self.shouldAnimateChangeOfColor = NO;
    self.color = [UIColor x11FloralWhiteColor];
}
-(void) dealloc {
    
    [self tearDownKVO];
}


#pragma mark - KVO
- (void) setupKVO{
    [self addObserver: self
           forKeyPath: @"color"
              options: NSKeyValueObservingOptionNew
              context: NULL];
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    self.hexView.text = [self.color hexString];
    
    float duration = 0.0f;
    if (self.shouldAnimateChangeOfColor){
        duration = 0.6f;
    }
    [UIView animateWithDuration:duration
                     animations:^{
                         self.backgroundColor = self.color;
                         self.hexView.textColor = [self.color contrastingTextColor];
                     }];
    self.shouldAnimateChangeOfColor = YES;
}

-(void) tearDownKVO {
    [self removeObserver:self forKeyPath:@"color"];
}



@end
