//
//  main.m
//  SortAlgorithum
//
//  Created by Prajeesh Prabhakar on 2/8/17.
//  Copyright © 2017 Prajeesh Prabhakar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SortAlgorithum.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
        
        NSMutableArray * array = [NSMutableArray arrayWithArray:@[@30,@20,@1,@50,@20,@10, @22,@32] ];
        SortAlgorithum *sortAlgorithum = [[SortAlgorithum alloc] init];
        NSArray * selectionSorted = [ sortAlgorithum selectionSort:array];
        NSLog(@"%@", selectionSorted );
        
        NSArray * bubbleSorted = [ sortAlgorithum bubbleSort:array];
        NSLog(@"%@", bubbleSorted );
        
        NSArray * insertionSort = [ sortAlgorithum insertionSort:array];
        NSLog(@"%@", insertionSort );
        
        NSMutableArray * mergeSort = [ sortAlgorithum mergeSortArray:array];
         NSLog(@"%@", mergeSort );
        
        NSMutableArray * quickSort = [ sortAlgorithum quickSort:array startIndex:0 endIndex:array.count -1];
        NSLog(@"%@", quickSort );



    
    
    }
    return 0;
}
