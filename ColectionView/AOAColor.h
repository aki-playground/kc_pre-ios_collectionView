//
//  AOAColor.h
//  ColectionView
//
//  Created by Akixe on 3/3/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AOAColor : NSObject


-(UIColor *) randomColor;
-(UIColor *) colorInGradientAt:(NSUInteger) current
                            to:(NSUInteger) maximum;
@end
