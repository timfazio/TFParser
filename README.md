A simple addition to TBXML to parse XML files, regardless of their tags.

Simply add the following files to your project:
- NSDataAdditions.h
- NSDataAdditions.m
- TBXML.h
- TBXML.m
- TFParser.h
- TFParser.m

Add the framework 
- lib.gylib

Import the parser file to your .m
- #import "TFParser.h"

Simply tell the parser where to obtain the file, and what elements to parse! Here's an example.

    NSString *xmlAddress;
    NSArray *childArray;
    NSString *parent;
    
    xmlAddress = @"http://www.timfazio.com/tfparser/example.xml";
    childArray = [NSArray arrayWithObjects:@"id", @"name", @"description", @"other", nil];
    parent = @"item";
    self.myArray = [TFParser newXMLArray:xmlAddress forParent:parent withChildren:childArray];
    for (NSString *s in myArray) {
        NSLog(@"%@",s);
    }

info@timfazio.com
