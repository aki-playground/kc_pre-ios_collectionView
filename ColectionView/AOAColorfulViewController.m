//
//  AOAColorfulViewController.m
//  ColectionView
//
//  Created by Akixe on 3/3/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "AOAColorfulViewController.h"
#import "AOAColor.h"
#import "AOARandomColorCell.h"
@interface AOAColorfulViewController ()

@property (strong, nonatomic) AOAColor *model;
@property (nonatomic) NSInteger maxRandomColorToDisplay;
+(NSString *) randomColorCellId;
+(NSString *) gradientColorCellId;
+(NSString *) sectionHeaderId;

+(NSInteger) maxGradientColorsToDisplay;
+(NSUInteger) randomColorSection;
+(NSUInteger) gradientColorSection;
@end

@implementation AOAColorfulViewController

static NSString * const reuseIdentifier = @"Cell";


#pragma mark - Class methods
+(NSString *)randomColorCellId{
    return @"randomColorCell";
}
+(NSString *)gradientColorCellId{
    return @"gradientColorCell";
}
+(NSString *)sectionHeaderId{
    return @"sectionHeader";
}
+(NSInteger) maxGradientColorsToDisplay{
    return 104;
}
+(NSUInteger) randomColorSection{
    return 0;
}
+(NSUInteger) gradientColorSection{
    return 1;
}


#pragma mark - init
- (id) initWithModel:(AOAColor *) model
              layout: (UICollectionViewLayout *) layout{
    
    if(self = [super initWithCollectionViewLayout:layout]){
        _model = model;
        self.title = @"Colorful Collection View";
        _maxRandomColorToDisplay = 104;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    
    [self registerRandomColorCell];
    [self registerGradientColorCell];
    [self registerSectionHeaderCell];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *addColor = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewRandomColor:)];
    self.navigationItem.rightBarButtonItem = addColor;
}

#pragma mark - Utils
-(void) registerRandomColorCell
{
    [self.collectionView registerClass: [UICollectionViewCell class]
            forCellWithReuseIdentifier: [AOAColorfulViewController randomColorCellId]];
}

-(void) registerGradientColorCell
{
    [self.collectionView registerClass: [UICollectionViewCell class]
            forCellWithReuseIdentifier: [AOAColorfulViewController gradientColorCellId]];
}

-(void) registerSectionHeaderCell
{
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[AOAColorfulViewController sectionHeaderId]];
}
#pragma mark - Data Source
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}


- (NSInteger) collectionView: (UICollectionView *)collectionView
      numberOfItemsInSection: (NSInteger)section
{
    if(section == [AOAColorfulViewController randomColorSection]){
        return [self maxRandomColorToDisplay];
    } else {
        return [AOAColorfulViewController maxGradientColorsToDisplay];
    }
}

-(UICollectionViewCell *) collectionView: (UICollectionView *)collectionView
                  cellForItemAtIndexPath: (NSIndexPath *)indexPath{

    UICollectionViewCell *cell;
    if(indexPath.section == [AOAColorfulViewController randomColorSection]){
        cell = [collectionView dequeueReusableCellWithReuseIdentifier: [AOAColorfulViewController randomColorCellId]
                                                         forIndexPath: indexPath];
        cell.backgroundColor = [self.model randomColor];
        
    } else {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier: [AOAColorfulViewController gradientColorCellId]
                                                         forIndexPath: indexPath];
        cell.backgroundColor = [self.model colorInGradientAt:indexPath.item to:[AOAColorfulViewController maxGradientColorsToDisplay]];
    }
    
    return cell;
}

-(UICollectionReusableView *) collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *supView;
    if(kind == UICollectionElementKindSectionHeader){
        //Reciclamos un header, lo configuramos y lo devolvemos
        
        supView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[AOAColorfulViewController sectionHeaderId] forIndexPath:indexPath];
        
        supView.backgroundColor = [UIColor blackColor];
        for (UIView *view in supView.subviews){
            [view removeFromSuperview];
        }
        UILabel *title = [[UILabel alloc] initWithFrame:supView.bounds];
        title.textColor = [UIColor whiteColor];
        
        [supView addSubview:title];

        if(indexPath.section == [AOAColorfulViewController randomColorSection]){
            title.text = @"Random";
        } else {
            title.text = @"Gradient";
        }
    }
    return supView;
}

#pragma mark - Actions
-(void) addNewRandomColor: (id) sender {
    self.maxRandomColorToDisplay = self.maxRandomColorToDisplay +1;
    [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:[AOAColorfulViewController randomColorSection]]]];
}
#pragma mark - Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

