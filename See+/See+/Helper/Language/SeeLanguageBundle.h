//
//  SeeLanguageBundle.h
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (Language)

+ (nonnull NSString *)setLanguage:(nonnull NSString *)language;      // Returns the actually set language
+ (nonnull NSString *)language;
+ (nonnull NSArray *)allowedLanguages;

+ (BOOL)isCurrentLanguage:(NSString *)language;

@end
