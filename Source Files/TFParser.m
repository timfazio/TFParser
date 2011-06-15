//
//  TFParser.m
//  Psych Logic
//
//  Created by Timothy Fazio on 2/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TFParser.h"

// to call this class, use the following structure:
/*
 NSString *xmlAddress;
 NSArray *childArray;
 NSString *parent;
 
 xmlAddress = @"http://www.timfazio.com/tfparser/example.txt";
 childArray = [NSArray arrayWithObjects:@"clientid", @"userid", @"name", @"dob", nil];
 parent = @"client";
 self.myArray = [TFParser newXMLArray:xmlAddress forParent:parent withChildren:childArray];
 for (NSString *s in myArray) {
 NSLog(@"%@",s);
 }
 */

@implementation TFParser

+(NSMutableArray *)newXMLArray:(NSString *)XMLAddress forParent:(NSString *)parent withChildren:(NSArray *)childArray { 
    
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
	// Load and parse the xml file
	TBXML *tbxml = [[TBXML tbxmlWithURL:[NSURL URLWithString:XMLAddress]] retain];
    
	// Obtain root element
	TBXMLElement *root = tbxml.rootXMLElement;
	
	// if root element is valid
	if (root) {
		// search for the first "parent" within the root element's children
		TBXMLElement *parentItem = [TBXML childElementNamed:parent parentElement:root];
		// if a "parent" element was found
		while (parentItem != nil) {
			// instantiate a dictionary to hold "child" objects
            NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
            
            // search the parent for children
            for (NSString *child in childArray) { 
                
                TBXMLElement *childItem = [TBXML childElementNamed:child parentElement:parentItem];
                
				
				//add "children" to dictionary
                //try to remove quotations, not working
                /*
                 NSString *tempString = [NSString stringWithFormat:@"%@",[TBXML textForElement:childItem]];  
                 tempString = [tempString stringByReplacingOccurrencesOfString:@"\"" withString:@""];
                 NSLog(@"%@",tempString);
                 [tempDict setValue:tempString forKey:child];
                 */
                
                [tempDict setValue:[TBXML textForElement:childItem] forKey:child];
                
                // find the next sibling element
				childItem = [TBXML nextSiblingNamed:child searchFromElement:childItem];
			}
            
            //add dictionary to array
            [tempArray addObject:tempDict];
            [tempDict release];
			
			// find the next "parent" sibling element
			parentItem = [TBXML nextSiblingNamed:parent searchFromElement:parentItem];
		}			
	}
	
	// release resources
	[tbxml release];
    NSMutableArray *returnArray = [NSArray arrayWithArray:tempArray];
    [tempArray release];
    return returnArray;
}

@end
