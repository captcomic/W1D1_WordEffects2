//
//  main.m
//  WordEffects2
//
//  Created by Fariha on 6/4/18.
//  Copyright © 2018 Bootcamp. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        char inputChars[255];
 
        while (YES) {

            printf("\nInput a number (1-6): ");

            // limit input to one character
            fgets(inputChars, 255, stdin);
            
            int operationCode = atoi(inputChars);

            printf("Input a string: ");

            // limit input to 255 characters
            fgets(inputChars, 255, stdin);
            
            // print as a c string
            printf("Your string is %s", inputChars);
            
            
            // convert char array to an NSString object
            NSString *inputString = [[NSString stringWithUTF8String:inputChars] substringToIndex:strlen(inputChars) - 1];
            
            // print NSString object
            // NSLog(@"Input value: %@", inputString);
            // NSLog(@"Input memory address: %p", inputString);
            
            
            NSString *inputStringModified;
            NSString *inputStringLastCharacter;

            NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
            numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
            NSNumber *number;
            
            switch(operationCode) {
                    
                case 1  :
                    inputStringModified = [inputString uppercaseString];
                    break;
                    
                case 2  :
                    inputStringModified = [inputString lowercaseString];
                    break;
                    
                case 3:
                    number = [numberFormatter numberFromString:inputString];
                    
                    if (number) {
                        inputStringModified = inputString;
                    } else {
                        inputStringModified = @"Invalid number";
                    }
                    break;
                    
                case 4:
                    inputStringModified = [inputString stringByAppendingString:@", eh?"];
                    break;
                    
                case 5:
                    inputStringLastCharacter = [inputString substringFromIndex:[inputString length] - 1];
                    //NSLog(@"%@", inputStringLastCharacter);
                    
                    if ([inputStringLastCharacter isEqualToString:@"?"]) {
                        inputStringModified = @"I don't know...";
                    } else if ([inputStringLastCharacter isEqualToString:@"!"]) {
                        inputStringModified = @"Whoa, calm down!";
                    }
                    break;
                    
                case 6 :
                    inputStringModified = [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
                    break;
                    
                default :
                    NSLog(@"Invalid operation");
            }
            
            if (inputStringModified) {
                NSLog(@"%@", inputStringModified);
            }
        }
    }
    return 0;
}
