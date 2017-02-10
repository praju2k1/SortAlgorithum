//
//  SortAlgorithum.m
//  SortAlgorithum
//
//  Created by Prajeesh Prabhakar on 2/8/17.
//  Copyright © 2017 Prajeesh Prabhakar. All rights reserved.
//

#import "SortAlgorithum.h"

@implementation SortAlgorithum

/********************************************************/
//Selection Sort
//Time completity -O(n^2)

/********************************************************/
-(NSArray * ) selectionSort:(NSMutableArray * ) array {
    
    for ( int i = 0 ; i < array.count-1; i++){
        for (int j = i + 1  ; j < array.count;j++ ){
            if ([array[i] intValue] > [array[j] intValue]) {
                NSNumber *temp = array[i];
                array[i] = array[j];
                array[j] = temp;
                
            }
            
        }
    }
    
    return  array;
}

-(NSArray * ) bubbleSort :(NSMutableArray * ) array {
 
    BOOL isSwitchElement = NO;
    for ( int i = 0 ; i < array.count-1; i++){
        for (int j = 0  ; j < array.count- i -1;j++ ){
         if ([array[j] intValue] < [array[j +1] intValue]) {
             NSNumber *temp = array[j];
             array[j] = array[j +1];
             array[j] = temp;
             isSwitchElement = YES;
             
         }
        
        }
        
        if(!isSwitchElement) break;
    }
    

    return  array;
}
/********************************************************/
//Insertion Sort
//Time completity -O(n^2)
// better than bubble and selection Sort
/********************************************************/

-(NSArray * ) insertionSort:(NSMutableArray *) array {
    for ( int i = 1 ; i < array.count; i++){
        for(int j = 0 ; j < i; j++ ){
            if (array[i] < array[j]){
                NSArray *temp = array [i];
                [array removeObjectAtIndex:i];
                [array insertObject:temp atIndex:j];
                
                
            }
        }
    }
    
    return array;
}
/********************************************************/
//Merge Sort
// - Divide and conqure
//- recursive
//-Stable
//-Not in-place sorting algoritum ( in the memory usage , Use extra amount of usage )

//Time completity -O(nLogn)
//Space complexity -O(n)
/********************************************************/

-(NSMutableArray *) mergeSortArray:(NSMutableArray *) array{
    
    if (array.count < 2) return array ;
    
    NSUInteger mid = array.count/2;
    
    NSRange leftArrayRange = NSMakeRange(0, mid);
    NSMutableArray *leftArray = [NSMutableArray arrayWithArray: [array subarrayWithRange:leftArrayRange]];
    
    NSRange rightArrayRange = NSMakeRange(mid ,(array.count - mid));
    NSMutableArray *rightArray = [NSMutableArray arrayWithArray:[array subarrayWithRange:rightArrayRange]];
    
    [self mergeSortArray: leftArray];
    [self mergeSortArray: rightArray];
    return [ self mergeSortWithLeft:leftArray right:rightArray toMainArray:array];
    
    
    
}

- (NSMutableArray *) mergeSortWithLeft:(NSMutableArray *)leftArray right:(NSMutableArray *)rightArray toMainArray:(NSMutableArray *)mainArray{
    
    NSUInteger  leftArrayCount = leftArray.count;
    NSUInteger  rightArrayCount = rightArray.count;
    NSUInteger leftArrayIndex = 0;
    NSUInteger rightArrayIndex = 0;
    NSUInteger mainArrayIndex = 0;
    
    while (leftArrayCount > leftArrayIndex &&  rightArrayCount > rightArrayIndex) {
        
        if ([leftArray[leftArrayIndex] intValue] >= [rightArray[rightArrayIndex] intValue]  ){
            
           
            mainArray[mainArrayIndex] = rightArray[rightArrayIndex];
            
            rightArrayIndex++;
        }
        else {
            mainArray[mainArrayIndex] = leftArray[leftArrayIndex];
            leftArrayIndex ++;
        }
        mainArrayIndex++;
    }
    
    while (leftArrayCount > leftArrayIndex)  {
        mainArray[mainArrayIndex] = leftArray[leftArrayIndex];
        leftArrayIndex ++;
        mainArrayIndex++;
    
    }
    while( rightArrayCount > rightArrayIndex){
        mainArray[mainArrayIndex] = rightArray[rightArrayIndex];
        
        rightArrayIndex ++;
        mainArrayIndex++;

        
    }
    return mainArray;
    
}

/********************************************************/
//quick Sort
// - Divide and conqure
//- recursive
//-Stable
// in-place sorting algoritum ( in the memory usage , use the same memory )

//Time completity best &Average -O(nLogn)
// worst - O(n^2)-But can be avoided using randomised verstion of pivot
//Space complexity best case-O(logn)
// worst case -O(n)-But can be avoided using randomised verstion of pivot

/********************************************************/

-(NSMutableArray *) quickSort:(NSMutableArray *) array startIndex:(NSUInteger)startIndex endIndex:(NSUInteger) endIndex {
    
    if ( startIndex < endIndex){
        NSUInteger partionIndex = [self partionIndex:array startIndex:startIndex endIndex:endIndex];
       array =  [self quickSort:array startIndex:startIndex endIndex:partionIndex-1];
       array =  [self quickSort:array startIndex:partionIndex+1 endIndex:endIndex];
        
        
    }
    return  array;
}


-(NSUInteger) partionIndex:(NSMutableArray *) array startIndex:(NSUInteger)startIndex endIndex:(NSUInteger) endIndex  {
    NSNumber *pivot = array[endIndex];
    NSUInteger pIndex = 0;
    for ( NSUInteger i =startIndex ;i< endIndex ; i++ ){
        if ([array[i] intValue]< [pivot intValue]  ){
            NSNumber *temp = array[pIndex];
            array[pIndex] = array[i];
            array[i] = temp;
            pIndex ++;
        }
    }
    NSNumber *temp = array[pIndex];
    array[pIndex] = array[endIndex];
    array[array.count - 1] = temp;
    
    return pIndex;
}

@end
