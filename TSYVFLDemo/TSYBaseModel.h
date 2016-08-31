//
//  TSYBaseModel.h
//  TSYVFLDemo
//
//  Created by 陈余鹏 on 30/8/16.
//  Copyright © 2016年 taothinkrain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSYBaseModel : NSObject

/**
 *	@brief	初始化json字符串
 *	@param 	datas 将json字符串转换成 TSYBaseModel 类型
 */
-(id)initWithDataDic:(NSDictionary*)datas;

@end
