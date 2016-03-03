//
//  AOAColorfulViewController.h
//  ColectionView
//
//  Created by Akixe on 3/3/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AOAColor;
@interface AOAColorfulViewController : UICollectionViewController

- (id) initWithModel:(AOAColor *) model
              layout: (UICollectionViewLayout *) layout;
@end
