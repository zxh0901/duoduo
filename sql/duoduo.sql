/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : duoduo

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-04-21 23:23:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `collects`
-- ----------------------------
DROP TABLE IF EXISTS `collects`;
CREATE TABLE `collects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `gid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collects
-- ----------------------------
INSERT INTO `collects` VALUES ('1', 'zxh', '1');
INSERT INTO `collects` VALUES ('2', 'zxh', '2');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `paystyle` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `gdesc` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'sj',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '小米5X 变焦双摄', 'phone1.jpg', '127', '90新', '广东省广州市', '13232060901', '在线交易', 'phone', 'zxh', '昆山附近出小米9 等各种颜色手机，包括iPhone，华为，一加，OPPO，vivo等等各种型号。', '已上架');
INSERT INTO `goods` VALUES ('2', '小米电视4A 55英寸', 'tv2.jpg', '127', '95新', '广东省广州市', '13232060901', '在线交易', 'jd', 'zxh', '感兴趣的话给我留言吧！', '已上架');
INSERT INTO `goods` VALUES ('3', '九号平衡车', '9phc.jpg', '127', '85新', '广东省广州市', '13232060901', '在线交易', 'yd', 'lsm', '感兴趣的话给我留言吧！', '已上架');
INSERT INTO `goods` VALUES ('4', '米家wiha 精修螺丝刀套装', 'wiha.jpg', '99', '99新', '广东省广州市', '13232060901', '在线交易', 'other', 'lsm', '感兴趣的话给我留言吧！', '已上架');
INSERT INTO `goods` VALUES ('5', '小米MIX2 全面屏2.0', 'phone2.jpg', '127', '95新', '广东省广州市', '13232060901', '当面交易', 'phone', 'zxh', '昆山附近出小米9 等各种颜色手机，包括iPhone，华为，一加，OPPO，vivo等等各种型号。', '已上架');
INSERT INTO `goods` VALUES ('6', '小米Note 3 美颜自拍', 'phone3.jpg', '127', '90新', '广东省广州市', '13232060901', '当面交易', 'phone', 'zxh', '昆山附近出小米9 等各种颜色手机，包括iPhone，华为，一加，OPPO，vivo等等各种型号。', '已上架');
INSERT INTO `goods` VALUES ('7', '小米6 4轴防抖', 'phone4.jpg', '127', '90新', '广东省广州市', '13232060901', '在线交易', 'phone', 'lsm', '昆山附近出小米9 等各种颜色手机，包括iPhone，华为，一加，OPPO，vivo等等各种型号。', '已上架');
INSERT INTO `goods` VALUES ('8', '红米5A 超长待机', 'phone5.jpg', '127', '85新', '江苏省连云港市', '18719331219', '在线交易', 'phone', 'zxh', '感兴趣的话给我留言吧！', '已上架');
INSERT INTO `goods` VALUES ('9', '红米5 Plus 全面屏手机', 'phone6.jpg', '127', '85新', '江苏省连云港市', '15896331256', '在线交易', 'phone', 'zxh', '感兴趣的话给我留言吧！', '已上架');
INSERT INTO `goods` VALUES ('10', '红米Note 5A 轻薄机身', 'phone7.jpg', '127', '95新', '广西省南宁市', '18963630101', '当面交易', 'phone', 'lsm', '奥尼尔魔术三叶草复古球衣，全新无吊M码，背后号码有些剐蹭，上身可无视，领口白色的地方有些微脏，下水可掉，保证没穿过，艺术家勿扰。打包便士可优惠。', '已上架');
INSERT INTO `goods` VALUES ('11', '红米5 柔光自拍', 'phone8.jpg', '127', '85新', '广西省南宁市', '15015092933', '在线交易', 'phone', 'lsm', '奥尼尔魔术三叶草复古球衣，全新无吊M码，背后号码有些剐蹭，上身可无视，领口白色的地方有些微脏，下水可掉，保证没穿过，艺术家勿扰。打包便士可优惠。', '已上架');
INSERT INTO `goods` VALUES ('12', '新小米移动电源2 (10000mAh)', 'power.jpg', '50', '90新', '广东省广州市', '15015092933', '在线交易', 'sm', 'lsm', '昆山附近出小米9 等各种颜色手机，包括iPhone，华为，一加，OPPO，vivo等等各种型号。', '已上架');
INSERT INTO `goods` VALUES ('13', '小米活塞耳机 清新版', 'ej.jpg', '15', '85新', '河北省石家庄市', '18963630101', '在线交易', 'sm', 'lsm', '昆山附近出小米9 等各种颜色手机，包括iPhone，华为，一加，OPPO，vivo等等各种型号。', '已上架');
INSERT INTO `goods` VALUES ('14', '小米电视4A 32英寸', 'tv1.png', '127', '95新', '河北省石家庄市', '13232060901', '在线交易', 'jd', 'zxh', '昆山附近出小米9 等各种颜色手机，包括iPhone，华为，一加，OPPO，vivo等等各种型号。', '已上架');
INSERT INTO `goods` VALUES ('15', '拉夏贝尔 拉链连帽长款羽绒服（杏色）', 'fs.jpg', '65', '90新', '河南省郑州市', '18963630101', '在线交易', 'fs', 'zxh', '昆山附近出小米9 等各种颜色手机，包括iPhone，华为，一加，OPPO，vivo等等各种型号。', '已上架');
INSERT INTO `goods` VALUES ('16', '简约风带实木框镜子 美发镜 美容镜 化妆镜 壁镜', 'jj.jpg', '127', '95新', '广西省桂林市', '15015092933', '在线交易', 'jj', 'lsm', '昆山附近出小米9 等各种颜色手机，包括iPhone，华为，一加，OPPO，vivo等等各种型号。', '已上架');
INSERT INTO `goods` VALUES ('17', '正品雅诗兰黛红石榴水鲜活亮采果萃水补水爽肤水 滋润 清爽', 'mz.jpg', '119', '95新', '四川省成都市', '18963630101', '在线交易', 'mz', 'zxh', '昆山附近出小米9 等各种颜色手机，包括iPhone，华为，一加，OPPO，vivo等等各种型号。', '已上架');
INSERT INTO `goods` VALUES ('20', '#阿迪球衣# 奥尼尔 球衣 魔术 三叶草复古', '1553369318566-O1CN01L8ZRyf1u8q8AOGRfL_!!0-fleamarket.jpg_728x728.jpg', '127', '95新', '山东省淄博市', '13232060901', '在线交易', 'fs', '赵小辉', '奥尼尔魔术三叶草复古球衣，全新无吊M码，背后号码有些剐蹭，上身可无视，领口白色的地方有些微脏，下水可掉，保证没穿过，艺术家勿扰。打包便士可优惠。', '已上架');
INSERT INTO `goods` VALUES ('21', '华为荣耀V20', '1553369477840-O1CN01gWEzNJ1R2JcjyKpVz_!!0-fleamarket.jpg_728x728.jpg', '127', '全新', '湖北省老河口市', '15896323232', '在线交易,当面交易', 'phone', '赵小辉', '荣耀V20 8＋128大内存，全国联保，带发票，假一赔十！西安电信宽带用户找我领手机。', '已上架');
INSERT INTO `goods` VALUES ('22', '闲置口红', '1553369698921-O1CN01Mqokw91tXk2u7V14F_!!0-fleamarket.jpg_728x728.jpg', '20', '90新', '天津市天津市', '18719331219', '在线交易', 'mz', '赵小辉', '色号都有标注不是全新！！！都用过几次，介意者慎拍怀孕了不能用口红了另外迪奥的740是平价替代色，介意者慎拍！！！！其他都是正品，另外j.cat这个牌子是美妆博主推荐，美国的一个牌子不包邮！！！全部打包优惠价！！', '已上架');
INSERT INTO `goods` VALUES ('23', '眼影盘 nakedorange', '1553369852496-O1CN01iVH9Rh1hjOjhwhf9S_!!0-fleamarket.jpg_728x728.jpg', '85', '全新', '台湾台南市', '18719331219', '在线交易', 'mz', '赵小辉', '过生日朋友送的 几乎没用过 用了一点点一点点 想要的私聊 非诚勿扰 谢谢', '已上架');
INSERT INTO `goods` VALUES ('24', 'covermark中草药粉底霜', '1553369928086-O1CN01gW5NKc1fIG2Bps7Au_!!0-fleamarket.jpg_728x728.jpg', '127', '95新', '台湾台南市', '18555555555', '在线交易', 'mz', '赵小辉', '色号YO00，黄一白，对我来说这个色号还是过于黄了，但因为价钱不便宜，所以还是用了一段时间，我是用棉棒蘸取的，用下来它是奶油肌的妆感，一天8小时是没问题的，而且它遮瑕力也不错，这款有中草药的成分，也能在化妆时护肤，除了色号不合适，其他真的挺棒的，来源于靠谱代购，不信别来，大刀别来，原价300的多买的一下砍到3，40的，那你还不如去拼多多买，包半邮，爽快的小伙伴包邮哦', '已上架');
INSERT INTO `goods` VALUES ('25', 'LEADERS/丽得姿韩国补水面膜正品美蒂优氨基酸玻尿酸医美', '1553370029698-O1CN01vTmz9z1TCy4RKbjGx_!!0-fleamarket.jpg_728x728.jpg', '5', '全新', '台湾台南市', '18966666666', '在线交易', 'mz', '赵小辉', '———————————————————别人赠送的面膜，然鹅家里人都不需要，故出。总共2片，5元/片。', '已上架');
INSERT INTO `goods` VALUES ('26', 'freeplus芙丽芳丝洗面奶100g', '1553370172362-O1CN01aUhAeD1idH3ZB7pGf_!!0-fleamarket.jpg_728x728.jpg', '44', '99新', '甘肃省陇南市', '15233333333', '当面交易', 'mz', '赵小辉', 'freeplus芙丽芳丝洗面奶100g温和清洁氨基酸洗面奶 freeplus芙丽芳丝氨基酸洗面奶100g，回购率最高的洗面脸 它能深层清洁毛孔内部的垃圾，轻轻按摩就可清洁皮肤！最关键的是它添加了六种植物精华可以让人的肌肤使用过后不紧绷！还能给肌肤带来特有的水润触感！让肌肤体验到难以置信的水润感觉！同时能够护理敏感肌肤，打造不易受到刺激的健康肌肤，敏感肌一定会爱上她！全新未拆，香港代购剩的便宜闲置出掉一支44元包邮，保证正品', '已上架');
INSERT INTO `goods` VALUES ('27', '全新air force 1空军一号99包邮！！！！', '1553370391565-O1CN01AAEAxB1u7vKgTfEeN_!!0-fleamarket.jpg_728x728.jpg', '99', '99新', '广东省广州市', '18719331219', '在线交易', 'yd', 'wwx', '99包邮！现货真标真皮版！要说最不能错过的鞋那绝对是ta了！！并且，测量过这个鞋子鞋底大概有三四公分的厚度，非常的显高显腿长再就是气垫，实事求是的说，n克的气垫确实牛，确实舒服不服不行，打球，跑步，这个鞋子都是很好的选择！！n克家的广告可能没有那么的铺天盖地，人家都在专心研究技术呢！！无敌抄底价，不入会后悔', '已上架');
INSERT INTO `goods` VALUES ('28', 'NEIGHBORHOOD BDU/C-SHIRT.LS 军装', '1553370463397-O1CN01We6UsW1ZmaZIxGrTZ_!!0-fleamarket.jpg_728x728.jpg', '127', '90新', '广东省广州市', '13569663333', '在线交易', 'yd', 'wwx', '衬衫夹克外套 纯原 老厂货 厂子压着现在翻出来 只有 黑色 M L XL 量非常少 喜爱军装 工装的朋友绝不可错过 179 150上身XL宽松', '已上架');
INSERT INTO `goods` VALUES ('29', 'Converse x John Varvatos', '1553370677329-O1CN01MYBKxK1DR8TC4r4d1_!!0-fleamarket.jpg_728x728.jpg', '127', '99新', '广东省广州市', '15866666666', '在线交易', 'yd', 'wwx', '匡威 jv水晶底 41.5这双脚感很好 鞋垫比较柔软 建议不垫鞋垫穿 后跟部位有磨损 去鞋店刷了然后粘好了 其实并没有穿很多次 水晶底的后跟可能都不太贴合吧 正品正品正品', '已上架');
INSERT INTO `goods` VALUES ('30', '彪马PUMA厚底粉色鞋底松糕底', '1553370789811-O1CN01GREf9u21RnpukOtqB_!!0-fleamarket.jpg_728x728.jpg', '127', '85新', '安徽省淮北市', '17822222222', '在线交易', 'yd', 'wwx', '彪马PUMA CALI WINS三明治厚底金标皮质白黑白粉小白板鞋 草莓厚底，超好看的彪马呀，厚底穿裙子牛仔裤都会百搭，小个子女生也不会显矮啦，男生也更是值得入手的一双百搭板鞋。尺码:35.5 36 36.5 37 37.5 38 38.5 39 40', '已上架');
INSERT INTO `goods` VALUES ('31', '狂飚皓656', '1553370853311-O1CN01ticthT1VAL1fk0COF_!!0-fleamarket.jpg_728x728.jpg', '127', '95新', '安徽省淮北市', '15722222222', '当面交易', 'yd', 'wwx', '全新 正品', '已上架');
INSERT INTO `goods` VALUES ('32', '玩嘉机箱最低90，最高110，包邮！包邮！包邮！', '1553370955220-O1CN01tiJJ8B1YPrIckwpmN_!!0-fleamarket.jpg_728x728.jpg', '90', '80新及以下', '青海省德令哈市', '17844444444', '在线交易', 'sm', 'wwx', '想要哪一款就保存图片发给我，包邮！偏远地区不包邮！rgb！如果需要风扇请联系，风扇6.8一个，3个起包邮，邮费2r', '已上架');
INSERT INTO `goods` VALUES ('33', '爱科技AKG N20C 入耳式耳机 立体声音乐 线控耳麦', '1553371083828-O1CN01o2Vl6T1DULFEXJIG1_!!0-fleamarket.jpg_728x728.jpg', '127', '90新', '云南省大理市', '13621114787', '在线交易', 'sm', 'wwx', '爱科技AKG N20C 入耳式耳机 立体声音乐 线控耳麦 双系统 国行正品，所见即所得，图片实拍！14年淘宝修仙，得825分芝麻信用，偶然机会得一渠道，货源为国行正品，包装略损，货正价美，鱼市搏众所爱，支持7天无理由退换！承蒙厚爱，多加关注！', '已上架');
INSERT INTO `goods` VALUES ('34', 'beats solo3', '1553371164279-O1CN0156dIQ91KPwkqCi5ID_!!0-fleamarket.jpg_728x728.jpg', '127', '95新', '贵州省遵义市', '15274158966', '在线交易', 'sm', 'wwx', 'beats solo3 米其林90周年限量版 美国现带 全新 喜欢或需要的亲可以留言咨询一下哦', '已上架');
INSERT INTO `goods` VALUES ('35', 'Apple iMac 27英寸一体机（2017款四核Co', '1553371233614-O1CN01iDGe6P20osAhz7a3d_!!0-fleamarket.jpg_728x728.jpg', '127', '85新', '四川省乐山市', '18566666666', '在线交易', 'sm', 'wwx', '哈哈哈，运气真好到人人抢宝抢到的，想玩的可以看图去玩一下,我一共拍了几十次，算下来花了200块钱左右就拍到了，太容易中了，便宜出了回血继续拍，因为拍到的价格便宜所以低价卖，走担保有问题可随时退，不议价 谢谢，本人不经常在线，下单前请先联系我，没有回复证明已卖掉，不联系就下单一律不发货！', '已上架');
INSERT INTO `goods` VALUES ('36', '笔记本外置键盘便宜转手啦', '1553371287030-O1CN01XCIBq41ovwu2T9AgH_!!0-fleamarket.jpg_728x728.jpg', '40', '85新', '海南省海口市', '17842231111', '在线交易', 'sm', 'wwx', '这个键盘买来基本上没怎么用，就是放的时间长点，可以说也是八九成新的啦。我是个用什么东西都很上心，用心保护的女生。我可能比较钟爱机械键盘的感觉，嘿嘿，所以放着也是放着，决定便宜转给有需要的人。', '已上架');
INSERT INTO `goods` VALUES ('37', '一加六，8+128', '1553371379742-O1CN01rO4Pjx1Q8thRKA8Hw_!!0-fleamarket.jpg_728x728.jpg', '127', '全新', '广东省中山市', '18745566655', '在线交易,当面交易', 'phone', 'wwx', '1+6.8+128。成色好的，需要的来不接刀，不磨叽，带原装充电器！售后不以成色退货！', '已上架');
INSERT INTO `goods` VALUES ('38', 'Iphone 8 plus 256g', '1553371482551-O1CN01y4CC8q21aVMJezGom_!!0-fleamarket.jpg_728x728.jpg', '127', '99新', '广东省深圳市', '13232090601', '在线交易', 'phone', 'wwx', '99新IP8P 256G，开机激活2周时间，箱说配件齐全，亚太版，移动联通4g正常使用，电信4G能上网（无法打电话），印度苹果店入手，非黑解卡贴，支持各种渠道验机…诚心出，有意小窗也可以换机，换个华为M5pro，全面屏ipad pro，三星s10系列，mate20系列，互补差价', '已上架');
INSERT INTO `goods` VALUES ('39', '三星s7edge自用9.5新', '1553371572203-O1CN01tPNcIA1HoGwFVqrlL_!!0-fleamarket.jpg_728x728.jpg', '127', '95新', '广东省广州市', '17589999999', '在线交易', 'phone', 'wwx', '三星S7edge自用9.5新 三星S7Edge9.5成新 48小时不满意包退，48小时不满意包退，48小时不满意包退【版本】：日版刷国行s8系统【功能】：全功能正常，支持指纹识别，NFC【电池】：正常待机3-4天，一天一充【游戏】：吃鸡，王者，热门手流轻松玩【内存】：4G+32G【颜色】：黑色【成色】：9.5成新【网络】：移动4G联通4G【缺点】：右上角有黑点（三星通病）可接小刀，大刀勿扰，爽快下单送原装充电器，支持，面交，邮寄，退货，货到付款【主屏尺寸】：5.5英寸【主屏材质】:Super AMOLED', '已上架');
INSERT INTO `goods` VALUES ('40', 'iPhone6splus 港行 128g 粉色 成色新', '1553371661915-O1CN01yw8WZy1YY6QHfpqB1_!!0-fleamarket.jpg_728x728.jpg', '127', '全新', '广东省广州市', '17500000000', '当面交易', 'phone', 'wwx', '功能一切正常，无拆无修无动，非诚勿扰，电池刚换的新电池，同城出！', '已上架');
INSERT INTO `goods` VALUES ('41', '雪纺蕾丝刺绣镂空鱼尾修身长袖春夏连衣裙', '1553371834918-O1CN01l9io4f1nDh0kLLE92_!!2-fleamarket.png_728x728.jpg', '25', '95新', '江苏省宿迁市', '18963544444', '在线交易', 'fs', 'lsm', '整理衣柜发现的，没怎么穿。尺码是m码的穿的次数不多，侧开拉链的。修身甜美。喜欢的美女不要错过哦', '已上架');
INSERT INTO `goods` VALUES ('42', '卫衣女宽松显瘦加绒加厚套头百搭女学院风拼接假两件…', '1553371904128-TB2t.9jaLjM8KJjSZFyXXXdzVXa_!!719851228.jpg_728x728.jpg', '10', '全新', '山东省东营市', '17856233333', '在线交易', 'fs', 'lsm', '颜色分类浅绿色,尺码均码 （160/84A）穿了一次，九新，不包邮', '已上架');
INSERT INTO `goods` VALUES ('43', '毛衣', '1553372010417-O1CN01dzPWBa1YEPORDT506_!!0-fleamarket.jpg_728x728.jpg', '24', '90新', '湖北省孝感市', '18719331219', '在线交易', 'fs', 'lsm', '颜色分类浅绿色,尺码均码 （160/84A）穿了一次，九新，不包邮', '已上架');
INSERT INTO `goods` VALUES ('44', '迪丽热巴抖音同款2018夏新款防走光裙裤春秋半身…', '1553372132956-TB2HAB4GqmWBuNjy1XaXXXCbXXa_!!263868619.jpg_728x728.jpg', '50', '90新', '湖南省常宁市', '14753232666', '在线交易', 'fs', 'lsm', '全新 吊牌还在 一次未穿', '已上架');
INSERT INTO `goods` VALUES ('45', '专柜 高腰裤 毛呢 修身 裤子 长裤 春装裤', '1553372174386-O1CN01dOfuh21LPmDUHGMMa_!!0-fleamarket.jpg_728x728.jpg', '50', '95新', '湖南省常宁市', '17856329696', '在线交易', 'fs', 'lsm', '上身效果很好，专柜入', '已上架');
INSERT INTO `goods` VALUES ('46', '中国宜兴紫砂壶', '1553372271548-O1CN01PTWIFQ1KebQHFfdGu_!!0-fleamarket.jpg_728x728.jpg', '127', '99新', '湖北省枣阳市', '18745612369', '当面交易', 'jj', 'zxh', '芭乐水平，90年代紫砂一厂厂壶，紫泥，红泥，容量200毫升左右球孔，砂料纯正，玩家来。[勾引]', '已上架');
INSERT INTO `goods` VALUES ('47', '化妆品收纳盒', '1553372314500-O1CN01grHeFE1h4dTybtRLw_!!2-fleamarket.png_728x728.jpg', '59', '90新', '湖北省枣阳市', '17854444444', '在线交易', 'jj', 'zxh', '刚买不久，但是老公给我买了梳妆台，用不到了。之前两个买了100多，两个一起转吧，东西太大快递太贵，所以本地自提！晚上拍的，灯光有点暗。', '已上架');
INSERT INTO `goods` VALUES ('48', '正品万象紫砂杯万象I23P带滤网390ML万象I27P紫砂办', '1553372380960-O1CN010R5ofu27fRJnPkfEY_!!0-fleamarket.jpg_728x728.jpg', '127', '95新', '湖北省枣阳市', '14785858960', '在线交易', 'jj', 'zxh', '全新的紫砂杯 有滤网 喝茶好杯子方型的直杯390ML 140元方型的办公杯420ML 160元', '已上架');
INSERT INTO `goods` VALUES ('49', '买菜蓝子', '1553372449438-O1CN01Cgw5g31SWpd6XQWiV_!!0-fleamarket.jpg_728x728.jpg', '89', '90新', '湖北省十堰市', '13622450011', '在线交易', 'jj', 'zxh', '九成新，一直没怎么用，需要的联系', '已上架');
INSERT INTO `goods` VALUES ('50', '碗架子，沥水架子25', '1553372560769-O1CN01Bkijlt1efKMafsVH6_!!0-fleamarket.jpg_728x728.jpg', '25', '90新', '陕西省西安市', '15903320064', '当面交易', 'jj', 'zxh', '竹制碗架子，盘子沥水架！一个，全新，没用过！才翻出来！25自提！', '已上架');
INSERT INTO `goods` VALUES ('51', '化妆品收纳盒', '1553372757585-O1CN0138sfW91Oli1oz7rQA_!!0-fleamarket.jpg_728x728.jpg', '25', '90新', '辽宁省大连市', '15978474444', '在线交易', 'jj', 'zxh', '九成新，两个包邮', '已上架');
INSERT INTO `goods` VALUES ('52', 'Tonze/天际 DGD22-22EWG不锈钢隔…', '1553372827469-TB2q4VUcpXXXXcjXXXXXXXXXXXX_!!1041513297.jpg_728x728.jpg', '127', '90新', '辽宁省大连市', '18745996210', '上门自提', 'jd', 'zxh', '感兴趣的话给我留言吧！', '已上架');
INSERT INTO `goods` VALUES ('53', '海尔6公斤全自动洗衣机', '1553372880626-O1CN01Tig3eI1kYM1zwpXOG_!!0-fleamarket.jpg_728x728.jpg', '127', '90新', '辽宁省大连市', '13652000144', '在线交易,当面交易,上门自提', 'jd', 'zxh', '洗衣机是海尔品牌的，灰色的！八成新，干净整洁！洗涤容量6公斤！洗衣机没有任何毛病，试好再买！不糊弄人！配件齐全！沈阳市内五区可以送货安装！(部分区域不能)，价格500！谢绝讲价！', '已上架');
INSERT INTO `goods` VALUES ('54', '发型师专用发廊蓝光大功率吹风机冷热风负离子家用宿舍静音电吹风', '1553373033116-O1CN01snP8Rl1Ezm2JNnyrD_!!0-fleamarket.jpg_728x728.jpg', '24', '全新', '浙江省温州市', '17840036598', '在线交易', 'jd', 'zxh', '感兴趣的话给我留言吧！', '已上架');
INSERT INTO `goods` VALUES ('55', '美的烤箱25L全新的', '1553373314509-O1CN01DCLDgf1wAn2fHbojS_!!0-fleamarket.jpg_728x728.jpg', '200', '全新', '山东省济宁市', '15820049966', '在线交易,当面交易,上门自提', 'jd', 'zxh', '家里有两个烤箱，这个全新的用不着了，转给有需要的人，非常好用、实用、方便。25L的大容量，最好同城自提，不包邮。', '已上架');
INSERT INTO `goods` VALUES ('56', '欧培婴儿游泳池家用保温小孩新生儿童洗澡盆充气BB宝宝游泳桶加', '1553373403364-O1CN01q2ZkwN1T08yatOaK6_!!0-fleamarket.jpg_728x728.jpg', '88', '95新', '湖南省常宁市', '18719331219', '在线交易', 'other', 'zxh', '宝宝从2-3个月开始用到10个月左右，还是挺实用的，特别冬天在家给宝宝游泳特别方便，不用花钱到外面费时费钱。转手原因:宝宝大了入手渠道:淘宝规格：宽100cm 高75cm配: 婴儿颈圈1个，充气电泵1个，排水管1件', '已上架');
INSERT INTO `goods` VALUES ('57', '斯威普swelllpro雨燕防水防雨无人机飞行器', '1553454622757-O1CN018RdbF61IMAFPsku3y_!!0-fleamarket.jpg_728x728.jpg', '4599', '95新', '吉林省通化市', '18719331219', '在线交易', 'other', 'lsm', '斯威普雨燕防水无人机 全新未拆封未激活正规质保 带售后', '已上架');
INSERT INTO `goods` VALUES ('58', '全新fender美标电吉他', '1553461052227-O1CN01gAM7uc1NFoq4i7Bdg_!!0-fleamarket.jpg_728x728.jpg', '7500', '全新', '云南省楚雄市', '13232060901', '在线交易', 'other', 'lsm', '全套东西都在，不接刀。', '已上架');
INSERT INTO `goods` VALUES ('59', 'kfd', '1553688367518-孔凡栋.jpg', '1', '80新及以下', '广东省广州市', '18719331219', '上门自提', 'other', 'zxh', '便宜卖', '已下架');
INSERT INTO `goods` VALUES ('60', '发布测试', '1553718861795-1553706045302.jpg', '1', '95新', '辽宁省抚顺市', '13232060901', '在线交易', 'jj', 'lsm', '测试', '已下架');
INSERT INTO `goods` VALUES ('61', '测试发布', '1553723596381-482614886-1e07dcdac327513d.jpg', '12', '全新', '北京市北京市', '13232060913', '在线交易', 'sm', '王春明', '测试', '已下架');
INSERT INTO `goods` VALUES ('62', '新款阿迪，2019男士户外运动速干短裤 夏日健身，跑步，炎热', '1554833815199-O1CN01me0imN1P2CIqejlLF_!!0-fleamarket.jpg_728x728.jpg', '55', '95新', '海南省海口市', '13985623669', '在线交易', 'yd', 'zxh', '感兴趣的话给我留言吧！', '已上架');
INSERT INTO `goods` VALUES ('70', '测试', '1554962272376-36-16111Q62110359.jpg', '697', '90新', '河南省周口市', '13265558555', '在线交易,当面交易', 'sm', 'zxh', '没有！12365很帝djds', '已下架');

