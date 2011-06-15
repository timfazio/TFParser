//
//  TFParser.h
//  Psych Logic
//
//  Created by Timothy Fazio on 2/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"

@interface TFParser : NSObject {
    
}

+(NSMutableArray *)newXMLArray:(NSString *)XMLAddress forParent:(NSString *)parent withChildren:(NSArray *)childArray;
    
@end
