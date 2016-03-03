//
//  AOARandomColorCell.m
//  ColectionView
//
//  Created by Akixe on 3/3/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "AOARandomColorCell.h"

@implementation AOARandomColorCell

-(void) awakeFromNib {
    //setuk KVO
    [self setupKVO];
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
    
    [UIView animateWithDuration:0.6 animations:^{
        self.backgroundColor = self.color;
        self.hexView.textColor = [self.color contrastingTextColor];
    }];
}

-(void) tearDownKVO {
    [self removeObserver:self forKeyPath:@"color"];
}



@end