-- ----------------------------
-- Table structure for `messages`
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `userimg` varchar(255) DEFAULT NULL,
  `gid` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `mdate` varchar(255) DEFAULT NULL,
  `mreply` varchar(255) DEFAULT NULL,
  `mshow` tinyint(4) DEFAULT '0',
  `user2` varchar(255) DEFAULT NULL,
  `userimg2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES ('13', 'zxh', '2.jpg', '58', '顺丰包邮吗？', '2019-4-18', '可以，除了新疆西藏地区', '1', 'lsm', '3.jpg');
INSERT INTO `messages` VALUES ('17', 'zxh', '2.jpg', '61', '111', '2019-4-18', null, '0', '王春明', '1553727101116-hdImg_f93b8135acd69b94fb3b918ace51c3eb1477153444495.jpg');
INSERT INTO `messages` VALUES ('18', 'zxh', '2.jpg', '30', '111', '2019-4-18', null, '0', 'wwx', '4.png');
INSERT INTO `messages` VALUES ('19', 'zxh', '2.jpg', '31', '111', '2019-4-18', null, '0', 'wwx', '4.png');
INSERT INTO `messages` VALUES ('20', 'zxh', '2.jpg', '62', '111', '2019-4-18', '222\n', '1', 'zxh', '2.jpg');
INSERT INTO `messages` VALUES ('21', 'zxh', '2.jpg', '22', '111', '2019-4-18', null, '0', '赵小辉', '1.jpg');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sex` varchar(255) DEFAULT '男',
  `birthday` varchar(255) DEFAULT '2000-01-01',
  `label` varchar(255) DEFAULT '虽然没挣到钱，但开心就好',
  `phone` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT '火星',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('37', '赵小辉', '0fbf9965244969fec730d144ed7e9799', '男', '2019-4-3', '虽然没挣到钱，但开心就好！\n', '18719331219', '1.jpg', '火星');
