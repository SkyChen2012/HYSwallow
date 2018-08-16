//
//  HeroinRequest.h
//  HeroinNetWorking
//
//  Created by Benson on 2018/8/15.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "HeroinBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const HeroinRequestCacheErrorDomain;

NS_ENUM(NSInteger) {
    HeroinRequestCacheErrorExpired = -1,
    HeroinRequestCacheErrorVersionMismatch = -2,
    HeroinRequestCacheErrorSensitiveDataMismatch = -3,
    HeroinRequestCacheErrorAppVersionMismatch = -4,
    HeroinRequestCacheErrorInvalidCacheTime = -5,
    HeroinRequestCacheErrorInvalidMetadata = -6,
    HeroinRequestCacheErrorInvalidCacheData = -7,
    };
    
    ///  HeroinRequest is the base class you should inherit to create your own request class.
    ///  Based on HeroinBaseRequest, HeroinRequest adds local caching feature. Note download
    ///  request will not be cached whatsoever, because download request may involve complicated
    ///  cache control policy controlled by `Cache-Control`, `Last-Modified`, etc.
@interface HeroinRequest : HeroinBaseRequest

///  Whether to use cache as response or not.
///  Default is NO, which means caching will take effect with specific arguments.
///  Note that `cacheTimeInSeconds` default is -1. As a result cache data is not actually
///  used as response unless you return a positive value in `cacheTimeInSeconds`.
///
///  Also note that this option does not affect storing the response, which means response will always be saved
///  even `ignoreCache` is YES.
@property (nonatomic) BOOL ignoreCache;

///  Whether data is from local cache.
- (BOOL)isDataFromCache;

///  Manually load cache from storage.
///
///  @param error If an error occurred causing cache loading failed, an error object will be passed, otherwise NULL.
///
///  @return Whether cache is successfully loaded.
- (BOOL)loadCacheWithError:(NSError * __autoreleasing *)error;

///  Start request without reading local cache even if it exists. Use this to update local cache.
- (void)startWithoutCache;

///  Save response data (probably from another request) to this request's cache location
- (void)saveResponseDataToCacheFile:(NSData *)data;

#pragma mark - Subclass Override

///  The max time duration that cache can stay in disk until it's considered expired.
///  Default is -1, which means response is not actually saved as cache.
- (NSInteger)cacheTimeInSeconds;

///  Version can be used to identify and invalidate local cache. Default is 0.
- (long long)cacheVersion;

///  This can be used as additional identifier that tells the cache needs updating.
///
///  @discussion The `description` string of this object will be used as an identifier to verify whether cache
///              is invalid. Using `NSArray` or `NSDictionary` as return value type is recommended. However,
///              If you intend to use your custom class type, make sure that `description` is correctly implemented.
- (nullable id)cacheSensitiveData;

///  Whether cache is asynchronously written to storage. Default is YES.
- (BOOL)writeCacheAsynchronously;

@end
    
NS_ASSUME_NONNULL_END

