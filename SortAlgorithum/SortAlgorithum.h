//
//  SortAlgorithum.h
//  SortAlgorithum
//
//  Created by Prajeesh Prabhakar on 2/8/17.
//  Copyright © 2017 Prajeesh Prabhakar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SortAlgorithum : NSObject

-(NSArray * ) selectionSort:(NSMutableArray * ) array;
-(NSArray * ) bubbleSort :(NSMutableArray * ) array;
-(NSArray * ) insertionSort:(NSMutableArray *) array;
-(NSMutableArray *) mergeSortArray:(NSMutableArray *) array;
-(NSMutableArray *)quickSort:(NSMutableArray *) array startIndex:(NSUInteger)startIndex endIndex:(NSUInteger) endIndex;
@end