INSERT INTO `users` VALUES ('38', 'zxh', 'b8a01b0d1a5e2e2aa5046e038fb7a68d', '男', '1996-9-1', '虽然没挣到钱，但开心就好!', '18719331219', '2.jpg', '火星');
INSERT INTO `users` VALUES ('39', 'lsm', '0fbf9965244969fec730d144ed7e9799', '男', '1990-12-4', '虽然没挣到钱，但开心就好', '15879661235', '3.jpg', '火星');
INSERT INTO `users` VALUES ('40', 'wwx', '0fbf9965244969fec730d144ed7e9799', '男', '2000-01-01', '虽然没挣到钱，但开心就好', '18745669632', '4.png', '火星');
INSERT INTO `users` VALUES ('41', '爱吃西红柿', '0fbf9965244969fec730d144ed7e9799', '女', '1995-3-9', '在下吃货一枚，请多多指教。', '13232060901', 'acxhs.jpg', '广东广州');
INSERT INTO `users` VALUES ('42', '王春明', 'b8a01b0d1a5e2e2aa5046e038fb7a68d', '男', '2000-2-3', '虽然没挣到钱，但开心就好', '13611440438', '1553727101116-hdImg_f93b8135acd69b94fb3b918ace51c3eb1477153444495.jpg', '火星');
INSERT INTO `users` VALUES ('43', '李景轩', '0fbf9965244969fec730d144ed7e9799', '男', '1996-12-10', '虽然没挣到钱，但开心就好！', '13611440438', '1553727549868-1478166917018.jpg', '火星');
INSERT INTO `users` VALUES ('44', 'zxh1', '0fbf9965244969fec730d144ed7e9799', '男', '2000-01-01', '虽然没挣到钱，但开心就好', '18719331219', null, '火星');
INSERT INTO `users` VALUES ('45', '薛乃斌', '0fbf9965244969fec730d144ed7e9799', '男', '2000-01-01', '虽然没挣到钱，但开心就好', '13611448062', '1553727813899-63ad82d9ce595b00.jpg', '火星');
INSERT INTO `users` VALUES ('46', 'zcx', '0fbf9965244969fec730d144ed7e9799', '男', '2000-01-01', '虽然没挣到钱，但开心就好', '18719331219', '1553773798261-头像.jpg', '火星');
INSERT INTO `users` VALUES ('47', '124564', '0fbf9965244969fec730d144ed7e9799', '男', '2000-01-01', '虽然没挣到钱，但开心就好', '13560488977', '1553775091668--6d8e64c74ac03db8.jpg', '火星');
INSERT INTO `users` VALUES ('48', '123', '0fbf9965244969fec730d144ed7e9799', '男', '2000-1-11', '虽然没挣到钱，但开心就好，不信你看。', '13232060901', '1553779073113-1478052744821.jpg', '火星');
INSERT INTO `users` VALUES ('49', '劳伟杰', '0fbf9965244969fec730d144ed7e9799', '男', '2000-01-01', '虽然没挣到钱，但开心就好', '13989652020', null, '火星');
