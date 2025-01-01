/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : DB_flower

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 26/12/2024 15:29:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fid` int DEFAULT NULL,
  `flower` varchar(255) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flower` (`flower`),
  KEY `uid` (`uid`),
  KEY `fk2` (`fid`),
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk2` FOREIGN KEY (`fid`) REFERENCES `flowers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3

-- ----------------------------
-- Records of carts
-- ----------------------------


-- ----------------------------
-- Table structure for flowers
-- ----------------------------
DROP TABLE IF EXISTS `flowers`;
CREATE TABLE `flowers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `species_name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `img_guid` varchar(255) DEFAULT NULL,
  `state` int DEFAULT '1' COMMENT '商品状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `species_name` (`species_name`),
  CONSTRAINT `flowers_ibfk_1` FOREIGN KEY (`species_name`) REFERENCES `species` (`species_name`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3

-- ----------------------------
-- Records of flowers
-- ----------------------------
INSERT INTO flowers (id, name, species_name, price, detail, img_guid, state) VALUES (46, "发卡", "穿搭", 0.39, "抓夹热卖大号发夹义乌夜市批发货源高级感秋冬扎发盘发发饰鲨鱼夹", "发卡_1688_img7.jpg", 1);
INSERT INTO flowers (id, name, species_name, price, detail, img_guid, state) VALUES (48, "水彩笔", "居家", 0.3, "油性笔记号笔不可擦小双头油性勾线笔细头马克笔儿童绘画防水速干", "水彩笔_1688_img4.jpg", 1);
INSERT INTO flowers (id, name, species_name, price, detail, img_guid, state) VALUES (52, "洗衣液", "居家", 0.9, "爆款2kg小苏打香水洗衣液慕象洗衣液厂家4斤瓶装批发10斤量批代发", "洗衣液_1688_img10.jpg", 1);
INSERT INTO flowers (id, name, species_name, price, detail, img_guid, state) VALUES (53, "钢笔", "其他", 1.1, "902软笔 自来水书法笔 钢笔式软笔", "钢笔_1688_img7.jpg", 1);
INSERT INTO flowers (id, name, species_name, price, detail, img_guid, state) VALUES (54, "口红", "美妆", 3, "PCU丝绒哑光奶霜唇釉显白唇部不沾杯持久不掉色泥口红批发工厂", "口红_1688_img9.jpg", 1);
INSERT INTO flowers (id, name, species_name, price, detail, img_guid, state) VALUES (56, "水壶", "居家", 4, "大厂供应折叠式水壶家用出国旅行便携小型迷你保温烧水壶", "水壶_1688_img6.jpg", 1);
INSERT INTO flowers (id, name, species_name, price, detail, img_guid, state) VALUES (58, "雨伞", "居家", 2.3, "全自动雨伞男大号双人女晴雨两用遮阳伞防晒伞防紫外线广告印logo", "雨伞_1688_img10.jpg", 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_guid` varchar(255) DEFAULT NULL,
  `flower` varchar(255) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `state` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flower` (`flower`),
  KEY `uid` (`uid`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3

-- ----------------------------
-- Records of orders
-- ----------------------------
DROP TABLE IF EXISTS `price_change`;
CREATE TABLE `price_change` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `price` float NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
INSERT INTO price_change (id, data, price, name) VALUES (1, "2024-12-01 00:00:00", 9.99, "钢笔");
INSERT INTO price_change (id, data, price, name) VALUES (2, "2024-12-02 00:00:00", 12.5, "钢笔");
INSERT INTO price_change (id, data, price, name) VALUES (3, "2024-12-03 00:00:00", 15.75, "钢笔");
INSERT INTO price_change (id, data, price, name) VALUES (4, "2024-12-04 00:00:00", 17.3, "钢笔");
INSERT INTO price_change (id, data, price, name) VALUES (5, "2024-12-05 00:00:00", 16.1, "钢笔");
INSERT INTO price_change (id, data, price, name) VALUES (6, "2024-12-06 00:00:00", 18, "钢笔");
INSERT INTO price_change (id, data, price, name) VALUES (7, "2024-12-07 00:00:00", 19.2, "钢笔");
INSERT INTO price_change (id, data, price, name) VALUES (8, "2024-12-16 08:35:47", 0.4, "钢笔");
INSERT INTO price_change (id, data, price, name) VALUES (9, "2024-12-16 15:16:05", 0.39, "发卡");
INSERT INTO price_change (id, data, price, name) VALUES (10, "2024-12-16 15:33:21", 0.3, "水彩笔");
INSERT INTO price_change (id, data, price, name) VALUES (11, "2024-12-16 15:35:43", 0.24, "护手霜");
INSERT INTO price_change (id, data, price, name) VALUES (12, "2024-12-16 15:38:54", 1.1, "钢笔");
INSERT INTO price_change (id, data, price, name) VALUES (13, "2024-12-16 15:45:04", 0.9, "洗衣液");
INSERT INTO price_change (id, data, price, name) VALUES (14, "2024-12-16 16:02:38", 4.98, "雨伞");
INSERT INTO price_change (id, data, price, name) VALUES (15, "2024-12-16 16:05:20", 4, "水壶");
INSERT INTO price_change (id, data, price, name) VALUES (16, "2024-12-16 16:08:52", 2.3, "雨伞");

DROP TABLE IF EXISTS `prices`;
CREATE TABLE `prices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `img_guid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `plat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `flower_id` int NOT NULL,
  `href` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  CONSTRAINT `fk_prices_flowers_name` FOREIGN KEY (`name`) REFERENCES `flowers` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1239 DEFAULT CHARSET=utf8mb3

INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (569, "发卡", "抓夹热卖大号发夹义乌夜市批发货源高级感秋冬扎发盘发发饰鲨鱼夹", 0.39, "发卡_1688_img7.jpg", "1688", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (570, "发卡", "卖萌头饰卡皮巴拉发夹儿童立体弹簧头饰玩具", 0.45, "发卡_1688_img8.jpg", "1688", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (571, "发卡", "跨境鸭嘴夹女发夹高级感一字夹美发刘海夹可爱发卡夹子发饰头饰", 0.78, "发卡_1688_img3.jpg", "1688", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (572, "发卡", "温小影 HELLO YING1个装塑料发卡韩国彩色椭圆后脑勺发夹网红青蛙发夹 随机颜色 1个装", 0.9, "JD_发卡_10.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (573, "发卡", "新年发夹儿童发饰女童汉服流苏假发辫中国风发卡宝宝红色拜年头饰", 1.8, "发卡_1688_img2.jpg", "1688", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (574, "发卡", "高级感黑色珍珠大号抓夹女后脑勺头饰发夹发量多鲨鱼夹202 4新款 咖色M形抓夹【13cm】", 2, "JD_发卡_27.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (575, "发卡", "新款碎发防滑神器百搭带齿波浪发简约头箍洗脸刘海发卡发饰发箍女 黑色1个", 2, "JD_发卡_45.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (576, "发卡", "约6cm高级感气质蝴蝶结抓夹女鲨鱼夹子发卡小号花朵发夹头饰1201", 2.28, "发卡_1688_img5.jpg", "1688", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (577, "发卡", "【已售2W+】简约发箍头箍女压发防滑细款发磨砂发箍百搭网红发卡 黑色1个", 2.49, "JD_发卡_26.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (578, "发卡", "气质秋冬大号花朵发夹女后脑勺盘发发饰2024新款高端森系夹子头饰", 2.55, "发卡_1688_img9.jpg", "1688", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (579, "发卡", "新款森系麋鹿头箍饰品圣诞节红色鹿角发箍女儿童发饰发卡头饰批发", 2.59, "发卡_1688_img1.jpg", "1688", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (580, "发卡", "无痕发夹头发蓬松定型神器高颅顶神器风塑梳发根自然蓬松懒人", 3, "发卡_1688_img6.jpg", "1688", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (581, "发卡", "【5元5件更划算】无痕发夹暖色系塑料夹大地色侧边一字夹洗脸刘海 大地色系鸭嘴夹随机3个装", 3, "JD_发卡_18.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (582, "发卡", "【明星同款】磨砂彩色无痕鸭嘴夹洗脸化妆专用发卡刘海 5个装颜色随机", 3, "JD_发卡_39.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (583, "发卡", "【加粗加厚】一字夹黑发夹发卡发饰U型盘头造型影楼卡子刘海夹 【100支】波浪型+直型各50支", 3.6, "JD_发卡_12.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (584, "发卡", "圣诞节发饰 可爱麋鹿角铃铛闪粉发箍 儿童节日发卡女式头饰批发定", 3.79, "发卡_1688_img4.jpg", "1688", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (585, "发卡", "新款韩系儿童初秋布艺刺绣兔子椭圆BB夹女童格纹针织印花发夹", 4.2, "发卡_1688_img10.jpg", "1688", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (586, "发卡", "复古风发箍高颅顶宽边ins头饰百搭女2024新款高级感 1#编织咖啡麻花", 4.6, "JD_发卡_44.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (587, "发卡", "梦宽网红2024年新款秋冬海绵发箍高颅顶压发头箍女发卡高级感头饰 黑色+卡其", 5.64, "JD_发卡_28.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (588, "发卡", "海伊朵男士发箍男碎发夹隐形背头油头运动头箍男波浪夏洗脸短发整理神器 小波浪【1个装】", 5.9, "JD_发卡_35.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (589, "发卡", "美肤语带齿防滑洗脸发箍(编发款)黑磨砂束发卡头箍碎发整理器男女MF8721", 6.9, "JD_发卡_4.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (590, "发卡", "15件套可爱少女kitty发夹浏海夹小鱼侧边夹甜酷PU星星BB夹发饰女 主图款超值套装15个装《B款》", 6.9, "JD_发卡_23.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (591, "发卡", "JiMi小众高级感基础发圈 百搭黑色橡皮筋小肠圈高弹力不伤发头绳头饰", 7, "SN_发卡_3.jpg", "苏宁", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (592, "发卡", "JiMi优雅大号抓夹森系简约发夹韩国后脑勺发卡网红ins发抓盘发夹子女", 7, "SN_发卡_5.jpg", "苏宁", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (593, "发卡", "艾梵妮男士发箍头箍韩国隐形运动潮简约日韩背头防滑波浪发卡头饰头带 舒适弹簧型款", 7.9, "JD_发卡_13.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (594, "发卡", "男士发箍潮头箍女仙气洗脸发卡韩国成人油头型运动发夹大背头发带", 8, "SN_发卡_1.jpg", "苏宁", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (595, "发卡", "BARY REEF2024年新款发箍女洗脸专用带齿防滑发卡压发无痕碎发编织头箍头饰 黑色-编织带齿发箍", 8.29, "JD_发卡_33.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (596, "发卡", "格蒙发箍男士运动洗脸戴大号隐形日常戴防滑塑料短发发箍3件套", 8.3, "JD_发卡_6.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (597, "发卡", "美肤语黑色一字夹发夹120根小黑夹隐形发卡子刘海碎发夹子边夹MF8269", 8.9, "JD_发卡_3.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (598, "发卡", "优家UPLUS黑色一字夹bb夹边夹15个 侧边夹后脑勺碎发夹刘海夹盘发夹", 9.6, "JD_发卡_9.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (599, "发卡", "ESWIND卷发筒空气刘海卷发器八字刘海内扣卷头发蓬松夹自粘发根6个装 2大号+2中号+2小号", 9.9, "JD_发卡_7.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (600, "发卡", "美肤语宽边高颅顶海绵发箍（深咖色）发卡洗脸碎发夹简约头饰女MF8918", 9.9, "JD_发卡_15.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (601, "发卡", "少女感海洋系列发夹可爱小鱼干小海豚刘海夹侧边夹发饰夹子ins 鱼系列:图片款八只装", 10.32, "JD_发卡_30.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (602, "发卡", "Beautiful princess儿童发夹女童侧边刘海夹子宝宝彩虹头饰小公主可爱碎发bb夹鸭嘴夹 5#奶咖色系14件套", 10.35, "JD_发卡_36.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (603, "发卡", "晨色发箍男隐形头箍发捆3件套男士发卡碎发整理器发夹", 10.4, "JD_发卡_8.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (604, "发卡", "东义严选520礼物防滑波浪隐形发箍3件套 发卡碎发整理器男士发箍发夹头箍", 10.9, "JD_发卡_16.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (605, "发卡", "美肤语发夹一字夹bb夹6个组合 发卡侧边后脑勺碎发夹刘海夹鸭嘴夹MF8831", 12.9, "JD_发卡_2.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (606, "发卡", "晨色波浪发夹一字夹200根小黑夹隐形发卡盘发刘海发边夹碎发夹刘海夹", 12.9, "JD_发卡_11.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (607, "发卡", "简应舒水滴发夹20个黑色 侧边夹后脑勺碎发刘海夹盘发夹前额碎卡子", 12.9, "JD_发卡_20.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (608, "发卡", "优家UPLUS简约渐变奶咖色发夹一字夹6个 发卡刘海夹碎发夹卡子小夹子", 15.6, "JD_发卡_41.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (609, "发卡", "芙蕖 奶咖毛绒发夹网红2023年新款刘海侧边夹子头饰秋冬发卡女可爱bb 柏松10件套", 15.8, "JD_发卡_34.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (610, "发卡", "KAMIXIWAins头绳飘带马尾超仙大肠发圈韩国丸子头扎发珍珠高弹皮筋女夏季头饰 飘带大肠圈", 15.84, "SN_发卡_10.jpg", "苏宁", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (611, "发卡", "JiMi简约气质珍珠发绳女夏季高弹力耐用扎头发圈不勒发橡皮筋头绳头饰 混色5件", 16, "SN_发卡_2.jpg", "苏宁", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (612, "发卡", "女童发夹不伤发宝宝卡子儿童皇冠头饰公主小发卡婴儿边夹发饰饰品 46#水果花朵BB夹 46#水果花朵BB夹", 16, "SN_发卡_7.jpg", "苏宁", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (613, "发卡", "TaTanice 发箍 洗脸发箍发卡带齿防滑小碎发整理发卡经典黑2个装", 16.9, "JD_发卡_32.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (614, "发卡", "KAMIXIWA儿童蝴蝶结发圈女童宝宝可爱头饰小女孩不伤发皮筋扎头发头绳发饰", 17.64, "SN_发卡_4.jpg", "苏宁", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (615, "发卡", "发圈女日韩简约可爱少女扎头发皮筋发绳头饰高弹力儿童头绳发饰 JiMi 发绳组合装（10个）", 18, "SN_发卡_9.jpg", "苏宁", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (616, "发卡", "倾龄大波浪发箍刘海碎发整理神器发卡增高颅顶2024新款不勒头头箍3件", 19, "JD_发卡_24.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (617, "发卡", "TaTanice 洗脸洁面发箍头箍5件套整理碎发发卡防滑带齿碎束发不勒头", 19.9, "JD_发卡_5.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (618, "发卡", "东义严选洗脸专用2024年带齿防滑发箍女发饰压头发卡发捆头饰塑料发带", 19.9, "JD_发卡_40.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (619, "发卡", "向晚琥珀亚克力鸭嘴夹一字刘海发夹女头顶侧边碎发夹子圣诞礼物 单个", 27.8, "JD_发卡_17.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (620, "发卡", "红允毛绒发夹秋冬发卡女2025新款儿童夹子头饰侧边刘海夹可爱卡子发饰 奶白色F065-10件套", 28.8, "JD_发卡_29.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (621, "发卡", "向晚简约洗脸发箍女防滑压碎发外出洗澡头箍女实用圣诞礼物 镂空齿", 29, "JD_发卡_21.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (622, "发卡", "向晚 气质闪钻发箍女春夏压发洗脸头箍带齿防滑发卡洗脸头饰 黑色", 29, "JD_发卡_38.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (623, "发卡", "向晚 刘海侧边抓夹小号头饰小众甜美风发抓 珍珠花朵抓夹-3个", 29.9, "JD_发卡_22.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (624, "发卡", "JiMi银色水钻一字夹发夹侧边发卡高级感ins风刘海夹卡子夹子头饰边夹 高品质边夹8件套", 32, "SN_发卡_8.jpg", "苏宁", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (625, "发卡", "向晚高颅顶发箍女头箍高级感水钻气质洗脸压碎发发卡头饰 黑色", 42, "JD_发卡_14.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (626, "发卡", "KAMIXIWA韩国黑色蝴蝶结洗脸发捆发箍气质简约发饰品头饰2021年新款头箍女", 45, "SN_发卡_6.jpg", "苏宁", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (627, "发卡", "She's头饰 撞色滴油栀子花边夹发卡 刘海发夹发饰 生日礼物", 229, "JD_发卡_31.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (628, "发卡", "SENDME发夹可爱发卡头饰女高端2024蝴蝶发饰发夹礼盒圣诞节礼物送女友 余生饰你发饰礼盒【11件套】", 243, "JD_发卡_42.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (629, "发卡", "施华利（ALEXANDRE ZOUARI）经典系列6cm小型发夹头饰发卡发饰送女友礼物 玛瑙色YY", 260, "JD_发卡_19.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (630, "发卡", "施华利（ALEXANDRE ZOUARI）经典系列6cm小型发夹头饰发卡发饰送女友礼物 玛瑙色YY", 260, "JD_发卡_37.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (631, "发卡", "施华利（ALEXANDRE ZOUARI）基本塑料系列4.5cm小发夹手工发饰头饰送女友 深玳瑁色WW", 280, "JD_发卡_25.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (632, "发卡", "施华利（ALEXANDRE ZOUARI）发夹经典款粉彩系列后脑勺中号抓夹品手工发饰头饰 蓝色222MM", 470, "JD_发卡_43.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (633, "发卡", "Alexandre De Paris亚历山大戴安娜系列8公分发夹发卡送女友礼物【黄亦玫同款】 京东自营", 1690, "JD_发卡_1.jpg", "京东", 46, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (699, "水彩笔", "油性笔记号笔不可擦小双头油性勾线笔细头马克笔儿童绘画防水速干", 0.3, "水彩笔_1688_img4.jpg", "1688", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (700, "水彩笔", "源头厂家ABS磨砂0.5mm中性笔复古色水笔莫兰迪定制圆珠笔快速发货", 0.55, "水彩笔_1688_img7.jpg", "1688", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (701, "水彩笔", "跨境彩色铅笔批发学生专用绘画铅笔套装油性彩铅美术儿童节礼用品", 2.3, "水彩笔_1688_img6.jpg", "1688", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (702, "水彩笔", "Deli得力7060系列可水洗水彩笔幼儿园儿童小学生画画笔套装美术用", 3.5, "水彩笔_1688_img1.jpg", "1688", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (703, "水彩笔", "得力（deli）12色六角细杆水彩笔儿童可水洗创作画笔学生绘画彩虹筒美术涂鸦女孩儿童礼物【圣诞年货】", 4.32, "JD_水彩笔_21.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (704, "水彩笔", "得力(deli)12色可洗水彩笔六角笔杆儿童画画彩色涂色颜色笔美术画材收纳筒考试毕业绘画礼物【圣诞年货】", 6.25, "JD_水彩笔_20.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (705, "水彩笔", "得力HM108盒装细圆杆丙烯马克笔可水洗不透色可叠色学生绘画笔", 6.8, "水彩笔_1688_img9.jpg", "1688", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (706, "水彩笔", "得力水彩笔软头儿童画笔套装12色18色24色36色48色可水洗彩笔", 8.7, "水彩笔_1688_img2.jpg", "1688", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (707, "水彩笔", "黑木12色彩虹铅笔粗杆满天星彩铅8色彩虹铅笔儿童绘画12色彩虹笔", 9.9, "水彩笔_1688_img8.jpg", "1688", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (708, "水彩笔", "【全网低价】录学记 24色细杆丙烯马克笔套装儿童涂鸦笔DIY绘画美术生专用不透纸丙烯笔水性炳希笔水彩笔", 9.9, "JD_水彩笔_10.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (709, "水彩笔", "熊猫丙烯马克笔小学生专用美术不透色可叠色彩笔24彩色画笔幼儿园36水性绘画笔芯儿童可水洗炳稀水彩笔 其他/other 24色（送熊猫贴纸+升级收纳桶）", 9.9, "JD_水彩笔_40.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (710, "水彩笔", "得力马克笔三角杆画笔70803/12色24色36色48色60色80色儿童水彩笔", 10.1, "水彩笔_1688_img5.jpg", "1688", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (711, "水彩笔", "得力（deli)6支装画笔套装学生艺考手绘专业级大师(水粉丙烯油画水彩颜料)画笔套装73885【圣诞年货】", 10.5, "JD_水彩笔_30.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (712, "水彩笔", "得力（deli)6支装画笔套装学生艺考手绘专业级大师(水粉丙烯油画水彩颜料)画笔套装73885【圣诞年货】", 10.5, "JD_水彩笔_32.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (713, "水彩笔", "晨光（M&G)12色易可洗水彩笔 儿童三角杆彩绘涂鸦画笔 学生文具美术绘画笔套装ACP901AT 1盒", 10.8, "JD_水彩笔_9.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (714, "水彩笔", "得力软头丙烯马克笔防水不透色咕卡彩笔学生儿童美术专用叠色", 11.6, "水彩笔_1688_img10.jpg", "1688", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (715, "水彩笔", "真彩(TRUECOLOR)24色大容量水彩笔儿童可水洗画笔幼儿园小学生美术专用绘画画笔套装礼盒彩色涂色笔2116", 11.8, "JD_水彩笔_29.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (716, "水彩笔", "名遇 丙烯马克笔24色儿童小学生专用可叠色美术绘画水彩笔PP盒装丙烯颜料咕卡diy记号笔 宇航员", 11.9, "JD_水彩笔_38.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (717, "水彩笔", "得力(deli)24色可水洗水彩笔易握粗三角学生儿童涂色颜色马克笔画笔套装文具女孩儿童礼物【圣诞年货】", 13.8, "JD_水彩笔_1.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (718, "水彩笔", "【超级爆款】得力(deli)24色双头酒精马克笔 袋装学生水彩笔美术彩笔绘画手绘涂鸦 儿童生日礼物70806-24", 14.2, "JD_水彩笔_6.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (719, "水彩笔", "晨光(M&G)24色水彩笔儿童可水洗幼儿园小学生专用12色36色2岁宝宝画画笔彩色笔套装", 15.52, "SN_水彩笔_3.jpg", "苏宁", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (720, "水彩笔", "画笔套装彩绘笔脸部脸彩专用丙烯水粉水彩尼龙画笔油画笔美术生勾线描边手绘画画色彩笔排笔初学者扁圆峰 混装10支装画笔组合", 15.8, "JD_水彩笔_3.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (721, "水彩笔", "得力(deli)70700双头马克笔套装 学生水彩笔绘画笔手绘笔多色记号笔涂鸦笔彩色画笔速干涂鸦漫画美术设计专用文具", 15.9, "SN_水彩笔_1.jpg", "苏宁", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (722, "水彩笔", "得力(deli)24色圆杆印章水彩笔易可洗臻好洗学生幼儿儿童绘画涂色文具美术画材女孩儿童礼物【圣诞年货】", 16.5, "JD_水彩笔_12.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (723, "水彩笔", "晨光(M&G)ACP92167软头水彩笔 12色 绘画笔 手绘画笔 动漫水彩勾线笔 彩色记号笔 涂鸦笔 12色", 17.5, "SN_水彩笔_4.jpg", "苏宁", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (724, "水彩笔", "得力(deli)24色软头水彩笔勾线漫画插画美工签名记号水性笔涂色学生儿童绘画美术女孩儿童礼物【圣诞年货】", 17.9, "JD_水彩笔_34.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (725, "水彩笔", "得力(deli)易洗水彩笔24色食品级无毒2-6岁锥头易涂鸦绘画美术防缩进萌咿航天女孩儿童礼物【圣诞年货】", 18.5, "JD_水彩笔_18.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (726, "水彩笔", "得力(deli)24色可水洗印章头汪汪队立大功学生水彩笔儿童绘画笔彩绘涂鸦生日考试女孩儿童礼物【圣诞年货】", 18.6, "JD_水彩笔_16.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (727, "水彩笔", "丙烯马克笔水彩笔防水不透色咕卡彩笔学生儿童美术专用无毒可水洗小学生笔芯水性比心绘画本手绘彩色画笔DI 丙烯马克笔/48色硬头 原套装", 18.8, "JD_水彩笔_41.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (728, "水彩笔", "【超级爆款】晨光(M&G)文具24色食品级儿童水彩笔 防缩进锥型笔头绘画 幼儿安心彩绘涂鸦画笔套装ACP901Z6", 20.8, "JD_水彩笔_26.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (729, "水彩笔", "【超级爆款】touchmark文具24色食品级马克笔儿童可水洗双头水彩笔画笔学生绘画美术专用彩笔套装送儿童礼物", 21.8, "JD_水彩笔_15.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (730, "水彩笔", "得力(deli)24色食品级马克笔 细三角杆双头水性涂鸦水彩笔 荧光笔记号笔咕卡DIY荧光毕业生日礼物", 23.2, "JD_水彩笔_11.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (731, "水彩笔", "马培德Maped 大头水彩笔12色粗杆 高颜值水彩笔儿童可水洗无毒幼儿园宝宝diy涂鸦绘画画笔圣诞年货846320CH", 23.52, "JD_水彩笔_7.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (732, "水彩笔", "宝克(BAOKE)MP2924 双头油性马克笔套装 动漫专用手绘设计学生绘画美术成人画笔水彩笔 1套", 23.8, "SN_水彩笔_10.jpg", "苏宁", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (733, "水彩笔", "【全网低价】晨光文具24色丙烯马克笔优握三角杆学生儿童水洗画笔记号笔荧光笔涂鸦手绘APMT8067开学礼物", 23.8, "JD_水彩笔_27.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (734, "水彩笔", "【超级爆款】Touch mark马克笔36色水彩笔动漫双头油性画笔记号笔套装学生文具儿童送男孩女孩生日礼物", 23.9, "JD_水彩笔_4.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (735, "水彩笔", "【全网低价】得力(deli)24色单头水性丙烯马克笔PP盒装防水咕卡荧光记号笔涂鸦diy年货圣诞礼物", 23.9, "JD_水彩笔_8.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (736, "水彩笔", "【超级爆款】晨光(M&G)文具36色易可洗水彩笔 儿童三角杆 脸彩涂鸦画笔 学生美术绘画用品画笔套装ACP901AV", 25, "JD_水彩笔_2.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (737, "水彩笔", "得力70807儿童绘画笔双头酒精性马克笔套装30/40/60/80色水彩笔", 27.4, "水彩笔_1688_img3.jpg", "1688", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (738, "水彩笔", "【超级爆款】Touch mark丙烯马克笔36色水彩笔速干防水不透色涂鸦手绘笔diy颜料画笔记号笔学生儿童开学礼物", 27.5, "JD_水彩笔_14.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (739, "水彩笔", "英雄(HERO) 丙烯水性马克笔2011学生水彩笔绘画手绘涂鸦", 28, "SN_水彩笔_9.jpg", "苏宁", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (740, "水彩笔", "【超级爆款】Touch mark文具36色丙烯马克笔水彩笔防水速干笔diy涂鸦绘画笔儿童学生彩色笔芯笔套装开学礼物", 28.6, "JD_水彩笔_5.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (741, "水彩笔", "迪士尼(Disney)36/48色三角杆水彩笔儿童可水洗粗杆易握画画笔 学生绘画文具玩具彩色手绘笔 冰雪/米奇/漫威系列", 29.1, "SN_水彩笔_2.jpg", "苏宁", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (742, "水彩笔", "【超级爆款】得力（deli）36色丙烯马克笔单头三角杆绘画防水涂鸦涂色水彩笔记号笔手绘学生常用款HM331-36", 32.9, "JD_水彩笔_24.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (743, "水彩笔", "【全网低价】晨光文具36色食品级马克笔 三角杆双头水性彩笔记号笔荧光笔学生绘画生APMT80C7", 33.8, "JD_水彩笔_22.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (744, "水彩笔", "美乐童年婴幼儿童画笔圆头水彩笔12色宝宝无毒可水洗涂鸦绘画画圣诞节礼物", 35.9, "JD_水彩笔_36.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (745, "水彩笔", "美邦祈富 红胖子水彩笔套装3支组合水彩画笔专业级圆头笔水彩毛笔#0#2#4勾线笔#000【红胖子】", 36.6, "JD_水彩笔_23.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (746, "水彩笔", "尚韵儿童节玩具女孩生日礼物6-8-10岁绘画套装画笔小学生水彩笔画画", 38.2, "JD_水彩笔_25.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (747, "水彩笔", "马培德Maped 大头水彩笔24色 幼儿园彩笔儿童可水洗粗杆", 39.52, "JD_水彩笔_19.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (748, "水彩笔", "【超级爆款】掌握丙烯马克笔儿童软头咕卡丙烯笔防水速干不透色学生动漫专用笔芯比心画画笔细头美术生水彩笔无毒可水洗48", 45.6, "JD_水彩笔_45.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (749, "水彩笔", "【超级爆款】舒星60色丙烯马克笔美术生专用手工diy儿童水彩笔小学生画画不透色可叠色笔芯脸部绘彩涂鸦比心碧玺笔防水", 46.8, "JD_水彩笔_28.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (750, "水彩笔", "得力(deli)70686软头水彩笔36支/盒 儿童学生用可水洗美术画笔 色彩鲜艳涂鸦笔涂色勾线笔 水彩画画笔套装36色 36色", 48.2, "SN_水彩笔_5.jpg", "苏宁", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (751, "水彩笔", "录学记 80色双头马克笔油性水彩笔套装小学生儿童专用手绘动漫设计美术绘画彩色笔涂鸦笔文具礼物", 49.9, "JD_水彩笔_44.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (752, "水彩笔", "马培德Maped 大头水彩笔36色粗杆 高颜值水彩笔儿童可水洗无毒幼儿园宝宝涂鸦绘画画笔套装圣诞礼物846324CH", 58.16, "JD_水彩笔_13.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (753, "水彩笔", "得力(deli)70687软头水彩笔48支/盒 儿童学生用可水洗美术画笔 色彩鲜艳涂鸦笔涂色勾线笔 水彩画画笔套装48色 48色", 62.3, "SN_水彩笔_7.jpg", "苏宁", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (754, "水彩笔", "美乐童年儿童水彩笔24色巨可水洗绘画画笔小学生软头细杆双头无毒幼儿园", 62.9, "JD_水彩笔_17.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (755, "水彩笔", "马蒂尼红胖子水彩画笔松鼠毛笔", 76.9, "JD_水彩笔_43.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (756, "水彩笔", "得力70806-80 布袋装黑杆彩色马克笔 80色 80支/袋 彩色水彩笔小学生初学者绘画涂鸦手绘设计套装", 79, "SN_水彩笔_6.jpg", "苏宁", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (757, "水彩笔", "英雄(HERO)丙烯马克笔 一支双色水性手绘学生画美术水彩笔 2018", 97, "SN_水彩笔_8.jpg", "苏宁", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (758, "水彩笔", "美乐童年儿童水彩笔36色绘画画笔可水洗无毒粗头婴幼儿园小学生宝宝马克笔", 107.9, "JD_水彩笔_31.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (759, "水彩笔", "恩米直液式丙烯马克笔不透色可叠色彩笔美术专用软头小学生画画笔水彩笔儿童笔芯画笔 小黑盒直液式60色", 108.8, "JD_水彩笔_35.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (760, "水彩笔", "touchmark直液式软头丙烯马克笔60色大容量水彩笔布袋款绘画笔叠色不透色学生儿童专用生日开学礼物", 152.1, "JD_水彩笔_39.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (761, "水彩笔", "迪士尼（Disney）绘画套装160件儿童文具生日礼物小女孩画画套装画笔水彩笔礼盒小学生圣诞礼物 艾莎DM29445F", 189, "JD_水彩笔_33.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (762, "水彩笔", "蒙玛特（Mont Marte）儿童绘画套装儿童节新年礼物开学文具美术用品水彩笔蜡笔画礼盒圣诞礼物 174件绘画套装", 264, "JD_水彩笔_37.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (763, "水彩笔", "【超级爆款】蒙玛特(Mont Marte)画笔套装 儿童绘画套装画画彩笔水彩高级木盒小学生幼儿美术颜料蜡笔画笔礼盒MMGS0012CN", 264, "JD_水彩笔_42.jpg", "京东", 48, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (894, "洗衣液", "爆款2kg小苏打香水洗衣液慕象洗衣液厂家4斤瓶装批发10斤量批代发", 0.9, "洗衣液_1688_img10.jpg", "1688", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (895, "洗衣液", "爆款洗衣液2kg量批工厂批发洗衣液箱批留香洗衣液活动礼品大批量", 1.4, "洗衣液_1688_img1.jpg", "1688", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (896, "洗衣液", "BOAE衣物香氛喷雾祛异味持久留香衣柜衣服除味剂衣物喷雾一件代发", 1.5, "洗衣液_1688_img3.jpg", "1688", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (897, "洗衣液", "振洁爸爸去哪儿洗衣液2kg瓶装香氛家用整箱香薰代发日用礼品地推", 2.9, "洗衣液_1688_img9.jpg", "1688", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (898, "洗衣液", "酵素蛋白酶抑菌内衣洗衣液专用持久留香深层清洁易漂洗内衣清洗液", 5.5, "洗衣液_1688_img2.jpg", "1688", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (899, "洗衣液", "露丝洗衣凝珠 格拉斯玫瑰香氛 持久留香深层洁净浓缩洗衣服 10颗", 5.9, "JD_洗衣液_43.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (900, "洗衣液", "活力28山茶花洗衣液 留香持久深层洁净香氛去污护色柔顺护衣 2kg 1袋 【4斤】", 6.8, "JD_洗衣液_11.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (901, "洗衣液", "活力28洗衣液除菌除螨洗衣液1kg深层清洁去渍留香温和柔顺护色", 7.5, "洗衣液_1688_img7.jpg", "1688", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (902, "洗衣液", "三腔洗衣凝珠防串色染色洗衣液凝珠家用去渍留香洗衣珠厂家定制", 7.65, "洗衣液_1688_img4.jpg", "1688", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (903, "洗衣液", "洗衣凝珠留香珠洁净去渍杀菌祛螨洗衣片家用盒装洗衣液珠厂家定制", 7.65, "洗衣液_1688_img5.jpg", "1688", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (904, "洗衣液", "爱恩倍除螨袋装桶装洗衣液婴儿护手护色香水抑菌内衣大桶10斤批发", 9.5, "洗衣液_1688_img8.jpg", "1688", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (905, "洗衣液", "立白超洁薰衣香洗衣液950g酵素洁净健康除菌低泡易漂洗", 9.9, "SN_洗衣液_8.jpg", "苏宁", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (906, "洗衣液", "立白天然茶籽洗衣液 2斤 手洗机洗 除菌除螨抑菌 祛味去渍 儿童适用", 10.9, "JD_洗衣液_35.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (907, "洗衣液", "超能洗衣液袋装1kg袋装香味持久深层去污家庭装家用补充装", 11.9, "SN_洗衣液_3.jpg", "苏宁", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (908, "洗衣液", "苏宁宜品 2KG装薰衣草低泡易漂洗洗衣液", 14.7, "SN_洗衣液_2.jpg", "苏宁", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (909, "洗衣液", "活力28洗衣液香水2.6KG家用洗衣液批发清洁去渍持久留香温和护手", 16.9, "洗衣液_1688_img6.jpg", "1688", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (910, "洗衣液", "活力28洗衣液3.5kg洗衣液深层清洁薰衣香持久留香家庭实惠装 3.5kg*1桶", 16.9, "SN_洗衣液_4.jpg", "苏宁", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (911, "洗衣液", "奥妙(OMO) 除菌除螨洗衣液 1kg+400g 源自天然酵素 去除四大细菌和尘螨(新老包装随机发货)[联合利华]", 19.9, "SN_洗衣液_6.jpg", "苏宁", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (912, "洗衣液", "立白超洁薰衣香洗衣液1.95kg大袋装酵素洁净健康除菌低泡易漂洗", 19.9, "SN_洗衣液_9.jpg", "苏宁", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (913, "洗衣液", "超能内衣洗衣液860g长效抑菌女生内衣内裤内衣裤专用大瓶装祛血渍祛异味", 19.9, "SN_洗衣液_10.jpg", "苏宁", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (914, "洗衣液", "蓝月亮深层洁净洗衣液薰衣草持久留香味批发护理套装1kg*2瓶/500g单瓶 共4斤瓶装", 29.8, "JD_洗衣液_40.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (915, "洗衣液", "立白天然茶籽洗衣液 3斤 除菌除螨抑菌 手洗机洗祛味含补充装", 29.9, "JD_洗衣液_5.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (916, "洗衣液", "威露士la有氧洗衣液松木香4斤组合装（瓶1L+补充袋装500ml*2）除菌除螨", 29.9, "JD_洗衣液_8.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (917, "洗衣液", "蓝月亮 深层洁净洗衣液 薰衣草香 1kg*1瓶+500g*2补充装 强效去渍", 29.9, "JD_洗衣液_10.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (918, "洗衣液", "植护香水洗衣液6斤套装 香味持久留香 深层洁净 整箱家庭实惠装", 29.9, "JD_洗衣液_24.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (919, "洗衣液", "奥妙（OMO）除菌除螨洗衣液 10.48斤（3KG+400G×2+480G×3） 72h抑菌 除菌除螨", 41.4, "JD_洗衣液_4.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (920, "洗衣液", "雕牌 除菌馨香洗衣液 薰衣草香 2.5kg*2瓶 除菌率99%(新老包装随机发", 44.9, "JD_洗衣液_6.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (921, "洗衣液", "立白大师香氛洗衣液 2斤 柔顺护衣 持久留香 洁净护色 洗衣香水", 44.9, "JD_洗衣液_42.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (922, "洗衣液", "植护香水洗衣液13斤套装整箱 樱花香味持久留香 机洗手洗 深层洁净", 55.9, "JD_洗衣液_14.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (923, "洗衣液", "蓝月亮洗衣液袋装亮白增艳1kg*5袋 薰衣草香 洗衣液补充装 护色增艳", 58.5, "转换失败", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (924, "洗衣液", "蓝月亮 亮白增艳洗衣液薰衣草香 1.95kg*1瓶+500g*4袋 洁净去污护衣护色", 59.9, "JD_洗衣液_13.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (925, "洗衣液", "威露士清可新洗衣液柠檬12.18斤(2L+1L+袋500mlx6+内衣净90ml)新旧随机", 59.9, "JD_洗衣液_33.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (926, "洗衣液", "超能洗衣液3kg*2瓶 12斤家庭实惠装 去渍洁净 花漾柔护 持久留香", 65.7, "JD_洗衣液_16.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (927, "洗衣液", "奥妙（OMO） 除菌除螨酵素洗衣液12斤（3kg*2）持久留香 长效抑菌 家庭必备", 65.9, "JD_洗衣液_17.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (928, "洗衣液", "雕牌除菌馨香洗衣液20斤 整箱4瓶装 除菌99.9% 薰衣草香 不含磷", 68.6, "JD_洗衣液_15.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (929, "洗衣液", "蓝月亮亮白洗衣液 薰衣草香 2.75kg瓶*1+1kg瓶*3 洁净去污 易漂洗", 69.9, "JD_洗衣液_28.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (930, "洗衣液", "奥妙（OMO） 深层洁净酵素洗衣液12斤（3kg*2 ）长效抑菌 99%除菌 持久留香", 69.9, "JD_洗衣液_44.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (931, "洗衣液", "立白天然茶籽洗衣液12斤 除菌除螨抑菌 手洗机洗祛味去渍含补充装", 79.9, "JD_洗衣液_2.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (932, "洗衣液", "蓝月亮洗衣液12斤套装：亮白增艳薰衣草3kg瓶+1kg袋*3", 79.9, "JD_洗衣液_3.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (933, "洗衣液", "奥妙（OMO） 除菌除螨酵素洗衣液16斤 72小时长效抑菌 清洁护衣 超值家庭组套", 79.9, "JD_洗衣液_30.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (934, "洗衣液", "蓝月亮 深层洁净洗衣液 薰衣草香 2kg瓶*2+1kg瓶全瓶装 强效去污易漂洗", 79.9, "JD_洗衣液_36.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (935, "洗衣液", "立白大师香氛洗衣液 格拉斯玫瑰4斤装 洗衣香水 香味持久 内衣可用", 79.9, "JD_洗衣液_45.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (936, "洗衣液", "汰渍洗衣液持久留香纳米级去渍11斤除菌除螨补充装整箱批发内衣可用", 87.9, "JD_洗衣液_39.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (937, "洗衣液", "蓝月亮 深层洁净洗衣液全瓶装:1.95kg瓶*2+1kg瓶*4 薰衣草香 强效去污", 89.5, "JD_洗衣液_20.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (938, "洗衣液", "滴露3合1衣物柔顺除菌液怡然薰衣草2.5L", 89.9, "SN_洗衣液_1.jpg", "苏宁", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (939, "洗衣液", "威露士清可新洗衣液松木香18.5斤（3L瓶+2.25L+2L袋x2）除菌除螨除霉味", 89.9, "JD_洗衣液_9.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (940, "洗衣液", "奥妙除菌除螨酵素洗衣液20斤（3kg+3kg+2kg*2）72小时长效抑菌", 89.9, "JD_洗衣液_32.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (941, "洗衣液", "威露士la有氧洗衣液松木香12斤全瓶组合装（3L+2L+1L) 除菌除螨除霉味", 89.9, "JD_洗衣液_41.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (942, "洗衣液", "【超值16斤】蓝月亮洗衣液 深层洁净强效去污", 93.9, "JD_洗衣液_25.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (943, "洗衣液", "【超值16斤】蓝月亮洗衣液 深层洁净强效去污", 93.9, "JD_洗衣液_37.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (944, "洗衣液", "威露士清可新洗衣液柠檬香20.24斤（瓶2L+1L+袋1L*7+消毒液60ml*2）除螨", 96.9, "JD_洗衣液_26.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (945, "洗衣液", "京东京造 洗衣液20斤(3kg*2瓶+1kg*4袋)除菌除螨99.9% 天然酵素留香", 97.9, "JD_洗衣液_12.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (946, "洗衣液", "立白大师香氛香水洗衣液12斤持久留香护衣护色柔顺天然酵素洁净", 99.9, "SN_洗衣液_7.jpg", "苏宁", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (947, "洗衣液", "蓝月亮 深层洁净洗衣液 薰衣草香 3kg瓶+1kg瓶*3全瓶装 强效去污易漂洗", 99.9, "JD_洗衣液_22.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (948, "洗衣液", "立白天然茶籽洗衣液 18斤 除菌除螨抑菌 手洗机洗祛味去渍含补充装", 99.9, "JD_洗衣液_23.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (949, "洗衣液", "奥妙（OMO）除菌除螨酵素洗衣液 18.3斤大礼包 72小时长效抑菌 99%除菌除螨", 99.9, "JD_洗衣液_27.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (950, "洗衣液", "立白卫仕天然除菌洗衣液 8斤家庭装 除菌率99.99% 72小时长效抑菌", 99.9, "JD_洗衣液_38.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (951, "洗衣液", "蓝月亮 深层洁净洗衣液 2.75kg*2+1kg*3袋+500g*3袋 薰衣草香 强效去污", 106.9, "JD_洗衣液_21.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (952, "洗衣液", "宝莹（Persil）进口洗衣液9大酵素2.2L薰衣草香99%除菌除螨长效抑菌强效去污护色", 119, "JD_洗衣液_19.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (953, "洗衣液", "滴露去污除菌洗衣凝珠2盒高效杀菌除螨护色柔顺 8倍洁净力雨后青草香", 120.1, "SN_洗衣液_5.jpg", "苏宁", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (954, "洗衣液", "立白天然亮白洗衣液 薰衣草馨香 24斤 护色护衣洁净 整箱家庭装", 129.9, "JD_洗衣液_29.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (955, "洗衣液", "汰渍洗衣液持久留香纳米级去渍24斤整箱除菌除螨补充装批发内衣可用", 144.9, "JD_洗衣液_34.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (956, "洗衣液", "【1次带走9件】立白大师香氛洗衣液京东自营持久留香型天然洁净 纳米护色科技 柔顺更护衣4斤组套补充装", 149.87, "JD_洗衣液_1.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (957, "洗衣液", "立白卫仕天然除菌洗衣液 14.48斤家庭装 除菌率99.99% 72h长效抑菌", 149.9, "JD_洗衣液_31.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (958, "洗衣液", "新西兰大容量羽绒服蓬松去污专用洗衣液", 158, "JD_洗衣液_7.jpg", "京东", 52, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (959, "钢笔", "902软笔 自来水书法笔 钢笔式软笔", 1.1, "钢笔_1688_img7.jpg", "1688", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (960, "钢笔", "博学钢笔六件套练字硬笔可换墨囊吸墨水美工成人办公书写刻字logo", 5.5, "钢笔_1688_img1.jpg", "1688", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (961, "钢笔", "清华北大状元笔名校钢笔纪念品徽章礼盒金属签字笔学生励志礼物", 6.8, "钢笔_1688_img10.jpg", "1688", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (962, "钢笔", "英雄（HERO）钢笔经典007 黑色暗尖铱金钢笔墨水笔学生单支装 F尖", 6.9, "JD_钢笔_9.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (963, "钢笔", "【直播1.99元起】国潮钢笔小学生成人签字笔商务凌美平替高颜值正姿钢笔带墨囊套装文具生日礼物男生女生 【4支-全套】国潮四圣兽各1支 【黑色】20...", 7, "JD_钢笔_15.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (964, "钢笔", "晨光(M&G)文具钢笔F尖黑杆单支装 带吸墨器（不含墨囊）可换墨囊适配3.4口径 学生书法练字AFPY5222", 10.9, "JD_钢笔_38.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (965, "钢笔", "晨光(M&G)文具优握可擦正姿钢笔3.4mm口径 学生儿童墨囊矫姿练字笔墨水笔（本品不含墨囊）4支装AFPM1305", 11.8, "JD_钢笔_20.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (966, "钢笔", "白雪(snowhite)钢笔成人书法日常书写练字钢笔小学生三年级直液式控墨速干不洇纸F尖0.5mm黑色6支/袋 FP20", 13.2, "JD_钢笔_41.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (967, "钢笔", "晨光(M&G)文具学生钢笔珠光蓝EF尖3.4mm口径可换墨囊 正姿练字钢笔墨水笔（本品不含墨囊）单支装AFPY522325", 13.5, "JD_钢笔_5.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (968, "钢笔", "晨光(M&G)文具学生钢笔珠光紫EF尖3.4mm口径可换墨囊 正姿练字钢笔墨水笔（不含墨囊）单支装AFPY522379", 13.5, "JD_钢笔_30.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (969, "钢笔", "晨光(M&G)文具学生钢笔珠光紫EF尖3.4mm口径可换墨囊 正姿练字钢笔墨水笔（不含墨囊）单支装AFPY522379", 13.5, "JD_钢笔_33.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (970, "钢笔", "晨光(M&G)文具小海绵按动钢笔2支装（不含墨囊） EF笔尖可换墨囊钢笔 学生书法练字墨水笔AFPU9902", 15.9, "JD_钢笔_10.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (971, "钢笔", "晨光(M&G)文具EF尖学生正姿练字 肤感可换墨囊钢笔套装（钢笔*1+3.4口径墨囊*4）渐变蓝杆签字墨水笔HAFP2430", 15.9, "JD_钢笔_39.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (972, "钢笔", "晨光(M&G)文具优握热可擦晶蓝正姿钢笔套装（钢笔*3+润笔器+3.4口径墨囊*3）学生儿童练字笔 HAFP2152蓝杆", 16.8, "JD_钢笔_8.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (973, "钢笔", "英雄（HERO）钢笔 1359星河系列 学生男女初学练字三年级正姿墨水笔(附加6支墨囊) EF尖 炫彩紫", 17.99, "JD_钢笔_29.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (974, "钢笔", "三笔头更换永生钢笔礼盒套装商务礼品学生书法练字办公可设计LOGO", 19.9, "钢笔_1688_img3.jpg", "1688", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (975, "钢笔", "英雄（HERO）钢笔359 正姿 黑色 F尖薄厚片工艺学生练字钢笔 （附加6支墨囊颜色随机）铱金钢笔签字笔", 21.99, "JD_钢笔_28.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (976, "钢笔", "英雄（HERO）钢笔 359B 明尖铱金男女学生初学练字三年级正姿签字钢笔（附加6支墨囊） EF尖 渐变深蓝", 22.33, "JD_钢笔_1.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (977, "钢笔", "晨光(M&G)文具热可擦金属钢笔套装(3.4mm晶蓝墨囊*2 润笔器) 小学生练字书法正姿钢笔 萌萌熊兔系列HAFP2198", 23.6, "JD_钢笔_24.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (978, "钢笔", "英雄（HERO）钢笔 359B 明尖铱金男女学生初学练字三年级正姿签字钢笔（附加6支墨囊） EF尖 渐变樱花粉", 23.99, "JD_钢笔_14.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (979, "钢笔", "英雄（HERO）钢笔359 正姿 磨砂黑 F尖薄厚片工艺学生练字钢笔 （附加6支墨囊）铱金钢笔签字笔", 24, "JD_钢笔_45.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (980, "钢笔", "点石时空舱不溅墨细尖钢笔正姿小学生三年级练字书法日常书写专用钢笔DS-7155蓝杆-EF尖【魔液可擦蓝】", 24.8, "JD_钢笔_12.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (981, "钢笔", "德国schneider施耐德墨囊笔短杆彩杆细尖0.35mm练字书写童趣钢笔", 25, "钢笔_1688_img6.jpg", "1688", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (982, "钢笔", "英雄(HERO)钢笔 616暗尖彩杆铱金笔尖", 25, "SN_钢笔_4.jpg", "苏宁", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (983, "钢笔", "英雄钢笔359 正姿练字 男女孩学生用可替换墨囊 红色EF尖0.38mm（实际书写粗细0.5mm）", 25, "SN_钢笔_6.jpg", "苏宁", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (984, "钢笔", "英雄（HERO）钢笔 359B 明尖铱金男女学生初学练字三年级正姿签字钢笔（附加6支墨囊） EF尖 渐变粉", 25, "JD_钢笔_26.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (985, "钢笔", "英雄（HERO）钢笔359 正姿 黑色 EF尖薄厚片工艺学生练字钢笔 （附加6支墨囊颜色随机）铱金钢笔签字笔", 25, "JD_钢笔_27.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (986, "钢笔", "施耐德（Schneider）小学生钢笔初学者儿童练字笔德国进口特细EF尖萌趣系列-阿吾猫178343", 25.2, "JD_钢笔_21.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (987, "钢笔", "施耐德（Schneider）小学生钢笔初学者儿童练字笔德国进口特细EF尖萌趣系列-怪兽派对178336", 25.2, "JD_钢笔_42.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (988, "钢笔", "施耐德官方BK406钢笔铱金笔墨水笔EF笔尖小学生专用硬笔", 27, "钢笔_1688_img5.jpg", "1688", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (989, "钢笔", "英雄（HERO）钢笔礼盒男女士签字笔礼品商务书法练字三年级中小学生定制刻字笔生日礼物E609 【官方补贴】耀光黑【简装】（送 墨水+墨囊） F明尖0.5mm", 27.8, "JD_钢笔_17.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (990, "钢笔", "德国schneider施耐德0.35mm铱金尖可换墨胆新款BK406山水星像钢笔", 28, "钢笔_1688_img2.jpg", "1688", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (991, "钢笔", "英雄钢笔359B成人办公学生正姿练字男女孩墨囊钢笔小学生初学者 炫光蓝", 28, "SN_钢笔_3.jpg", "苏宁", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (992, "钢笔", "英雄（HERO）钢笔 359B学生办公练字正姿铱金钢笔（附加6支墨囊） EF尖 珠光蓝", 28, "JD_钢笔_44.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (993, "钢笔", "英雄(HERO)钢笔 1203正姿时尚简约铱金笔 学生练字笔 黑色", 29.9, "SN_钢笔_8.jpg", "苏宁", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (994, "钢笔", "英雄（HERO）钢笔 382商务办公学生日常书写铱金签字墨水笔 明尖 黑色", 30.08, "JD_钢笔_2.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (995, "钢笔", "施耐德（Schneider）小学生钢笔初学者儿童正姿练字笔男女孩三四年级入门墨囊笔EF尖童趣-机器人", 31.1, "JD_钢笔_18.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (996, "钢笔", "施耐德（Schneider）小学生钢笔初学者儿童正姿练字笔男女孩三四年值入门墨囊钢笔EF尖童趣-动物园", 31.1, "JD_钢笔_35.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (997, "钢笔", "英雄（HERO）钢笔/签字笔7006 学生办公练字钢笔商务礼品 F尖 黑色", 33, "JD_钢笔_40.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (998, "钢笔", "德国Schneider施耐德 BK400钢笔+水笔两用礼盒套装铱金笔钢笔", 38, "钢笔_1688_img4.jpg", "1688", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (999, "钢笔", "英雄钢笔850学生练字钢笔明尖0.5mm,暗尖0.38mm女生复古男士定制刻字礼物送礼 墨绿色钢笔-明尖", 49, "SN_钢笔_5.jpg", "苏宁", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1000, "钢笔", "弘典钢笔男女式学生用商务办公成人用练字笔礼盒礼物高颜值1850黑白送礼书写书法专用可用墨囊定制 黑森林 F0.5mm", 53, "JD_钢笔_36.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1001, "钢笔", "英雄牌钢笔1063练字男女小学生特细0.38mm暗尖可替换墨囊书法硬笔男士女生复古礼物送礼", 55, "SN_钢笔_10.jpg", "苏宁", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1002, "钢笔", "毕加索（pimio） 916新色极夜黑复古钢笔/星夜系列男女学生送礼签名练字笔节日礼物【免费刻字】 【极夜黑钢笔】0.5mm", 59.5, "JD_钢笔_11.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1003, "钢笔", "弘典(HongDian)钢笔高端黑森林promax商务F尖0.5mm签字笔墨水礼盒套装男女生日礼物", 69.9, "JD_钢笔_4.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1004, "钢笔", "弘典(HongDian)钢笔商务1861黑森林promax钛黑铱金版 EF墨水礼盒套装学生办公礼物", 69.9, "JD_钢笔_22.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1005, "钢笔", "英雄(HERO)钢笔 766黑色铱金笔尖 墨水笔 签字笔 黑色", 93, "SN_钢笔_1.jpg", "苏宁", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1006, "钢笔", "思笔乐（STABILO）德国高端钢笔明尖EF尖初学书法练字办公小学生钢笔正姿书写儿童礼物 紫粉色", 99, "JD_钢笔_32.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1007, "钢笔", "凌美(LAMY)Z50笔尖 狩猎者 恒星 演艺等凌美系列钢笔通用钢笔笔尖 笔尖EF黑色(0.4~0.5mm)", 109, "SN_钢笔_7.jpg", "苏宁", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1008, "钢笔", "英雄（HERO）钢笔1520绒砂多彩铱金/特细/美工三合一 男女款办公节日礼物墨水礼盒套装 黑色", 109, "JD_钢笔_6.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1009, "钢笔", "英雄（HERO）钢笔1520绒砂多彩 铱金/特细/美工笔三合一 男女款办公礼品教师墨水礼盒套装 银色", 109, "JD_钢笔_34.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1010, "钢笔", "英雄（HERO）钢笔文创民族钢笔礼盒学生精致高档生日礼物男女生商务礼赠送老师领导伴手礼年会礼品定制 格萨尔-红金夹", 148, "JD_钢笔_31.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1011, "钢笔", "高端渐变烤漆金属钢笔高档商务礼品钢笔系列配吸水器", 150, "钢笔_1688_img8.jpg", "1688", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1012, "钢笔", "现货拉丝阳极金属签字笔成人商务办公用笔高档礼品笔", 150, "钢笔_1688_img9.jpg", "1688", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1013, "钢笔", "【全网低价】英雄（HERO）钢笔礼盒【韶华系列】钢笔/宝珠/美工 三合一商务钢笔高端节日礼物墨水套装 黑色", 217.49, "JD_钢笔_16.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1014, "钢笔", "德国原装进口LAMY Safari凌美狩猎者系列钢笔墨水笔学生钢笔成人练字钢笔商务办公礼品笔商务送礼 EF尖0.4mm", 235, "SN_钢笔_2.jpg", "苏宁", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1015, "钢笔", "派克（PARKER）高端钢笔礼盒学生套装商务送礼定制刻字男女生日礼物礼品文具签字墨水笔中国红礼盒 羽纱黑金夹墨水笔+国潮文创礼盒", 255, "JD_钢笔_37.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1016, "钢笔", "德柏（DARB）高端钢笔德国进口总成【免费刻字】节日礼物墨水礼盒套装硬笔书法学生练字办公签名 银色深黑 0.5F尖【中等粗细】墨水礼盒", 318, "JD_钢笔_25.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1017, "钢笔", "德柏（DARB） 高端原木钢笔成人德国进口笔尖节日礼物免费刻字胡桃木花梨木商务办公墨水礼盒套装送領導 花梨木单支礼盒装 0.38EF尖【偏细】", 338, "JD_钢笔_19.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1018, "钢笔", "【圣诞礼物】派克（PARKER）钢笔签字笔 商务送礼定制刻字生日礼物文具国潮学生套装 威雅XL经典黑金夹墨水笔 黑墙礼盒", 364, "JD_钢笔_7.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1019, "钢笔", "派克（PARKER） 钢笔高端文创礼盒学生套装商务送礼定制刻字生日礼物礼品文具签字墨水笔国潮商务签字 威雅燧石黑金夹墨水笔+小墨水礼盒（贺卡定制）", 375, "JD_钢笔_3.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1020, "钢笔", "英雄(HERO)钢笔 1179荣威10K金墨水笔/暗尖钢笔 签字笔 黑色", 439, "SN_钢笔_9.jpg", "苏宁", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1021, "钢笔", "德柏（DARB）高端原木钢笔德国进口施密特笔尖成人练字节日礼物胡桃木花梨木男士送长辈办公商务F尖 金色胡桃木 0.38EF尖【偏细】墨水礼盒套装", 699, "JD_钢笔_43.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1022, "钢笔", "万宝龙MONTBLANC 墨水+意大利彼耐德石墨烯黑钢笔礼盒套装", 1099, "JD_钢笔_23.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1023, "钢笔", "派克（PARKER）钢笔&SKG 按摩仪K5-3 IM丽雅黑金夹墨水笔时光胶囊礼盒", 1298, "JD_钢笔_13.jpg", "京东", 53, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1024, "口红", "PCU丝绒哑光奶霜唇釉显白唇部不沾杯持久不掉色泥口红批发工厂", 3, "口红_1688_img9.jpg", "1688", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1025, "口红", "外贸口红盒装6色雾面哑光不掉色不沾杯HANDAIYAN跨境彩妆口红", 3.2, "口红_1688_img1.jpg", "1688", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1026, "口红", "VIBELY萌彩空气雾面气垫唇粉霜不沾杯唇釉 哑光伪素颜口红学生党", 3.8, "口红_1688_img3.jpg", "1688", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1027, "口红", "VIBELY芦荟滋润温感变色果冻口红 保湿唇彩唇部护理护唇唇膏抖快", 3.8, "口红_1688_img10.jpg", "1688", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1028, "口红", "雅琪诺猫爪晶冻口红水光镜面滋润防水汗持久不沾杯润唇膏跨境彩妆", 4.3, "口红_1688_img6.jpg", "1688", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1029, "口红", "HERORANGE~低饱和淡颜口红多用棒水光感滋润显白自然持妆镜面唇膏", 4.8, "口红_1688_img2.jpg", "1688", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1030, "口红", "朱珠推荐DNM双头口红唇线笔珠光哑光防水不沾杯口红唇笔跨境批发", 5.3, "口红_1688_img7.jpg", "1688", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1031, "口红", "VIBELY慕斯不沾杯哑光口红 丝绒不掉色显白直播网红爆款礼盒口红", 5.8, "口红_1688_img5.jpg", "1688", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1032, "口红", "雅琪诺花瓣果冻温变润唇膏润补水不易沾杯不掉色口红保湿跨境彩妆", 6.9, "口红_1688_img4.jpg", "1688", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1033, "口红", "ARTMISS轻逸雾感绒滑口红不沾杯不掉色不拔干丝绒口红现货定制", 27.9, "口红_1688_img8.jpg", "1688", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1034, "口红", "INTO YOU女主角唇泥哑光口红唇釉不易沾杯生日礼物女EM08赤陶土色 2g", 49, "JD_口红_45.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1035, "口红", "橘朵（Judydoll）【刘浩存同款】小毛球口红唇粉霜不沾杯圣诞礼物女#N01橘委屈", 59.8, "JD_口红_42.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1036, "口红", "卡姿兰（Carslan）粉悦木马口红礼盒雾感哑光唇膏不易沾杯mini6支套装 圣诞礼物女生", 79, "JD_口红_11.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1037, "口红", "欧莱雅黑管口红233肉桂蜜桃豆沙哑光素颜显白唇膏圣诞礼物送女友", 129, "JD_口红_40.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1038, "口红", "3CE口红唇绒围炉棕#09TAUPEBEIGE唇膏圣诞礼物送女友", 139, "JD_口红_9.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1039, "口红", "M.A.C魅可黑魔杖细管mac口红柔雾哑光显白#893甜肉桂 生日礼物女", 150, "JD_口红_29.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1040, "口红", "完美日记第二代仿生膜精华口红703滋润淡纹生日新年圣诞礼物女", 160, "JD_口红_8.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1041, "口红", "完美日记第二代仿生膜精华口红712滋润淡纹生日新年圣诞礼物女", 160, "JD_口红_19.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1042, "口红", "阿玛尼（ARMANI）红管唇釉#405番茄红 丝绒哑光显白口红送礼好物 圣诞礼物送女友", 169.9, "JD_口红_34.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1043, "口红", "兰蔻(LANCOME)兰蔻菁纯口红 小蛮腰雾面哑光唇膏 经典显白 全新柔润丝缎唇膏95哑光口红微醺甜茶 196朱砂 兰蔻口红196号", 178, "SN_口红_5.jpg", "苏宁", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1044, "口红", "兰蔻(LANCOME)口红女士菁纯丝绒雾面哑光唇膏196 196朱砂橘（哑光）", 188, "SN_口红_1.jpg", "苏宁", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1045, "口红", "[国内专柜新款]迪奥 烈艳蓝金唇膏3.5g 999#丝绒口红 传奇红唇", 196, "SN_口红_8.jpg", "苏宁", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1046, "口红", "[国内专柜新款]迪奥烈艳蓝金唇膏3.5g 720#丝绒口红 豆沙红棕色", 196, "SN_口红_10.jpg", "苏宁", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1047, "口红", "古驰gucci口红礼盒绒雾505哑光208化妆品套装生日礼物送女友 【热卖】绒雾208 轻雾蜜桃", 197.9, "JD_口红_20.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1048, "口红", "Tom Ford汤姆福特TF口红 TF黑管新品显色口红 3g 16#SCARLET ROUGE 正品送礼物", 198, "SN_口红_9.jpg", "苏宁", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1049, "口红", "古驰（GUCCI）口红礼盒倾色绒雾唇膏 情倾阿根廷#208 节日生日礼物送女友", 198, "JD_口红_6.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1050, "口红", "纪梵希（Givenchy）【限时直降 下单立减】高定红丝绒口红唇膏N28 3.4g", 199, "JD_口红_24.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1051, "口红", "纪梵希（Givenchy）【限时直降 下单立减】高定粉丝绒口红唇膏N50 复古茶棕", 199, "JD_口红_28.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1052, "口红", "古驰（GUCCI）口红礼盒倾色绒雾唇膏 复古珍妮特#505 节日生日礼物送女友", 205, "JD_口红_33.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1053, "口红", "M.A.C魅可尤雾弹mac口红哑光雾面轻薄#316小辣椒 圣诞礼物生日礼物女", 210, "JD_口红_3.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1054, "口红", "古驰gucci口红礼盒绒雾505哑光208化妆品套装生日礼物送女友 【新品】绒雾217 玫瑰奶栗", 218, "JD_口红_22.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1055, "口红", "花西子【吴谨言同款】同心锁口红M1314红枫柿子3.2g送女友礼物", 219, "JD_口红_44.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1056, "口红", "[送礼优选 礼袋装]YSL圣罗兰小金条口红#1966暖棕红2.2g (礼袋装", 223, "SN_口红_2.jpg", "苏宁", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1057, "口红", "[送礼优选]TF汤姆福特黑金黑管口红#16番茄红SCARLETROUGE3g(限拍2件", 223, "SN_口红_4.jpg", "苏宁", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1058, "口红", "[送礼优选 礼袋装]YSL圣罗兰哑光细管口红小金条#1966暖棕红2.2g送礼优选(限拍2件", 223, "SN_口红_6.jpg", "苏宁", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1059, "口红", "[送礼优选 礼袋装]YSL圣罗兰小金条口红#1966暖棕红2.2g 礼袋装", 223, "SN_口红_7.jpg", "苏宁", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1060, "口红", "M.A.C魅可mac口红尤雾弹限定四支装礼盒 生日礼物女 送女友", 229, "JD_口红_38.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1061, "口红", "[送礼优选 礼盒装]TF汤姆福特黑金黑管口红#16番茄红3g(配赠礼盒+礼袋)(限拍2件,多拍不发货)", 235, "SN_口红_3.jpg", "苏宁", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1062, "口红", "古驰（GUCCI）口红礼盒倾色绒雾唇膏 瓦莱丽娅玫瑰 #217 节日生日礼物送女友", 235, "JD_口红_12.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1063, "口红", "古驰口红505唇膏碎花口红礼盒百搭色生日礼物女生圣诞节礼物送女友 【NO.1】金管哑光505#枫叶红棕", 239, "JD_口红_30.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1064, "口红", "古驰口红505唇膏碎花口红礼盒百搭色生日礼物女生圣诞节礼物送女友 【NO.1】金管哑光505#枫叶红棕", 239, "JD_口红_32.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1065, "口红", "雅诗兰黛细金管唇膏222#不可停炙色口红礼盒化妆品圣诞礼物送女友", 280, "JD_口红_37.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1066, "口红", "雅诗兰黛绒雾哑光唇膏333#干枫叶色口红礼盒化妆品圣诞礼物送女友送老婆", 350, "JD_口红_43.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1067, "口红", "兰蔻196口红哑光雾面唇膏经典朱砂橘 化妆套装礼盒生日圣诞礼物送女友", 360, "JD_口红_7.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1068, "口红", "兰蔻296口红丝绒雾面哑光 上瘾红唇膏倪妮同款礼盒生日圣诞礼物送女友", 360, "JD_口红_15.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1069, "口红", "兰蔻218口红柔雾半哑光 微醺裸唇膏口红化妆品礼盒生日圣诞礼物送女友", 360, "JD_口红_26.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1070, "口红", "迪奥DIOR魅惑变色润唇膏 004珊瑚色口红滋润保湿显色 圣诞礼物送女友", 380, "JD_口红_10.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1071, "口红", "香奈儿（Chanel） 口红限定COCO可可小姐白管滋润唇膏圣诞节情人节礼物送女友老婆 920#草莓奶昔", 388, "JD_口红_35.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1072, "口红", "YSL圣罗兰黑管镜面唇釉416口红滋润显色圣诞礼物生日礼物女送女友", 400, "JD_口红_1.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1073, "口红", "YSL圣罗兰小金条口红1966红棕色哑光化妆品圣诞礼物生日礼物女送女友", 400, "JD_口红_2.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1074, "口红", "迪奥DIOR烈艳蓝金口红999丝绒哑光唇膏享礼袋 显色圣诞礼物生日礼物女", 400, "JD_口红_4.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1075, "口红", "阿玛尼红管唇釉#405番茄红 显白口红秋冬润唇 圣诞礼物生日礼盒送女友", 400, "JD_口红_14.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1076, "口红", "迪奥DIOR烈艳蓝金口红720丝绒哑光唇膏 唇膏化妆品圣诞礼物生日礼物女", 400, "JD_口红_21.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1077, "口红", "YSL圣罗兰黑管镜面唇釉610口红滋润显色圣诞礼物生日礼物女送女友", 400, "JD_口红_23.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1078, "口红", "YSL圣罗兰小黑条口红302哑光化妆品圣诞礼物生日礼物女送女友", 400, "JD_口红_36.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1079, "口红", "纪梵希（Givenchy）高定粉丝绒口红唇膏N27 蜜雪雾桃 圣诞礼物生日礼物送女友", 400, "JD_口红_39.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1080, "口红", "YSL圣罗兰黑管镜面唇釉416口红滋润显色圣诞礼物生日礼物女送女友", 400, "JD_口红_41.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1081, "口红", "YSL圣罗兰小黑条冷茶裸314金银限定化妆品圣诞礼物生日礼物女送女友", 420, "JD_口红_27.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1082, "口红", "迪奥DIOR烈艳蓝金迷你唇膏口红礼盒1.5g*3(999+200+720)圣诞生日礼物", 450, "JD_口红_5.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1083, "口红", "TOM FORD全新升级黑管水感缎光TF口红06欲感裸桃色 唇膏化妆品生日礼物", 520, "JD_口红_16.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1084, "口红", "TOM FORD明星同款【全新升级】黑管水感缎光TF口红16经典正红唇膏生日礼物", 520, "JD_口红_17.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1085, "口红", "YSL圣罗兰口红唇膏礼盒1966 314化妆品圣诞礼物生日礼物女送女友", 820, "JD_口红_18.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1086, "口红", "华伦天奴香水口红礼盒唇香礼盒圣诞礼物送女生", 1600, "JD_口红_25.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1087, "口红", "华伦天奴香水口红礼盒唇香礼盒圣诞礼物送女生", 1600, "JD_口红_31.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1088, "口红", "YSL圣罗兰口红香水礼盒限定圆管209+限定自由之水圣诞礼物生日礼物女", 1640, "JD_口红_13.jpg", "京东", 54, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1154, "水壶", "大厂供应折叠式水壶家用出国旅行便携小型迷你保温烧水壶", 4, "水壶_1688_img6.jpg", "1688", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1155, "水壶", "网红大肚杯大容量儿童塑料水杯夏季便携水壶学生吸管杯吨吨桶定制", 4.5, "水壶_1688_img7.jpg", "1688", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1156, "水壶", "不锈钢烧水壶水壶平底家用礼品半球型鸣音平底电磁炉开水壶热水壶", 6.5, "水壶_1688_img5.jpg", "1688", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1157, "水壶", "跨境大容量运动水壶316不锈钢保温杯弹盖款手提壶带吸管户外水杯", 14.5, "水壶_1688_img3.jpg", "1688", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1158, "水壶", "法压壶加厚高硼硅玻璃家用法式滤压壶煮咖啡器具冲茶器咖啡手冲壶", 14.5, "水壶_1688_img9.jpg", "1688", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1159, "水壶", "新品源头厂家速发跨境旅行便携式折叠硅胶电热水壶烧水壶家电礼品", 17, "水壶_1688_img8.jpg", "1688", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1160, "水壶", "不锈钢烧水壶大水壶家用开水壶大容量鸣音水壶家用壶喝水壶", 17.8, "水壶_1688_img1.jpg", "1688", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1161, "水壶", "316不锈钢保温壶焖茶壶家用泡茶壶小容量便携咖啡壶商务办公水杯", 18, "水壶_1688_img4.jpg", "1688", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1162, "水壶", "保温杯批发大容量热水瓶户外便携车载旅行暖水316不锈钢保温水壶", 22.11, "水壶_1688_img2.jpg", "1688", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1163, "水壶", "欣美雅保温壶家用保温水壶大容量学生宿舍用保温瓶茶瓶户外开水瓶热水瓶 白色1.0/1.3/1.6/ 2L （多款可选） 2000毫升", 24.4, "JD_水壶_36.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1164, "水壶", "半球半球牌电热水壶家用保温一体自动开水煮电壶快壶电热烧水2024新款 2L象牙色【不保温】无缝内胆", 26.69, "JD_水壶_37.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1165, "水壶", "半球 （PESKOE）烧水壶热水壶电热水壶一体全自动恒温大容量家用快速壶开水壶双层防烫便携式电水壶 亮黑（加厚不保温款） 2L", 27.24, "JD_水壶_28.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1166, "水壶", "澳柯玛（AUCMA）电热水壶 304不锈钢双层防烫 1.8L大容量 烧水壶暖水壶开水壶电水瓶 ADK-1500DY13", 35.9, "JD_水壶_29.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1167, "水壶", "JEKO&JEKO保温壶家用热水瓶暖水壶宿舍大容量开水瓶玻璃内胆 1.6L丝绸灰", 38.9, "JD_水壶_44.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1168, "水壶", "嘉特（GiNT）保温壶家用大容量热水瓶玻璃内胆暖壶老式开水瓶学生宿舍暖瓶水壶", 39, "JD_水壶_4.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1169, "水壶", "荣事达电水壶热水壶1.8L电热水壶304不锈钢1500W暖水壶烧水壶开水壶智能断电RS-KT18G/551", 41.65, "SN_水壶_8.jpg", "苏宁", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1170, "水壶", "苏泊尔(SUPOR)电水壶1.5L大容量自动断电电热水壶保温防烫防干烧自动断电不锈钢内胆烧水壶15T66B", 50.15, "SN_水壶_2.jpg", "苏宁", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1171, "水壶", "九阳（Joyoung）【国家补贴】热水壶烧水壶电水壶 双层壶体 304不锈钢 1.5L家用0胶水电水壶 K15FD-W123", 55, "JD_水壶_10.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1172, "水壶", "苏泊尔(SUPOR)电水壶1.7L大容量家用不锈钢烧水壶自动断电大容量开水壶 1.7LSW-17T12C", 58.65, "SN_水壶_4.jpg", "苏宁", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1173, "水壶", "苏泊尔(SUPOR)电水壶1.7L大容量家用不锈钢烧水壶自动断电大容量开水壶 1.7LSW-17T12D", 58.65, "SN_水壶_6.jpg", "苏宁", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1174, "水壶", "美的（Midea）【国家补贴】电热水壶煮水壶家用烧水壶 食品级304不锈钢 双层防烫无缝内胆 1.5升大容量 1566", 59, "JD_水壶_1.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1175, "水壶", "苏泊尔（SUPOR）【国家补贴】电水壶 烧水壶 双层防烫 热水壶 1.5L大容量 电热水壶 开水壶 SW-15J629", 59, "JD_水壶_21.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1176, "水壶", "小熊（Bear）烧水壶 电热水壶 电水壶家用 智能双层防烫自动断电极速烧水 ZDH-H15L6 1.5L大容量", 59.9, "JD_水壶_8.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1177, "水壶", "温控手冲咖啡壶智能家用烧水壶细嘴多档茶咖壶电热水壶恒温咖啡壶", 65, "水壶_1688_img10.jpg", "1688", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1178, "水壶", "苏泊尔(SUPOR)电水壶热水壶 2L大容量全钢无缝双层防烫电热水壶 304不锈钢烧水壶 SW-20J03A", 67.15, "SN_水壶_3.jpg", "苏宁", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1179, "水壶", "美的（Midea）养生壶 1.5L全自动煮茶壶 24h预约烧水壶 12小时智能恒温 11档控温电热水壶 花茶壶煮茶器MK-Y12Q", 68.9, "JD_水壶_6.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1180, "水壶", "米家小米烧水壶电热水壶煮水壶家用 食品级304不锈钢 1500W快速加热 自动断电 1.5升大容量N1", 69, "JD_水壶_5.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1181, "水壶", "苏泊尔（SUPOR）【国家补贴】电水壶 双层防烫烧水壶热水壶 全钢无缝内胆电热水壶SW-17J418 1.7L大容量", 69, "JD_水壶_9.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1182, "水壶", "富光保温壶2.2L大容量304不锈钢保温瓶家用暖壶按压式热水壶开水瓶", 69, "JD_水壶_12.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1183, "水壶", "米家小米电水壶N1 热水壶304不锈钢双层防烫1500W速热暖水壶烧水壶智能断电 米家电水壶 1.5L", 69, "JD_水壶_16.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1184, "水壶", "京东京造烧水壶热水壶1.7L 电热水壶55℃自动保温家用电水壶 速热一体无缝内胆304食品级不锈钢水壶烧水", 69, "JD_水壶_22.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1185, "水壶", "苏泊尔（SUPOR）【国家补贴】养生壶 1.5L大容量 煮茶器花茶壶 恒温烧水壶电热水壶 办公室保温煮茶壶 SW-15YJ02", 69, "JD_水壶_24.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1186, "水壶", "【累计100万评价，长效保温】富光大容量内外304不锈钢保温壶", 69, "JD_水壶_31.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1187, "水壶", "苏泊尔（SUPOR）【国家补贴】电水壶 双层防烫烧水壶热水壶 全钢无缝内胆电热水壶SW-17J419 1.7L大容量", 69, "JD_水壶_35.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1188, "水壶", "小熊（Bear）养生壶 煮茶壶 恒温水壶 保温烧水一体智能电热水壶花茶壶 11档保温 1.5L大容量 YSH-J15Z7", 69.9, "JD_水壶_2.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1189, "水壶", "美的（Midea）【国家补贴】电水壶烧水壶热水壶 食品级304不锈钢双层防烫暖水壶1.7升大容量开水壶MK-SH17M301", 79, "JD_水壶_18.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1190, "水壶", "九阳（Joyoung）【国家补贴】热水壶烧水壶电水壶 2L速热304不锈钢一体无缝内胆 0胶水开水壶 K20FD-W182", 79, "JD_水壶_30.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1191, "水壶", "京东京造 保温瓶 家用大容量热水瓶户外保温瓶暖壶 304不锈钢白色2.2L", 79.9, "JD_水壶_15.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1192, "水壶", "米家小米养生壶烧水壶恒温电热水壶煮茶壶泡茶器一体机304不锈钢米家小白壶 家用办公室 附茶漏N1 1.5L", 89, "JD_水壶_11.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1193, "水壶", "苏泊尔SUPOR时尚鸣音304不锈钢水壶5L烧水壶燃气专用SS50Q1", 89, "JD_水壶_34.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1194, "水壶", "九阳（Joyoung）【国家补贴】热水壶烧水壶电水壶1.5L 5段水温 304不锈钢一体无缝 0胶水 恒温壶K15ED-W520", 89, "JD_水壶_39.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1195, "水壶", "美的（Midea）电水壶热水壶 大容量家用烧水壶 双层防烫开水壶 304不锈钢无缝内胆 大功率快速烧水沸腾多重防护 1.5L 【一键开盖I无缝内胆】HJ1566", 99, "JD_水壶_43.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1196, "水壶", "【店长推荐】富光家用真空保温水壶2.0L大容量开水瓶暖水壶保温瓶热水瓶", 109, "JD_水壶_3.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1197, "水壶", "飞利浦(PHILIPS)电水壶 恒温家用大功率热水壶 一键保温 304不锈钢1.5L 双层防烫烧水壶HD9366", 119, "SN_水壶_5.jpg", "苏宁", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1198, "水壶", "苏泊尔(SUPOR )SW-17S32A 电水壶电热水壶防烫保温 304不锈钢烧水壶1.7L", 129, "SN_水壶_1.jpg", "苏宁", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1199, "水壶", "小米保温壶 家用保温水壶 大容量真空暖水瓶 户外 316L不锈钢旅行壶2L", 129, "JD_水壶_26.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1200, "水壶", "苏泊尔(SUPOR)电水壶2L大容量316L不锈钢一键保温电热水壶双层防烫自动断电开水壶新品 SW-20J01P", 135.15, "SN_水壶_7.jpg", "苏宁", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1201, "水壶", "苏泊尔（SUPOR）保温壶大容量不锈钢暖水壶热水瓶户外旅行壶便携车载运动保温杯子 儒雅黑 2L 【茶滤+背带】", 138, "JD_水壶_45.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1202, "水壶", "苏泊尔（SUPOR）保温壶家用大容量水壶316L不锈钢真空保温瓶热水壶暖壶开水瓶白", 139, "JD_水壶_7.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1203, "水壶", "LOTOR小浣熊全玻璃养生壶迷你烧水壶保温一体全自动恒温电热水壶围炉煮茶小型煮茶器D11基础款", 139, "JD_水壶_38.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1204, "水壶", "飞利浦(PHILIPS) 电水壶 家用开水壶 304不锈钢防热水壶 1.7L大容量 干烧自动断电 HD9350/90", 149, "SN_水壶_9.jpg", "苏宁", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1205, "水壶", "米家小米电热水杯加热杯热水壶 保温烧水杯 350ml迷你便携式旅行出差 智能恒温 316L不锈钢内胆 藏蓝色", 149, "JD_水壶_33.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1206, "水壶", "苏泊尔保温壶家用大容量水壶316L不锈钢真空保温瓶热水壶暖壶开水瓶2.3L", 159, "JD_水壶_13.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1207, "水壶", "艾曼格（IMOGY）德国艾曼格保温水壶家用保温壶大容量热水壶316L不锈钢暖壶", 159, "JD_水壶_23.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1208, "水壶", "苏泊尔(SUPOR)电水壶恒温电热水壶大容量316L不锈钢烧水壶家用全自动保温电水壶SW-17T20A", 160.65, "SN_水壶_10.jpg", "苏宁", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1209, "水壶", "九阳（Joyoung）【国家补贴】电热水瓶热水壶 5L 七段保温304不锈钢内胆 0胶水恒温电水壶烧水壶 K50-P611", 169, "JD_水壶_40.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1210, "水壶", "九阳（Joyoung）净萃养生壶迷你家用全玻璃煮茶器 轻音炖煮 1L办公室0金属0胶水恒温烧水壶 WY103", 179, "JD_水壶_17.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1211, "水壶", "苏泊尔（SUPOR）养生壶电热水壶烧水壶煮茶器加厚玻璃316L不锈钢滤网保温煮茶壶1.5L花茶壶电水壶 SW-15YJ36", 199, "JD_水壶_19.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1212, "水壶", "松下（Panasonic）【 国家补贴】实时显温多段温控保温烧水壶 黑色1.5升304不锈钢内胆 电热水壶 NC-TD151", 199, "JD_水壶_42.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1213, "水壶", "苏泊尔（SUPOR）即热式饮水机 1S速热家用桌面台式小型直饮机一体免安装电水壶净饮机 SW-JR30T06", 249, "JD_水壶_32.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1214, "水壶", "米家小米智能电热水瓶烧水壶保温一体机 玻璃内胆无异味 智能恒温 精准调温控温 冲奶神器 大容量5L", 279, "JD_水壶_14.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1215, "水壶", "OIDIRE 德国OIDIRE 养生壶 煮茶壶煮茶器 办公室全玻璃花茶养生壶烧水壶电热水壶炖煮壶一体迷你智能保温 1L -ODI-HC01花茶养生壶【带滤网】", 319, "JD_水壶_41.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1216, "水壶", "苏泊尔（SUPOR）【国家补贴】电热水瓶双层电热水壶烧水壶5L大容量316L不锈钢电水瓶多段保温恒温电水壶 SW-50T302", 558, "JD_水壶_27.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1217, "水壶", "美的（Midea）小魔方pro电热水瓶电水瓶 烧水壶电热水壶316L不锈钢 风冷保温恒温0塑料可拆以旧换新补贴31FPro", 799, "JD_水壶_20.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1218, "水壶", "RASW德国品质全玻璃养生壶恒温水壶婴儿专用烧水壶家用热水壶冲奶泡奶机调奶玻璃底一体无胶圈大容量 白色 全玻璃无水垢红外加热", 1099, "JD_水壶_25.jpg", "京东", 56, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1219, "雨伞", "全自动雨伞男大号双人女晴雨两用遮阳伞防晒伞防紫外线广告印logo", 2.3, "雨伞_1688_img10.jpg", "1688", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1220, "雨伞", "十骨商务加大全自动加厚黑胶折叠太阳伞雨伞批发广告印logo礼品伞", 3, "雨伞_1688_img8.jpg", "1688", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1221, "雨伞", "24骨折叠伞高级感全自动黑胶遮阳防晒太阳伞男士晴雨两用雨伞定制", 5.5, "雨伞_1688_img2.jpg", "1688", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1222, "雨伞", "全自动32骨加大雨伞晴雨俩用黑胶防紫外线遮阳伞雨伞折叠伞高级感", 5.5, "雨伞_1688_img6.jpg", "1688", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1223, "雨伞", "24骨全自动雨伞男大量批发广告伞女晴雨两用遮阳防晒防紫外线太阳", 5.8, "雨伞_1688_img7.jpg", "1688", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1224, "雨伞", "全自动雨伞男士加固晴雨两用三折伞女防晒遮阳伞折叠太阳伞广告伞", 6.8, "雨伞_1688_img1.jpg", "1688", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1225, "雨伞", "商务简约伞三折加厚黑胶双人伞晴雨两用遮阳伞广告太阳伞厂家批发", 7.5, "雨伞_1688_img5.jpg", "1688", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1226, "雨伞", "雨伞自动大号抗风暴加固晴雨两用折叠伞黑胶防紫外线广告雨伞现货", 8.5, "雨伞_1688_img9.jpg", "1688", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1227, "雨伞", "伞自动24骨雨伞批发大号超大太阳伞防紫外线黑胶女防晒遮阳伞工厂", 8.8, "雨伞_1688_img3.jpg", "1688", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1228, "雨伞", "迷你太阳伞女晴雨两用防紫外线遮阳伞便携胶囊广告防晒伞logo雨伞", 11.5, "雨伞_1688_img4.jpg", "1688", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1229, "雨伞", "32骨雨伞男折叠全自动伞女学生大号防晒晴雨两用太阳伞ins遮阳伞", 20.98, "SN_雨伞_8.jpg", "苏宁", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1230, "雨伞", "天堂伞 三折雨伞晴雨伞男女商务伞57cm*7骨 339格1283", 28.9, "SN_雨伞_3.jpg", "苏宁", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1231, "雨伞", "天堂伞三折银胶晴雨伞遮阳伞太阳伞商务伞两用伞57*8骨防晒防紫外线UPF50+ 336TPA 1283", 28.9, "SN_雨伞_4.jpg", "苏宁", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1232, "雨伞", "天堂伞 三折叠雨伞64cm*10骨加大加固晴雨伞商务伞遮阳伞 双人加大字母字母1283", 34.9, "SN_雨伞_5.jpg", "苏宁", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1233, "雨伞", "天堂伞 加大加固双人经典三折晴雨伞商务伞64CM*10K 3311E1283 深藏青", 37.9, "SN_雨伞_7.jpg", "苏宁", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1234, "雨伞", "天堂伞 黑胶防晒三折晴雨伞太阳伞遮阳伞 银杏蓝色1283", 39.8, "SN_雨伞_9.jpg", "苏宁", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1235, "雨伞", "天堂伞 三折叠晴雨全遮光黑胶太阳伞遮阳伞55cm*8骨 萌猫乐园1283", 45.8, "SN_雨伞_6.jpg", "苏宁", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1236, "雨伞", "天堂伞 直杆伞自开长柄伞晴雨伞加大2-3人经典商务伞晴雨伞193E黑色", 54, "SN_雨伞_2.jpg", "苏宁", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1237, "雨伞", "天堂伞 自动伞三折安全自开收黑胶插画晴雨伞防紫外线太阳伞遮阳伞礼品伞55cm*8骨 晚霞桥1283", 88, "SN_雨伞_10.jpg", "苏宁", 58, "a");
INSERT INTO prices (id, name, detail, price, img_guid, plat, flower_id, href) VALUES (1238, "雨伞", "敬平拐杖伞可调节拐棍雨伞拐杖防滑老人伞防晒长柄登山徒步户外手杖伞", 99, "SN_雨伞_1.jpg", "苏宁", 58, "a");
-- ----------------------------
-- Table structure for species
-- ----------------------------
DROP TABLE IF EXISTS `species`;
CREATE TABLE `species` (
  `id` int NOT NULL AUTO_INCREMENT,
  `species_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `species` (`species_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of species
-- ----------------------------


INSERT INTO species (id, species_name) VALUES (12, "其他");
INSERT INTO species (id, species_name) VALUES (13, "居家");
INSERT INTO species (id, species_name) VALUES (17, "数码");
INSERT INTO species (id, species_name) VALUES (20, "文具");
INSERT INTO species (id, species_name) VALUES (16, "母婴");
INSERT INTO species (id, species_name) VALUES (15, "穿搭");
INSERT INTO species (id, species_name) VALUES (19, "美妆");
INSERT INTO species (id, species_name) VALUES (14, "美食");
INSERT INTO species (id, species_name) VALUES (18, "运动");
-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`),
  UNIQUE KEY `unique_address` (`address`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO users (id, account, name, password, phone, address, role) VALUES (2, "admin", "系统管理员", "123456", "123456", "3192179121@qq.com", "admin");
INSERT INTO users (id, account, name, password, phone, address, role) VALUES (11, "maxinyan", "马欣言222", "123456", "17392489199", "2199468760@qq.com", "user");
INSERT INTO users (id, account, name, password, phone, address, role) VALUES (18, "maxinyan1", "mxy111", "12345678", "17392489108", "maxinyan1@gmail.com", "user");
INSERT INTO users (id, account, name, password, phone, address, role) VALUES (23, "maxinyan2", "mxy222", "1232456", "17392489198", "gjkuwnlals03@hotmail.com", "user");

SET FOREIGN_KEY_CHECKS = 1;
