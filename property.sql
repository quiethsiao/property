SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


CREATE TABLE IF NOT EXISTS `basic_info` (
  `id` int(10) unsigned NOT NULL DEFAULT '10000' COMMENT 'ID',
  `name` varchar(20) NOT NULL COMMENT '小区名称',
  `region` int(6) unsigned NOT NULL COMMENT '所在地',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `zip` varchar(6) NOT NULL DEFAULT '0' COMMENT '邮编',
  `property_class` tinyint(4) NOT NULL COMMENT '建筑类型',
  `developers` varchar(30) NOT NULL DEFAULT '' COMMENT '开发商',
  `building_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '建筑楼数量',
  `carport_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '车位数量',
  `household_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '住户数量',
  `resident_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '居民数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='基本信息';

INSERT INTO `basic_info` (`id`, `name`, `region`, `address`, `zip`, `property_class`, `developers`, `building_count`, `carport_count`, `household_count`, `resident_count`) VALUES
(10000, '新城国际', 110105, '朝阳朝外大街6号(朝外大街路口南150米)', '010000', 1, '北京万置房地产开发有限公司', 0, 0, 0, 0);

CREATE TABLE IF NOT EXISTS `building` (
  `id` int(10) unsigned NOT NULL COMMENT '楼号',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '楼名',
  `completion_year` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '建筑年份',
  `stories` smallint(5) unsigned NOT NULL COMMENT '楼层数量',
  `house_number` int(10) unsigned NOT NULL COMMENT '住房总数量',
  `household_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '住户数量',
  `crt_by` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加人',
  `crt_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `up_by` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `up_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='单元楼';

INSERT INTO `building` (`id`, `name`, `completion_year`, `stories`, `house_number`, `household_count`, `crt_by`, `crt_time`, `up_by`, `up_time`) VALUES
(1, '#1', 0, 20, 80, 0, 1, 1378288691, 0, 0);

CREATE TABLE IF NOT EXISTS `carport` (
  `id` int(10) unsigned NOT NULL COMMENT '编号',
  `household_id` int(10) unsigned NOT NULL COMMENT '所属住户',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '说明',
  `crt_by` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加人',
  `crt_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `up_by` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `up_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='车位';


CREATE TABLE IF NOT EXISTS `household` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `building_id` int(10) unsigned NOT NULL COMMENT '楼号',
  `entrance` tinyint(3) unsigned NOT NULL COMMENT '单元',
  `floor` smallint(6) NOT NULL COMMENT '楼层',
  `number` tinyint(3) unsigned NOT NULL COMMENT '房间号',
  `covered_area` float(9,2) unsigned NOT NULL COMMENT '建筑面积',
  `has_gas` tinyint(4) NOT NULL DEFAULT '0' COMMENT '天燃气',
  `size` tinyint(4) NOT NULL DEFAULT '0' COMMENT '居住人数',
  `householder` int(10) unsigned NOT NULL COMMENT '户主',
  `is_rent` tinyint(4) NOT NULL COMMENT '是否租住',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `crt_by` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加人',
  `crt_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `up_ty` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `up_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `building_id` (`building_id`),
  KEY `householder` (`householder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='住户' AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `lookup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL COMMENT '键值对类型',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '键值Value',
  `code` varchar(30) NOT NULL COMMENT '键值',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '值简要说明',
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='键值对属性表' AUTO_INCREMENT=94 ;

INSERT INTO `lookup` (`id`, `type`, `name`, `code`, `position`, `description`) VALUES
(1, 'sex', '男', 'M', 1, '性别：男'),
(2, 'sex', '女', 'F', 2, '性别：女'),
(3, 'education', '研究生及以上', '10', 10, ''),
(4, 'education', '大学本科', '20', 20, ''),
(5, 'education', '大学专科', '30', 30, ''),
(6, 'education', '中专', '40', 40, ''),
(7, 'education', '高中', '60', 60, ''),
(8, 'education', '初中', '70', 70, ''),
(9, 'education', '小学', '80', 80, ''),
(27, 'nation', '汉族', '1', 1, '汉族'),
(28, 'nation', '满族', '2', 2, '满族'),
(29, 'nation', '侗族', '3', 3, '侗族'),
(30, 'nation', '瑶族', '4', 4, '瑶族'),
(31, 'nation', '白族', '5', 5, '白族'),
(32, 'nation', '土家族', '6', 6, '土家族'),
(33, 'nation', '哈尼族', '7', 7, '哈尼族'),
(34, 'nation', '哈萨克族', '8', 8, '哈萨克族'),
(35, 'nation', '傣族', '9', 9, '傣族'),
(36, 'nation', '黎族', '10', 10, '黎族'),
(37, 'nation', '傈僳族', '11', 11, '傈僳族'),
(38, 'nation', '佤族', '12', 12, '佤族'),
(39, 'nation', '畲族', '13', 13, '畲族'),
(40, 'nation', '高山族', '14', 14, '高山族'),
(41, 'nation', '拉祜族', '15', 15, '拉祜族'),
(42, 'nation', '水族', '16', 16, '水族'),
(43, 'nation', '东乡族', '17', 17, '东乡族'),
(44, 'nation', '纳西族', '18', 18, '纳西族'),
(45, 'nation', '景颇族', '19', 19, '景颇族'),
(46, 'nation', '柯尔克孜族', '20', 20, '柯尔克孜族'),
(47, 'nation', '土族', '21', 21, '土族'),
(48, 'nation', '达斡尔族', '22', 22, '达斡尔族'),
(49, 'nation', '仫佬族', '23', 23, '仫佬族'),
(50, 'nation', '羌族', '24', 24, '羌族'),
(51, 'nation', '布朗族', '25', 25, '布朗族'),
(52, 'nation', '撒拉族', '26', 26, '撒拉族'),
(53, 'nation', '毛难族', '27', 27, '毛难族'),
(54, 'nation', '仡佬族', '28', 28, '仡佬族'),
(55, 'nation', '锡伯族', '29', 29, '锡伯族'),
(56, 'nation', '阿昌族', '30', 30, '阿昌族'),
(57, 'nation', '普米族', '31', 31, '普米族'),
(58, 'nation', '塔吉克族', '32', 32, '塔吉克族'),
(59, 'nation', '怒族', '33', 33, '怒族'),
(60, 'nation', '乌孜别克族', '34', 34, '乌孜别克族'),
(61, 'nation', '俄罗斯族', '35', 35, '俄罗斯族'),
(62, 'nation', '鄂温克族', '36', 36, '鄂温克族'),
(63, 'nation', '崩龙族', '37', 37, '崩龙族'),
(64, 'nation', '保安族', '38', 38, '保安族'),
(65, 'nation', '裕固族', '39', 39, '裕固族'),
(66, 'nation', '京族', '40', 40, '京族'),
(67, 'nation', '塔塔尔族', '41', 41, '塔塔尔族'),
(68, 'nation', '独龙族', '42', 42, '独龙族'),
(69, 'nation', '鄂伦春族', '43', 43, '鄂伦春族'),
(70, 'nation', '赫哲族', '44', 44, '赫哲族'),
(71, 'nation', '门巴族', '45', 45, '门巴族'),
(72, 'nation', '珞巴族', '46', 46, '珞巴族'),
(73, 'nation', '基诺族', '47', 47, '基诺族'),
(74, 'nation', '蒙古族', '48', 48, '蒙古族'),
(75, 'nation', '回族', '49', 49, '回族'),
(76, 'nation', '藏族', '50', 50, '藏族'),
(77, 'nation', '维吾尔族', '51', 51, '维吾尔族'),
(78, 'nation', '苗族', '52', 52, '苗族'),
(79, 'nation', '彝族', '53', 53, '彝族'),
(80, 'nation', '壮族', '54', 54, '壮族'),
(81, 'nation', '布依族', '55', 55, '布依族'),
(82, 'nation', '朝鲜族', '56', 56, '朝鲜族'),
(83, 'nation', '其他', '57', 57, '其他'),
(84, 'nation', '外国血统', '58', 58, '外国血统');

CREATE TABLE IF NOT EXISTS `maintenance_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL COMMENT '维修日期',
  `technician` varchar(20) NOT NULL COMMENT '维修技术员',
  `project` varchar(30) NOT NULL COMMENT '维修项目',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '项目说明',
  `amount` float(9,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '额外花费',
  `crt_by` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加人',
  `crt_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `up_by` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `up_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='维修记录' AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `salt` varchar(64) NOT NULL DEFAULT '' COMMENT '密码混淆串',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `is_super` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否超级管理员',
  `login_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `last_login` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `crt_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `crt_by` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加人',
  `up_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `up_by` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='管理员' AUTO_INCREMENT=3 ;

INSERT INTO `manager` (`id`, `username`, `password`, `salt`, `name`, `is_super`, `login_count`, `last_login`, `status`, `crt_time`, `crt_by`, `up_time`, `up_by`) VALUES
(1, 'wgs', 'be5360fab6a9562ab9f29be961e5041b', 'wu', '系统管理员', 1, 9, 1378275804, 1, 0, 0, 0, 0),
(2, 'hamo', 'dc1192bfdbded0b3319cab18bd7e2b53', 'c1d52e2d1da666e6d91a7950d218bb7a', '汉默', 0, 3, 1378284568, 1, 1378280261, 1, 0, 0);

CREATE TABLE IF NOT EXISTS `payment_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `household_id` int(10) unsigned NOT NULL COMMENT '住户',
  `date` date NOT NULL COMMENT '缴费日期',
  `public_lighting` float(9,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '照明',
  `heating` float(9,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '取暖',
  `waste_collection` float unsigned NOT NULL DEFAULT '0' COMMENT '垃圾清理',
  `other` float unsigned NOT NULL DEFAULT '0' COMMENT '其它费用',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注说明',
  `crt_by` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加人',
  `crt_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `household_id` (`household_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='住户缴费记录' AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `region` (
  `code` int(11) NOT NULL COMMENT '编码',
  `slug` varchar(20) NOT NULL COMMENT '唯一标识',
  `name` varchar(20) NOT NULL COMMENT '名称',
  `province` int(11) NOT NULL COMMENT '省级区域',
  `city` int(11) NOT NULL DEFAULT '0' COMMENT '市',
  `level` tinyint(4) NOT NULL COMMENT '级别',
  PRIMARY KEY (`code`),
  UNIQUE KEY `slug` (`slug`),
  KEY `province` (`province`),
  KEY `level` (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行政区域';

INSERT INTO `region` (`code`, `slug`, `name`, `province`, `city`, `level`) VALUES
(110000, '110000', '北京市', 110000, 0, 1),
(110101, '110101', '东城区', 110000, 110100, 2),
(110102, '110102', '西城区', 110000, 110100, 2),
(110103, '110103', '崇文区', 110000, 110100, 2),
(110104, '110104', '宣武区', 110000, 110100, 2),
(110105, '110105', '朝阳区', 110000, 110100, 2),
(110106, '110106', '丰台区', 110000, 110100, 2),
(110107, '110107', '石景山区', 110000, 110100, 2),
(110108, '110108', '海淀区', 110000, 110100, 2),
(110109, '110109', '门头沟区', 110000, 110100, 2),
(110111, '110111', '房山区', 110000, 110100, 2),
(110112, '110112', '通州区', 110000, 110100, 2),
(110113, '110113', '顺义区', 110000, 110100, 2),
(110114, '110114', '昌平区', 110000, 110100, 2),
(110115, '110115', '大兴区', 110000, 110100, 2),
(110116, '110116', '怀柔区', 110000, 110100, 2),
(110117, '110117', '平谷区', 110000, 110100, 2),
(110228, '110228', '密云县', 110000, 110200, 2),
(110229, '110229', '延庆县', 110000, 110200, 2),
(120000, '120000', '天津市', 120000, 0, 1),
(120101, '120101', '和平区', 120000, 120100, 2),
(120102, '120102', '河东区', 120000, 120100, 2),
(120103, '120103', '河西区', 120000, 120100, 2),
(120104, '120104', '南开区', 120000, 120100, 2),
(120105, '120105', '河北区', 120000, 120100, 2),
(120106, '120106', '红桥区', 120000, 120100, 2),
(120110, '120110', '东丽区', 120000, 120100, 2),
(120111, '120111', '西青区', 120000, 120100, 2),
(120112, '120112', '津南区', 120000, 120100, 2),
(120113, '120113', '北辰区', 120000, 120100, 2),
(120114, '120114', '武清区', 120000, 120100, 2),
(120115, '120115', '宝坻区', 120000, 120100, 2),
(120116, '120116', '滨海新区', 120000, 120100, 2),
(120221, '120221', '宁河县', 120000, 120200, 2),
(120223, '120223', '静海县', 120000, 120200, 2),
(120225, '120225', '蓟县', 120000, 120200, 2),
(130000, '130000', '河北省', 130000, 0, 1),
(130100, '130100', '石家庄市', 130000, 130100, 2),
(130200, '130200', '唐山市', 130000, 130200, 2),
(130300, '130300', '秦皇岛市', 130000, 130300, 2),
(130400, '130400', '邯郸市', 130000, 130400, 2),
(130500, '130500', '邢台市', 130000, 130500, 2),
(130600, '130600', '保定市', 130000, 130600, 2),
(130700, '130700', '张家口市', 130000, 130700, 2),
(130800, '130800', '承德市', 130000, 130800, 2),
(130900, '130900', '沧州市', 130000, 130900, 2),
(131000, '131000', '廊坊市', 130000, 131000, 2),
(131100, '131100', '衡水市', 130000, 131100, 2),
(140000, '140000', '山西省', 140000, 0, 1),
(140100, '140100', '太原市', 140000, 140100, 2),
(140200, '140200', '大同市', 140000, 140200, 2),
(140300, '140300', '阳泉市', 140000, 140300, 2),
(140400, '140400', '长治市', 140000, 140400, 2),
(140500, '140500', '晋城市', 140000, 140500, 2),
(140600, '140600', '朔州市', 140000, 140600, 2),
(140700, '140700', '晋中市', 140000, 140700, 2),
(140800, '140800', '运城市', 140000, 140800, 2),
(140900, '140900', '忻州市', 140000, 140900, 2),
(141000, '141000', '临汾市', 140000, 141000, 2),
(141100, '141100', '吕梁市', 140000, 141100, 2),
(150000, '150000', '内蒙古自治区', 150000, 0, 1),
(150100, '150100', '呼和浩特市', 150000, 150100, 2),
(150200, '150200', '包头市', 150000, 150200, 2),
(150300, '150300', '乌海市', 150000, 150300, 2),
(150400, '150400', '赤峰市', 150000, 150400, 2),
(150500, '150500', '通辽市', 150000, 150500, 2),
(150600, '150600', '鄂尔多斯市', 150000, 150600, 2),
(150700, '150700', '呼伦贝尔市', 150000, 150700, 2),
(150800, '150800', '巴彦淖尔市', 150000, 150800, 2),
(150900, '150900', '乌兰察布市', 150000, 150900, 2),
(152200, '152200', '兴安盟', 150000, 152200, 2),
(152500, '152500', '锡林郭勒盟', 150000, 152500, 2),
(152900, '152900', '阿拉善盟', 150000, 152900, 2),
(210000, '210000', '辽宁省', 210000, 0, 1),
(210100, '210100', '沈阳市', 210000, 210100, 2),
(210200, '210200', '大连市', 210000, 210200, 2),
(210300, '210300', '鞍山市', 210000, 210300, 2),
(210400, '210400', '抚顺市', 210000, 210400, 2),
(210500, '210500', '本溪市', 210000, 210500, 2),
(210600, '210600', '丹东市', 210000, 210600, 2),
(210700, '210700', '锦州市', 210000, 210700, 2),
(210800, '210800', '营口市', 210000, 210800, 2),
(210900, '210900', '阜新市', 210000, 210900, 2),
(211000, '211000', '辽阳市', 210000, 211000, 2),
(211100, '211100', '盘锦市', 210000, 211100, 2),
(211200, '211200', '铁岭市', 210000, 211200, 2),
(211300, '211300', '朝阳市', 210000, 211300, 2),
(211400, '211400', '葫芦岛市', 210000, 211400, 2),
(220000, '220000', '吉林省', 220000, 0, 1),
(220100, '220100', '长春市', 220000, 220100, 2),
(220200, '220200', '吉林市', 220000, 220200, 2),
(220300, '220300', '四平市', 220000, 220300, 2),
(220400, '220400', '辽源市', 220000, 220400, 2),
(220500, '220500', '通化市', 220000, 220500, 2),
(220600, '220600', '白山市', 220000, 220600, 2),
(220700, '220700', '松原市', 220000, 220700, 2),
(220800, '220800', '白城市', 220000, 220800, 2),
(222400, '222400', '延边朝鲜族自治州', 220000, 222400, 2),
(230000, '230000', '黑龙江省', 230000, 0, 1),
(230100, '230100', '哈尔滨市', 230000, 230100, 2),
(230200, '230200', '齐齐哈尔市', 230000, 230200, 2),
(230300, '230300', '鸡西市', 230000, 230300, 2),
(230400, '230400', '鹤岗市', 230000, 230400, 2),
(230500, '230500', '双鸭山市', 230000, 230500, 2),
(230600, '230600', '大庆市', 230000, 230600, 2),
(230700, '230700', '伊春市', 230000, 230700, 2),
(230800, '230800', '佳木斯市', 230000, 230800, 2),
(230900, '230900', '七台河市', 230000, 230900, 2),
(231000, '231000', '牡丹江市', 230000, 231000, 2),
(231100, '231100', '黑河市', 230000, 231100, 2),
(231200, '231200', '绥化市', 230000, 231200, 2),
(232700, '232700', '大兴安岭地区', 230000, 232700, 2),
(310000, '310000', '上海市', 310000, 0, 1),
(310101, '310101', '黄浦区', 310000, 310100, 2),
(310103, '310103', '卢湾区', 310000, 310100, 2),
(310104, '310104', '徐汇区', 310000, 310100, 2),
(310105, '310105', '长宁区', 310000, 310100, 2),
(310106, '310106', '静安区', 310000, 310100, 2),
(310107, '310107', '普陀区', 310000, 310100, 2),
(310108, '310108', '闸北区', 310000, 310100, 2),
(310109, '310109', '虹口区', 310000, 310100, 2),
(310110, '310110', '杨浦区', 310000, 310100, 2),
(310112, '310112', '闵行区', 310000, 310100, 2),
(310113, '310113', '宝山区', 310000, 310100, 2),
(310114, '310114', '嘉定区', 310000, 310100, 2),
(310115, '310115', '浦东新区', 310000, 310100, 2),
(310116, '310116', '金山区', 310000, 310100, 2),
(310117, '310117', '松江区', 310000, 310100, 2),
(310118, '310118', '青浦区', 310000, 310100, 2),
(310120, '310120', '奉贤区', 310000, 310100, 2),
(310230, '310230', '崇明县', 310000, 310200, 2),
(320000, '320000', '江苏省', 320000, 0, 1),
(320100, '320100', '南京市', 320000, 320100, 2),
(320200, '320200', '无锡市', 320000, 320200, 2),
(320300, '320300', '徐州市', 320000, 320300, 2),
(320400, '320400', '常州市', 320000, 320400, 2),
(320500, '320500', '苏州市', 320000, 320500, 2),
(320600, '320600', '南通市', 320000, 320600, 2),
(320700, '320700', '连云港市', 320000, 320700, 2),
(320800, '320800', '淮安市', 320000, 320800, 2),
(320900, '320900', '盐城市', 320000, 320900, 2),
(321000, '321000', '扬州市', 320000, 321000, 2),
(321100, '321100', '镇江市', 320000, 321100, 2),
(321200, '321200', '泰州市', 320000, 321200, 2),
(321300, '321300', '宿迁市', 320000, 321300, 2),
(330000, '330000', '浙江省', 330000, 0, 1),
(330100, '330100', '杭州市', 330000, 330100, 2),
(330200, '330200', '宁波市', 330000, 330200, 2),
(330300, '330300', '温州市', 330000, 330300, 2),
(330400, '330400', '嘉兴市', 330000, 330400, 2),
(330500, '330500', '湖州市', 330000, 330500, 2),
(330600, '330600', '绍兴市', 330000, 330600, 2),
(330700, '330700', '金华市', 330000, 330700, 2),
(330800, '330800', '衢州市', 330000, 330800, 2),
(330900, '330900', '舟山市', 330000, 330900, 2),
(331000, '331000', '台州市', 330000, 331000, 2),
(331100, '331100', '丽水市', 330000, 331100, 2),
(340000, '340000', '安徽省', 340000, 0, 1),
(340100, '340100', '合肥市', 340000, 340100, 2),
(340200, '340200', '芜湖市', 340000, 340200, 2),
(340300, '340300', '蚌埠市', 340000, 340300, 2),
(340400, '340400', '淮南市', 340000, 340400, 2),
(340500, '340500', '马鞍山市', 340000, 340500, 2),
(340600, '340600', '淮北市', 340000, 340600, 2),
(340700, '340700', '铜陵市', 340000, 340700, 2),
(340800, '340800', '安庆市', 340000, 340800, 2),
(341000, '341000', '黄山市', 340000, 341000, 2),
(341100, '341100', '滁州市', 340000, 341100, 2),
(341200, '341200', '阜阳市', 340000, 341200, 2),
(341300, '341300', '宿州市', 340000, 341300, 2),
(341400, '341400', '巢湖市', 340000, 341400, 2),
(341500, '341500', '六安市', 340000, 341500, 2),
(341600, '341600', '亳州市', 340000, 341600, 2),
(341700, '341700', '池州市', 340000, 341700, 2),
(341800, '341800', '宣城市', 340000, 341800, 2),
(350000, '350000', '福建省', 350000, 0, 1),
(350100, '350100', '福州市', 350000, 350100, 2),
(350200, '350200', '厦门市', 350000, 350200, 2),
(350300, '350300', '莆田市', 350000, 350300, 2),
(350400, '350400', '三明市', 350000, 350400, 2),
(350500, '350500', '泉州市', 350000, 350500, 2),
(350600, '350600', '漳州市', 350000, 350600, 2),
(350700, '350700', '南平市', 350000, 350700, 2),
(350800, '350800', '龙岩市', 350000, 350800, 2),
(350900, '350900', '宁德市', 350000, 350900, 2),
(360000, '360000', '江西省', 360000, 0, 1),
(360100, '360100', '南昌市', 360000, 360100, 2),
(360200, '360200', '景德镇市', 360000, 360200, 2),
(360300, '360300', '萍乡市', 360000, 360300, 2),
(360400, '360400', '九江市', 360000, 360400, 2),
(360500, '360500', '新余市', 360000, 360500, 2),
(360600, '360600', '鹰潭市', 360000, 360600, 2),
(360700, '360700', '赣州市', 360000, 360700, 2),
(360800, '360800', '吉安市', 360000, 360800, 2),
(360900, '360900', '宜春市', 360000, 360900, 2),
(361000, '361000', '抚州市', 360000, 361000, 2),
(361100, '361100', '上饶市', 360000, 361100, 2),
(370000, '370000', '山东省', 370000, 0, 1),
(370100, '370100', '济南市', 370000, 370100, 2),
(370200, '370200', '青岛市', 370000, 370200, 2),
(370300, '370300', '淄博市', 370000, 370300, 2),
(370400, '370400', '枣庄市', 370000, 370400, 2),
(370500, '370500', '东营市', 370000, 370500, 2),
(370600, '370600', '烟台市', 370000, 370600, 2),
(370700, '370700', '潍坊市', 370000, 370700, 2),
(370800, '370800', '济宁市', 370000, 370800, 2),
(370900, '370900', '泰安市', 370000, 370900, 2),
(371000, '371000', '威海市', 370000, 371000, 2),
(371100, '371100', '日照市', 370000, 371100, 2),
(371200, '371200', '莱芜市', 370000, 371200, 2),
(371300, '371300', '临沂市', 370000, 371300, 2),
(371400, '371400', '德州市', 370000, 371400, 2),
(371500, '371500', '聊城市', 370000, 371500, 2),
(371600, '371600', '滨州市', 370000, 371600, 2),
(371700, '371700', '菏泽市', 370000, 371700, 2),
(410000, '410000', '河南省', 410000, 0, 1),
(410100, '410100', '郑州市', 410000, 410100, 2),
(410200, '410200', '开封市', 410000, 410200, 2),
(410300, '410300', '洛阳市', 410000, 410300, 2),
(410400, '410400', '平顶山市', 410000, 410400, 2),
(410500, '410500', '安阳市', 410000, 410500, 2),
(410600, '410600', '鹤壁市', 410000, 410600, 2),
(410700, '410700', '新乡市', 410000, 410700, 2),
(410800, '410800', '焦作市', 410000, 410800, 2),
(410900, '410900', '濮阳市', 410000, 410900, 2),
(411000, '411000', '许昌市', 410000, 411000, 2),
(411100, '411100', '漯河市', 410000, 411100, 2),
(411200, '411200', '三门峡市', 410000, 411200, 2),
(411300, '411300', '南阳市', 410000, 411300, 2),
(411400, '411400', '商丘市', 410000, 411400, 2),
(411500, '411500', '信阳市', 410000, 411500, 2),
(411600, '411600', '周口市', 410000, 411600, 2),
(411700, '411700', '驻马店市', 410000, 411700, 2),
(419000, '419000', '省直辖县级行政区划', 410000, 419000, 2),
(420000, '420000', '湖北省', 420000, 0, 1),
(420100, '420100', '武汉市', 420000, 420100, 2),
(420200, '420200', '黄石市', 420000, 420200, 2),
(420300, '420300', '十堰市', 420000, 420300, 2),
(420500, '420500', '宜昌市', 420000, 420500, 2),
(420600, '420600', '襄樊市', 420000, 420600, 2),
(420700, '420700', '鄂州市', 420000, 420700, 2),
(420800, '420800', '荆门市', 420000, 420800, 2),
(420900, '420900', '孝感市', 420000, 420900, 2),
(421000, '421000', '荆州市', 420000, 421000, 2),
(421100, '421100', '黄冈市', 420000, 421100, 2),
(421200, '421200', '咸宁市', 420000, 421200, 2),
(421300, '421300', '随州市', 420000, 421300, 2),
(422800, '422800', '恩施土家族苗族自治州', 420000, 422800, 2),
(429000, '429000', '省直辖县级行政区划', 420000, 429000, 2),
(430000, '430000', '湖南省', 430000, 0, 1),
(430100, '430100', '长沙市', 430000, 430100, 2),
(430200, '430200', '株洲市', 430000, 430200, 2),
(430300, '430300', '湘潭市', 430000, 430300, 2),
(430400, '430400', '衡阳市', 430000, 430400, 2),
(430500, '430500', '邵阳市', 430000, 430500, 2),
(430600, '430600', '岳阳市', 430000, 430600, 2),
(430700, '430700', '常德市', 430000, 430700, 2),
(430800, '430800', '张家界市', 430000, 430800, 2),
(430900, '430900', '益阳市', 430000, 430900, 2),
(431000, '431000', '郴州市', 430000, 431000, 2),
(431100, '431100', '永州市', 430000, 431100, 2),
(431200, '431200', '怀化市', 430000, 431200, 2),
(431300, '431300', '娄底市', 430000, 431300, 2),
(433100, '433100', '湘西土家族苗族自治州', 430000, 433100, 2),
(440000, '440000', '广东省', 440000, 0, 1),
(440100, '440100', '广州市', 440000, 440100, 2),
(440200, '440200', '韶关市', 440000, 440200, 2),
(440300, '440300', '深圳市', 440000, 440300, 2),
(440400, '440400', '珠海市', 440000, 440400, 2),
(440500, '440500', '汕头市', 440000, 440500, 2),
(440600, '440600', '佛山市', 440000, 440600, 2),
(440700, '440700', '江门市', 440000, 440700, 2),
(440800, '440800', '湛江市', 440000, 440800, 2),
(440900, '440900', '茂名市', 440000, 440900, 2),
(441200, '441200', '肇庆市', 440000, 441200, 2),
(441300, '441300', '惠州市', 440000, 441300, 2),
(441400, '441400', '梅州市', 440000, 441400, 2),
(441500, '441500', '汕尾市', 440000, 441500, 2),
(441600, '441600', '河源市', 440000, 441600, 2),
(441700, '441700', '阳江市', 440000, 441700, 2),
(441800, '441800', '清远市', 440000, 441800, 2),
(441900, '441900', '东莞市', 440000, 441900, 2),
(442000, '442000', '中山市', 440000, 442000, 2),
(445100, '445100', '潮州市', 440000, 445100, 2),
(445200, '445200', '揭阳市', 440000, 445200, 2),
(445300, '445300', '云浮市', 440000, 445300, 2),
(450000, '450000', '广西壮族自治区', 450000, 0, 1),
(450100, '450100', '南宁市', 450000, 450100, 2),
(450200, '450200', '柳州市', 450000, 450200, 2),
(450300, '450300', '桂林市', 450000, 450300, 2),
(450400, '450400', '梧州市', 450000, 450400, 2),
(450500, '450500', '北海市', 450000, 450500, 2),
(450600, '450600', '防城港市', 450000, 450600, 2),
(450700, '450700', '钦州市', 450000, 450700, 2),
(450800, '450800', '贵港市', 450000, 450800, 2),
(450900, '450900', '玉林市', 450000, 450900, 2),
(451000, '451000', '百色市', 450000, 451000, 2),
(451100, '451100', '贺州市', 450000, 451100, 2),
(451200, '451200', '河池市', 450000, 451200, 2),
(451300, '451300', '来宾市', 450000, 451300, 2),
(451400, '451400', '崇左市', 450000, 451400, 2),
(460000, '460000', '海南省', 460000, 0, 1),
(460100, '460100', '海口市', 460000, 460100, 2),
(460200, '460200', '三亚市', 460000, 460200, 2),
(469000, '469000', '省直辖县级行政区划', 460000, 469000, 2),
(500000, '500000', '重庆市', 500000, 0, 1),
(500101, '500101', '万州区', 500000, 500100, 2),
(500102, '500102', '涪陵区', 500000, 500100, 2),
(500103, '500103', '渝中区', 500000, 500100, 2),
(500104, '500104', '大渡口区', 500000, 500100, 2),
(500105, '500105', '江北区', 500000, 500100, 2),
(500106, '500106', '沙坪坝区', 500000, 500100, 2),
(500107, '500107', '九龙坡区', 500000, 500100, 2),
(500108, '500108', '南岸区', 500000, 500100, 2),
(500109, '500109', '北碚区', 500000, 500100, 2),
(500110, '500110', '万盛区', 500000, 500100, 2),
(500111, '500111', '双桥区', 500000, 500100, 2),
(500112, '500112', '渝北区', 500000, 500100, 2),
(500113, '500113', '巴南区', 500000, 500100, 2),
(500114, '500114', '黔江区', 500000, 500100, 2),
(500115, '500115', '长寿区', 500000, 500100, 2),
(500116, '500116', '江津区', 500000, 500100, 2),
(500117, '500117', '合川区', 500000, 500100, 2),
(500118, '500118', '永川区', 500000, 500100, 2),
(500119, '500119', '南川区', 500000, 500100, 2),
(500222, '500222', '綦江县', 500000, 500200, 2),
(500223, '500223', '潼南县', 500000, 500200, 2),
(500224, '500224', '铜梁县', 500000, 500200, 2),
(500225, '500225', '大足县', 500000, 500200, 2),
(500226, '500226', '荣昌县', 500000, 500200, 2),
(500227, '500227', '璧山县', 500000, 500200, 2),
(500228, '500228', '梁平县', 500000, 500200, 2),
(500229, '500229', '城口县', 500000, 500200, 2),
(500230, '500230', '丰都县', 500000, 500200, 2),
(500231, '500231', '垫江县', 500000, 500200, 2),
(500232, '500232', '武隆县', 500000, 500200, 2),
(500233, '500233', '忠县', 500000, 500200, 2),
(500234, '500234', '开县', 500000, 500200, 2),
(500235, '500235', '云阳县', 500000, 500200, 2),
(500236, '500236', '奉节县', 500000, 500200, 2),
(500237, '500237', '巫山县', 500000, 500200, 2),
(500238, '500238', '巫溪县', 500000, 500200, 2),
(500240, '500240', '石柱土家族自治县', 500000, 500200, 2),
(500241, '500241', '秀山土家族苗族自治县', 500000, 500200, 2),
(500242, '500242', '酉阳土家族苗族自治县', 500000, 500200, 2),
(500243, '500243', '彭水苗族土家族自治县', 500000, 500200, 2),
(510000, '510000', '四川省', 510000, 0, 1),
(510100, '510100', '成都市', 510000, 510100, 2),
(510300, '510300', '自贡市', 510000, 510300, 2),
(510400, '510400', '攀枝花市', 510000, 510400, 2),
(510500, '510500', '泸州市', 510000, 510500, 2),
(510600, '510600', '德阳市', 510000, 510600, 2),
(510700, '510700', '绵阳市', 510000, 510700, 2),
(510800, '510800', '广元市', 510000, 510800, 2),
(510900, '510900', '遂宁市', 510000, 510900, 2),
(511000, '511000', '内江市', 510000, 511000, 2),
(511100, '511100', '乐山市', 510000, 511100, 2),
(511300, '511300', '南充市', 510000, 511300, 2),
(511400, '511400', '眉山市', 510000, 511400, 2),
(511500, '511500', '宜宾市', 510000, 511500, 2),
(511600, '511600', '广安市', 510000, 511600, 2),
(511700, '511700', '达州市', 510000, 511700, 2),
(511800, '511800', '雅安市', 510000, 511800, 2),
(511900, '511900', '巴中市', 510000, 511900, 2),
(512000, '512000', '资阳市', 510000, 512000, 2),
(513200, '513200', '阿坝藏族羌族自治州', 510000, 513200, 2),
(513300, '513300', '甘孜藏族自治州', 510000, 513300, 2),
(513400, '513400', '凉山彝族自治州', 510000, 513400, 2),
(520000, '520000', '贵州省', 520000, 0, 1),
(520100, '520100', '贵阳市', 520000, 520100, 2),
(520200, '520200', '六盘水市', 520000, 520200, 2),
(520300, '520300', '遵义市', 520000, 520300, 2),
(520400, '520400', '安顺市', 520000, 520400, 2),
(522200, '522200', '铜仁地区', 520000, 522200, 2),
(522300, '522300', '黔西南布依族苗族自治州', 520000, 522300, 2),
(522400, '522400', '毕节地区', 520000, 522400, 2),
(522600, '522600', '黔东南苗族侗族自治州', 520000, 522600, 2),
(522700, '522700', '黔南布依族苗族自治州', 520000, 522700, 2),
(530000, '530000', '云南省', 530000, 0, 1),
(530100, '530100', '昆明市', 530000, 530100, 2),
(530300, '530300', '曲靖市', 530000, 530300, 2),
(530400, '530400', '玉溪市', 530000, 530400, 2),
(530500, '530500', '保山市', 530000, 530500, 2),
(530600, '530600', '昭通市', 530000, 530600, 2),
(530700, '530700', '丽江市', 530000, 530700, 2),
(530800, '530800', '普洱市', 530000, 530800, 2),
(530900, '530900', '临沧市', 530000, 530900, 2),
(532300, '532300', '楚雄彝族自治州', 530000, 532300, 2),
(532500, '532500', '红河哈尼族彝族自治州', 530000, 532500, 2),
(532600, '532600', '文山壮族苗族自治州', 530000, 532600, 2),
(532800, '532800', '西双版纳傣族自治州', 530000, 532800, 2),
(532900, '532900', '大理白族自治州', 530000, 532900, 2),
(533100, '533100', '德宏傣族景颇族自治州', 530000, 533100, 2),
(533300, '533300', '怒江傈僳族自治州', 530000, 533300, 2),
(533400, '533400', '迪庆藏族自治州', 530000, 533400, 2),
(540000, '540000', '西藏自治区', 540000, 0, 1),
(540100, '540100', '拉萨市', 540000, 540100, 2),
(542100, '542100', '昌都地区', 540000, 542100, 2),
(542200, '542200', '山南地区', 540000, 542200, 2),
(542300, '542300', '日喀则地区', 540000, 542300, 2),
(542400, '542400', '那曲地区', 540000, 542400, 2),
(542500, '542500', '阿里地区', 540000, 542500, 2),
(542600, '542600', '林芝地区', 540000, 542600, 2),
(610000, '610000', '陕西省', 610000, 0, 1),
(610100, '610100', '西安市', 610000, 610100, 2),
(610200, '610200', '铜川市', 610000, 610200, 2),
(610300, '610300', '宝鸡市', 610000, 610300, 2),
(610400, '610400', '咸阳市', 610000, 610400, 2),
(610500, '610500', '渭南市', 610000, 610500, 2),
(610600, '610600', '延安市', 610000, 610600, 2),
(610700, '610700', '汉中市', 610000, 610700, 2),
(610800, '610800', '榆林市', 610000, 610800, 2),
(610900, '610900', '安康市', 610000, 610900, 2),
(611000, '611000', '商洛市', 610000, 611000, 2),
(620000, '620000', '甘肃省', 620000, 0, 1),
(620100, '620100', '兰州市', 620000, 620100, 2),
(620200, '620200', '嘉峪关市', 620000, 620200, 2),
(620300, '620300', '金昌市', 620000, 620300, 2),
(620400, '620400', '白银市', 620000, 620400, 2),
(620500, '620500', '天水市', 620000, 620500, 2),
(620600, '620600', '武威市', 620000, 620600, 2),
(620700, '620700', '张掖市', 620000, 620700, 2),
(620800, '620800', '平凉市', 620000, 620800, 2),
(620900, '620900', '酒泉市', 620000, 620900, 2),
(621000, '621000', '庆阳市', 620000, 621000, 2),
(621100, '621100', '定西市', 620000, 621100, 2),
(621200, '621200', '陇南市', 620000, 621200, 2),
(622900, '622900', '临夏回族自治州', 620000, 622900, 2),
(623000, '623000', '甘南藏族自治州', 620000, 623000, 2),
(630000, '630000', '青海省', 630000, 0, 1),
(630100, '630100', '西宁市', 630000, 630100, 2),
(632100, '632100', '海东地区', 630000, 632100, 2),
(632200, '632200', '海北藏族自治州', 630000, 632200, 2),
(632300, '632300', '黄南藏族自治州', 630000, 632300, 2),
(632500, '632500', '海南藏族自治州', 630000, 632500, 2),
(632600, '632600', '果洛藏族自治州', 630000, 632600, 2),
(632700, '632700', '玉树藏族自治州', 630000, 632700, 2),
(632800, '632800', '海西蒙古族藏族自治州', 630000, 632800, 2),
(640000, '640000', '宁夏回族自治区', 640000, 0, 1),
(640100, '640100', '银川市', 640000, 640100, 2),
(640200, '640200', '石嘴山市', 640000, 640200, 2),
(640300, '640300', '吴忠市', 640000, 640300, 2),
(640400, '640400', '固原市', 640000, 640400, 2),
(640500, '640500', '中卫市', 640000, 640500, 2),
(650000, '650000', '新疆维吾尔自治区', 650000, 0, 1),
(650100, '650100', '乌鲁木齐市', 650000, 650100, 2),
(650200, '650200', '克拉玛依市', 650000, 650200, 2),
(652100, '652100', '吐鲁番地区', 650000, 652100, 2),
(652200, '652200', '哈密地区', 650000, 652200, 2),
(652300, '652300', '昌吉回族自治州', 650000, 652300, 2),
(652700, '652700', '博尔塔拉蒙古自治州', 650000, 652700, 2),
(652800, '652800', '巴音郭楞蒙古自治州', 650000, 652800, 2),
(652900, '652900', '阿克苏地区', 650000, 652900, 2),
(653000, '653000', '克孜勒苏柯尔克孜自治州', 650000, 653000, 2),
(653100, '653100', '喀什地区', 650000, 653100, 2),
(653200, '653200', '和田地区', 650000, 653200, 2),
(654000, '654000', '伊犁哈萨克自治州', 650000, 654000, 2),
(654200, '654200', '塔城地区', 650000, 654200, 2),
(654300, '654300', '阿勒泰地区', 650000, 654300, 2),
(659000, '659000', '自治区直辖县级行政区划', 650000, 659000, 2),
(710000, '710000', '台湾省', 710000, 0, 1),
(810000, '810000', '香港特别行政区', 810000, 0, 1),
(820000, '820000', '澳门特别行政区', 820000, 0, 1);

CREATE TABLE IF NOT EXISTS `resident` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `household_id` int(10) unsigned NOT NULL COMMENT '住户',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `sex` char(1) NOT NULL COMMENT '性别',
  `rel_with_householder` varchar(20) NOT NULL COMMENT '与户主关系',
  `birthday` date NOT NULL COMMENT '出生日期',
  `id_no` varchar(18) NOT NULL DEFAULT '' COMMENT '身份证号',
  `nation` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '民族',
  `education` tinyint(4) NOT NULL DEFAULT '0' COMMENT '教育程度',
  `phone` varchar(20) NOT NULL DEFAULT '0' COMMENT '联系电话',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `crt_by` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加人',
  `crt_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `up_by` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `up_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `household_id` (`household_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE  `building` ADD UNIQUE (`name`);
ALTER TABLE  `basic_info` CHANGE  `building_count`  `building_count` INT( 10 ) NOT NULL DEFAULT  '0' COMMENT  '建筑楼数量';
ALTER TABLE  `basic_info` CHANGE  `carport_count`  `carport_count` INT( 10 ) NOT NULL DEFAULT  '0' COMMENT  '车位数量',
CHANGE  `household_count`  `household_count` INT( 10 ) NOT NULL DEFAULT  '0' COMMENT  '住户数量',
CHANGE  `resident_count`  `resident_count` INT( 10 ) NOT NULL DEFAULT  '0' COMMENT  '居民数量';
ALTER TABLE  `building` CHANGE  `household_count`  `household_count` INT( 10 ) NOT NULL DEFAULT  '0' COMMENT  '住户数量';
ALTER TABLE  `resident` CHANGE  `phone`  `phone` VARCHAR( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT  '联系电话';
ALTER TABLE  `household` CHANGE  `up_ty`  `up_by` INT( 10 ) UNSIGNED NOT NULL DEFAULT  '0' COMMENT  '更新人';
