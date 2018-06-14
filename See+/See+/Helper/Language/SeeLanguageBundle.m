//
//  SeeLanguageBundle.m
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

#import "SeeLanguageBundle.h"

#import <objc/runtime.h>

static NSString *__forcedLanguage;

static char const * const kBundleCustomKey = "kBundleCustomKey";
static NSString * const kEnglishBundleName = @"en";
static char const * const kBundleFallbackCustomKey = "kBundleFallbackCustomKey";

@implementation NSBundle (Language)

#pragma mark - Setter

+ (NSString *)setLanguage:(NSString*)language {
    // Replace localizedStringForKey by forcedLanguagelocalizedStringForKey
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_exchangeImplementations(class_getInstanceMethod(self.class, @selector(localizedStringForKey:value:table:)),
                                       class_getInstanceMethod(self.class, @selector(forcedLanguageLocalizedStringForKey:value:table:)));
    });
    
    // Filter language
    NSString *newLanguage = language;
    if (newLanguage == nil || newLanguage.length == 0)
        newLanguage = [[[NSLocale preferredLanguages] objectAtIndex:0] componentsSeparatedByString:@"-"][0];
    if (![self.allowedLanguages containsObject:newLanguage])
        newLanguage = self.allowedLanguages.firstObject;
    
    if (![newLanguage isEqualToString:__forcedLanguage]) {
        for (NSBundle *bundle in [NSBundle allBundles])
            objc_setAssociatedObject(bundle, kBundleCustomKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        __forcedLanguage = newLanguage;
        
        NSLog(@"Language set : %@", __forcedLanguage);
    }
    
    return __forcedLanguage;
}

#pragma mark - Getter

+ (NSString *)language {
    if (!__forcedLanguage)
        __forcedLanguage = [self setLanguage:@""];
    return __forcedLanguage;
}

#pragma mark - Authorization languages

+ (NSArray *)allowedLanguages {
    return @[@"en", @"fr"];
}

#pragma mark - Helpers

+ (BOOL)isCurrentLanguage:(NSString *)language {
    return [[NSBundle language] isEqualToString:language];
}

#pragma mark - Method swizzling

- (NSString*)forcedLanguageLocalizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
    
    NSString *localizedString;
    
    // We try to find a "subbundle" corresponding to the forced language
    if (!objc_getAssociatedObject(self, kBundleCustomKey)) {
        NSString *forcedLanguage = __forcedLanguage;
        objc_setAssociatedObject(self, kBundleCustomKey, [NSBundle bundleWithPath:[self pathForResource:forcedLanguage ofType:@"lproj"]], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    // We try to find a "subbundle" corresponding to the fallback language
    if (!objc_getAssociatedObject(self, kBundleFallbackCustomKey))
        objc_setAssociatedObject(self, kBundleFallbackCustomKey, [NSBundle bundleWithPath:[self pathForResource:[NSBundle allowedLanguages].firstObject ofType:@"lproj"]], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // forcedLanguage selector is pointing to the classic method's implementation
    localizedString = [objc_getAssociatedObject(self, kBundleCustomKey) forcedLanguageLocalizedStringForKey:key value:value table:tableName];
    
    // if the key doesn't exist in the forcedLanguage
    if ([localizedString isEqualToString:key])
        localizedString = [objc_getAssociatedObject(self, kBundleFallbackCustomKey) forcedLanguageLocalizedStringForKey:key value:value table:tableName];
    
    if (!localizedString)
        localizedString = [self forcedLanguageLocalizedStringForKey:key value:value table:tableName];
    
    return localizedString;
}

@end
