//
//  AOARandomColorCell.h
//  ColectionView
//
//  Created by Akixe on 3/3/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+Colorful.h"

@interface AOARandomColorCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *hexView;
@property (strong, nonatomic) UIColor * color;
@end
