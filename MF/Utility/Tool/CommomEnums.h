//
//  CommomEnums.h
//  meiliyouyue
//
//  Created by EterNa1ove、 on 16/10/7.
//  Copyright © 2016年 Monster.Z. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  商品分类枚举
 */
typedef NS_ENUM(NSInteger, GoodsClassifyType){
    /**
     *  分类主页
     */
    Classify_Main = 1,
    
    /**
     *  分类子页
     */
    Classify_Sub,
    
};

/**
 *  购物车进口枚举
 */
typedef NS_ENUM(NSInteger, ShoppingCartType){
    /**
     *  tabbar入口
     */
    ShoppingCart_Main = 1,
    
    /**
     *  其他页面进入购物车入口枚举
     */
    ShoppingCart_Other,
    
};


/**
 *  刷新状态
 */
typedef NS_ENUM(NSInteger, RefreshStatus){
    /**
     *  下拉刷新
     */
    RefreshStatusPullDown = 0,
    /**
     *  上拉刷新
     */
    RefreshStatusPullUp,
    /**
     *  加载
     */
    RefreshStatusLoading
};
/**
 *  是否是购买还是加入购物车
 */
typedef NS_ENUM(NSInteger, DYBuynowType){
    /**
     *  加入购物车
     */
    DYAddShoppingCartType = 0,
    
    /**
     *  购买
     */
    DYPurchaseType
    
};
/**
 *  配送方式和收货时间
 */
typedef NS_ENUM(NSInteger, DYDeliveryOrTakeDeliveryTime){
    /**
     *  配送方式
     */
    DYDeliveryType = 0,
    
    /**
     * 收货时间
     */
    DYTakeDeliveryTimeType
    
};
/**
 *  编辑地址或增加地址枚举
 */
typedef NS_ENUM(NSInteger, DYRechargeOrWithdrawType){
    /**
     *  充值
     */
    DYRechargeType = 0,
    
    /**
     *  提现
     */
    DYWithdrawType
    
};
/**
 *  编辑地址或增加地址枚举
 */
typedef NS_ENUM(NSInteger, DYEditOrAddAddressType){
    /**
     *  添加地址
     */
    DYAddAddressType = 0,
    
    /**
     *  忘记密码
     */
    DYEditAddressType
    
};

/**
 *  编辑地址或增加地址枚举
 */
typedef NS_ENUM(NSInteger, FootprintAndCollectType){
    /**
     *  添加地址
     */
    FootprintType = 0,
    
    /**
     *  忘记密码
     */
    CollectType
    
};

/**
 *  商品分类枚举
 */
typedef NS_ENUM(NSInteger, ButtonTagIndex){
    /**
     *  确认收货
     */
    Confirm_Goods = 1,
    
    /**
     *  联系客服
     */
    Contact_Service,
    
    /**
     *  隐藏订单
     */
    Hidden_Order,
    
    /**
     *  评价
     */
    Order_Evaluation,
    
    /**
     *  待发货
     */
    Not_SendGoods,
    
    /**
     *  待评价
     */
    Not_Evaluation,
    
    /**
     *  已关闭
     */
    Is_Close,
    
    /**
     *  申诉订单
     */
    Complaint_Order,
    
};
/**
 *  积分日志枚举
 */
typedef NS_ENUM(NSInteger, PointLogType){
    /**
     *  可用积分
     */
    UsablePoint = 0,
    
    /**
     *  忘记密码
     */
    InactivePoint
    
};


/**
 公用枚举类
 */
@interface CommomEnums : UIView

@end
