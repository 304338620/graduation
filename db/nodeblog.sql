/*
 Navicat MySQL Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : nodeblog

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 17/03/2019 22:17:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` int(12) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'Mr.liu', 'liu12138', 'http://localhost:3000/static/img/user.jpg', 304338620);

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` int(255) NOT NULL DEFAULT 6,
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `classifyid` int(25) NULL DEFAULT 5,
  `content` varchar(2550) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 1, '2019-03-16 16:20:03', 2, 'hello world', 'hello world', 'http://localhost:3000/static/img/0e6987f0-47c4-11e9-be07-ab9daf6d4a45.jpeg');
INSERT INTO `article` VALUES (12, 3, '2019-03-16 16:20:08', 3, '素胚勾勒出青花，笔锋浓转淡', '青花瓷', 'http://localhost:3000/static/img/0e6987f0-47c4-11e9-be07-ab9daf6d4a45.jpeg');
INSERT INTO `article` VALUES (36, 2, '2019-03-16 21:31:27', 2, '<p><b>简介&nbsp; &nbsp;&nbsp;</b>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门无非就是学会html和css，先前发表过一篇文章《如果要学习web前端开发，需要学习什么？》，如果你还不知道如何着手，请仔细阅读....7天的时间，入门是没有问题的，当然，如果你用心的话！&nbsp;</p><p>之前谈《<a href=\"http://www.yangqq.com/news/life/2014-07-10/722.html\" target=\"_blank\"><strong>女程序员职业生涯该如何发展？</strong></a>》其实，女程序员的职业生涯相对于男程序员来说是很短暂的。就目前我来说，从事这行都已有五年时间，当觉得自己在一个瓶颈阶段无法突破自己的时候，出现了html5和css3，新的技术研究，可以重拾当初学习的激情和兴趣，于是又坚持至今....</p><p>个人博客也是动力之一，博客从一年前的每天访问IP不到60人升到了如今每天将近400个IP，跳出率也由60%缩短到了30%。博客模板也换了n个版本，也结交了很多朋友，一次次的更新和进步还有网友的支持才换来今天的成绩...</p><p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门无非就是学会html和css，先前发表过一篇文章《<a href=\"http://www.yangqq.com/jstt/bj/2013-07-28/530.html\" target=\"_blank\"><strong>如果要学习web前端开发，需要学习什么？</strong></a>》，如果你还不知道如何着手，请仔细阅读....7天的时间，入门是没有问题的，当然，如果你用心的话！</p><p><strong>即便是坑，我也想要拉你入伙！</strong>even the pit , and i also want to pull your occupation !</p><p>前两天有网友跟我聊天，谈到互联网的前景，他很迷茫，要不要继续坚持下去，我说“如果是我，我在这一行肯定干不了多久，毕竟，我的人生规划，就是以后相夫教子。”我劝他，如果自己在这一行这么迷茫堪忧下去，只会耽误自己的时间，趁着年轻，重新找自己喜欢的工作和行业，并且坚持下去....</p><p>表妹刚刚毕业，之前选专业的时候，就是冲着学html去的，结果几年时间下来，学的是维护...女孩子学这个，确实有点儿让人崩溃，这下又得走我的老路了，还是得自己学习。我不强迫她一定要学习html和css。如果她不感兴趣，是不能勉强的。就像找工作和对象一样，需要不断的摸索，才能找到自己的喜欢的....</p><p>但是学习一技之长也并不是一件坏事，有很多传统的企业已经开始往互联网方面发展，这方面的人才缺口其实也蛮大，如果说入门需要7天，何不花7天的时间，学习这一技之长，哪怕作为自己的一个后备。即便是坑，我也想要拉你入伙！&nbsp;<br></p>', '即便是坑，我也想要拉你入伙！', 'http://localhost:3000/static/img/b3c886d0-47ef-11e9-bb95-a562c821885f.jpeg');
INSERT INTO `article` VALUES (26, 1, '2019-03-16 19:40:45', 1, '<p><b>简介&nbsp; &nbsp;</b><span style=\"color: rgb(70, 172, 200);\">创立“程序员节”最早是来自俄文《计算机世界》（《Компьютерра》）出版社的主编德米特里·门德列留科（Дмитрий Мендрелюк）在1996年7月15日的想法，当时计划将节日命名为“计算机用户节”，定在每年9月份的第一个星期五，称之为“纯净的星期五&nbsp;</span>&nbsp;<br></p><h2><span style=\"font-weight: bold;\">节日起源</span></h2><p>创立“程序员节”最早是来自俄文《<a href=\"https://baike.baidu.com/item/%E8%AE%A1%E7%AE%97%E6%9C%BA%E4%B8%96%E7%95%8C\" target=\"_blank\">计算机世界</a>》（《Компьютерра》）出版社的主编德米特里·门德列留科（Дмитрий Мендрелюк）在1996年7月15日的想法，当时计划将节日命名为“计算机用户节”，定在每年9月份的第一个星期五，称之为“纯净的星期五”（Чистая Пятница，按照当事人之一的说法，这样命名是为了刺激那些计算机病毒制造者）。<br>说到程序员节的来历，这要归功于一名在<a href=\"https://baike.baidu.com/item/%E5%B9%B6%E8%A1%8C%E6%8A%80%E6%9C%AF/3345169\" target=\"_blank\">并行技术</a>网页设计公司工作的职工——伦丁·巴尔特。2002年，他收集签名向<a href=\"https://baike.baidu.com/item/%E4%BF%84%E7%BD%97%E6%96%AF%E8%81%94%E9%82%A6%E6%94%BF%E5%BA%9C/8500203\" target=\"_blank\">俄罗斯联邦政府</a>请愿，请求将这一天定为程序员节。2009年7月24日，俄罗斯联邦通信与大众传媒部提出了新的节日安排方案，设立程序员节。9月11日，俄罗斯总统<a href=\"https://baike.baidu.com/item/%E6%A2%85%E5%BE%B7%E9%9F%A6%E6%9D%B0%E5%A4%AB\" target=\"_blank\">梅德韦杰夫</a>签署了这个法案，也就成为了俄罗斯的一个官方节日。这一行动在5天内得到了9800个投票支持。&nbsp;</p><h2><span style=\"font-weight: bold;\">存在国家</span></h2><p>程序员节是一个国际上被众多科技公司和软件企业承认的业内人士节日。日期是在每年的第256（十六进制为0x100，或28）天，也就是平年的9月13日或<a href=\"https://baike.baidu.com/item/%E9%97%B0%E5%B9%B4/27098\" target=\"_blank\">闰年</a>的9月12日。它是俄罗斯的一个官方节日，并且有诸多其他国家也庆祝这个节日，它们包括中国，以色列，<a href=\"https://baike.baidu.com/item/%E5%AD%9F%E5%8A%A0%E6%8B%89%E5%9B%BD\" target=\"_blank\">孟加拉国</a>，智利，巴西，墨西哥，<a href=\"https://baike.baidu.com/item/%E5%A5%A5%E5%9C%B0%E5%88%A9\" target=\"_blank\">奥地利</a>，德国，加拿大，<a href=\"https://baike.baidu.com/item/%E5%85%8B%E7%BD%97%E5%9C%B0%E4%BA%9A\" target=\"_blank\">克罗地亚</a>，法国，<a href=\"https://baike.baidu.com/item/%E5%8D%B1%E5%9C%B0%E9%A9%AC%E6%8B%89\" target=\"_blank\">危地马拉</a>，印度，<a href=\"https://baike.baidu.com/item/%E6%AF%94%E5%88%A9%E6%97%B6\" target=\"_blank\">比利时</a>，澳大利亚，新西兰，波兰，<a href=\"https://baike.baidu.com/item/%E6%96%AF%E6%B4%9B%E6%96%87%E5%B0%BC%E4%BA%9A\" target=\"_blank\">斯洛文尼亚</a>，英国，美国和<a href=\"https://baike.baidu.com/item/%E4%B9%8C%E6%8B%89%E5%9C%AD\" target=\"_blank\">乌拉圭</a>。&nbsp;<br></p>', '为什么说10月24日是程序员的节日？', 'http://localhost:3000/static/img/h1.jpg');
INSERT INTO `article` VALUES (27, 1, '2019-03-16 20:04:11', 2, '<p><b>简介&nbsp;&nbsp;</b>不管你是学前端的还是后端的，作为一个程序员，做一个自己的博客，那是必然的。咱们的圈子就这么大，想让更多的人了解你，看看你的技术多牛逼，扔一个博客地址就行了。<br></p><p>不管你是学前端的还是后端的，作为一个程序员，做一个自己的博客，那是必然的。咱们的圈子就这么大，想让更多的人了解你，看看你的技术多牛逼，扔一个博客地址就行了。<br><br>大多数人在没有搭建好博客之前，看到别人的博客做得那么绚丽，内容那么丰富，心里啊就想着自己也要弄个博客玩儿，不求排名，自娱自乐。可是越往后，你越会发现，自己一个人观赏那不够，于是就想让更多的人搜到你自己的博客。又开始琢磨怎么优化，天天在百度site看收录没有，七天，绝对熬不过七天，九成的人就会崩溃，而且对博客的热度开始慢慢减少，有些甚至破罐子破摔了，本来坚持原创的，后来伪原创，再后来直接转别人的，再再后来就干脆懒得打理网站了。<br><br>还有些站长啊，刚开始连续一星期发布了上千条记录，这些内容都不是他自己的，全是照搬别的网站，或者采集的。也是盼着能收录，怎么还不收录啊，明明发了那么多文章，收一篇也行啊，又开始琢磨，是不是网站程序不好啊，听说**好，换一个试试，于是开始了新一轮的战斗....<br><br>今天我要给大家介绍的这两位站长，有SEO大咖，也有刚加入博客圈的站长，咱们来看看他们怎么做SEO的吧&nbsp;。</p><p>白杨，真名杨红林，在杭州的四川人。他专注SEO研究八年，SEO实战派，前杰恩西运营总监。他做过很多网站平台优化，如电子市场网、捷多邦、王氏阳澄湖大闸蟹、日贸通（杰恩西国内品牌）等，涉及艺术、金融类企业网站、化工、电信等行业。</p><p style=\"text-align: center;\"><img src=\"http://localhost:3000/static/img/9fa3d010-478b-11e9-b11c-5394bc6ae5d8.png\" style=\"max-width: 100%;\"></p><p style=\"text-align: left;\">为什么我要介绍白杨，不聊聊大家熟悉的卢松松呢，因为白杨用了我的模板啊。这套html5《<u><a href=\"http://www.yangqq.com/download/div/2014-04-17/661.html\" target=\"_blank\">如影随形</a></u>》模板还是14年设计的，14年响应式布局已经流行起来。当时用这套模板的很多，但是时隔4年时间，还一直使用的是白杨，并且，白杨的博客是我见过收录和排名最快的，博客2个月不到，就从PR0到PR3，两个字“专业”。&nbsp;</p>', '个人网站做好了，百度不收录怎么办？来，看看他们怎么做的', 'http://localhost:3000/static/img/h2.jpg');
INSERT INTO `article` VALUES (28, 1, '2019-03-16 16:20:30', 1, '<p>电话很久没有响过了，我的QQ也很久没有在线了，消失了很多天，刚刚结识的朋友因为我身上又起了红疹，每天都发来消息询问我的情况，我做到了这么多天来的沉默，我相信，没有网络，我还是可以继续我自己的生活....</p><p style=\"text-align: center;\"><img src=\"http://localhost:3000/static/img/d6ac40b0-478b-11e9-b11c-5394bc6ae5d8.jpeg\" style=\"max-width:100%;\"><br></p><p>昨天晚上接到一飞车好友的电话，约我出去，我没有见过他，也不想见任何一个网友，网络把不真实的感情带到现实的生活中，给我还有对方很多负担，我不会对他们有想法，我更想保留的还是没有见面的那种感觉和状态，大家互不打扰....</p>', '电话以外的宁静', 'http://localhost:3000/static/img/0e6987f0-47c4-11e9-be07-ab9daf6d4a45.jpeg');
INSERT INTO `article` VALUES (29, 1, '2019-03-16 16:20:31', 1, '<p><b>简介&nbsp; &nbsp;</b>个人博客，用来做什么？我刚开始就把它当做一个我吐槽心情的地方，也就相当于一个网络记事本，写上一些关于自己生活工作中的小情小事，也会放上一些照片，音乐。每天工作回家后就能访问自己的网站，一边听着音乐，一边写写文章。</p>本文很长，记录了我博客建站初到现在的过程，还有我从毕业到现在的一个状态，感谢您的阅读，如果你还是学生，也许你能从此文中，找到我们曾经相似的地方。如果你已经工作，有自己的博客，我想，你并没有忘记当初建立个人博客的初衷吧！<br><br><p style=\"text-align: left;\">我的个人博客已经建站有8年的时间了，对它的热爱，一直都是只增未减。回想大学读书的那几年，那会儿非常流行QQ空间，我们寝室的室友还经常邀约去学校的网吧做自己的空间。系里有个男生，空间做得非常漂亮，什么悬浮，开场动画，音乐播放器，我们女生羡慕得不得了。还邀约他跟我们一起去通宵弄空间，网上可以找到很多免费的flash资源，还有音乐，那也是第一次接触js，知道在浏览器输入一个地址，修改一下数据，就能调用一些背景出来。然后把自己QQ空间弄得漂漂亮亮的，经常邀约室友来互踩。我记得08年地震，第二天晚上，我们寝室的几个人还淡定的在寝室装扮空间呢！<img src=\"http://localhost:3000/static/img/9f1703f0-478c-11e9-b11c-5394bc6ae5d8.png\" style=\"max-width: 100%;\"></p>后来空间收费项目也多了，官方漏洞也修复了，加上临近毕业，又要忙着做毕业设计，就没再打理QQ空间。我知道现在的九零后，零零后，你们肯定没看过《一帘幽梦》，那会儿我也是疯狂追剧，喜欢上紫菱，喜欢上她的网站。想看看她的小世界，而我更想学着做一个她那样的网站。那会儿还天真的以为网上真的有她的网站，百度搜了好些天也没有。<br><br><p style=\"text-align: left;\">要毕业的时候，要交作业了，感觉自己什么都没学会。室友拉着我们去看了她同学做的网站，我们一个个佩服得五体投地，甚至觉得太不可思议了。有难度，又怕自己不会。老师教我们怎么布局，怎么做，并没有教我们右键保存网页。不知道是谁先会了这绝技，然后我们一个个又跟打了鸡血似的，疯狂在网上找网页，右键另存为。然后一个个修改文字，图片。仿佛又回到了那会儿做QQ空间那个时候。拿着copy来，并且精心修改的作品，递交了毕业设计，顺利结业。那会儿还是很蒙，一种云里雾里的感觉，竟有种不知道自己到底是会还是不会的感觉，也就是大家常说的毕业迷茫期。</p>工作后进入社会，出去谈业务，遇到一个对网页设计超级感兴趣的人，聊了一下午都还不够，他是完全自学的，做了一个首页宣传他们的产品。他眼里的我就是专业的，总是请教我一些问题。其实我内心特羡慕人家，每次问我，我也似懂非懂的跟人家解决问题，但我还是经常靠百度来搜索他要的答案。他身上那种好学好问的那股劲儿，也成为我迫切想拥有自己的个人博客的一个重要原因。<br><br><p style=\"text-align: left;\">做博客不是说做就做的，很多东西我都不懂，也不知道要购买域名还有空间。前期要做的工作还是很多。幸好张园同学，也是我实习期的同事，他会这些，教我网上找免费的虚拟空间，然后就是把自己做的页面上传进去，还给了有一个地址，然后就能访问了。那是第一次接触，也了解了整个网站的制作过程，只可惜买域名还有空间需要费用，还在实习期的我，想想也就算了。虚拟空间毕竟是免费的，没多长时间，做过的网页就不能访问了，又得重新注册，重新上传。</p><p style=\"text-align: left;\">等自己有一些资金和技术后，我开始买域名和空间。从一开始，我就没想过只是练练手，或者用一段时间就行了。我会一直用下去，所以精心挑选了域名和空间。这些年除了域名没有更换外，后台程序由asp换成了php，空间从西部数据换成万网，也就是现在的阿里云。一步步升级，就想把最好的一面呈现给大家。很多人问我网站速度怎么访问那么快，其实一是网站程序，页面最好是静态页面。每次我写的代码的时候，我都在琢磨怎么减少代码，减少使用div和图片，让html结构简单化，而又不失美观。所以，网站也改版了有好几次。二是空间还有带宽。这个其实很重要，现在备案跟以前比，快很多了，快的话一星期，慢的话顶多二十天。所以，不是因为特着急的话，还是用国内空间。关于国外空间，其实现在阿里云的香港虚拟主机也不错，访问还是上传都比以前好很多了。用它的小伙伴也挺多。延伸阅读 《<u><a href=\"http://www.yangqq.com/jstt/web/2014-01-18/644.html\" target=\"_blank\">我的个人博客之——阿里云空间选择</a></u>。</p>', '个人博客，属于我的小世界！', 'http://localhost:3000/static/img/0e6987f0-47c4-11e9-be07-ab9daf6d4a45.jpeg');
INSERT INTO `article` VALUES (34, 1, '2019-03-16 16:19:17', 2, '<p><b>简介&nbsp; &nbsp;&nbsp;</b>如果你没有任何的建站基础，你想做一个网站，那么认真按照下面步骤操作，一小时内你就可以做出一个网站来。现在建一个网站对于新手来说，其实也是非常简单而且低成本的事情了。因为现在有大量开源免费的网站程序可以免费下载使用，就空间和域名一点钱，空间和域名加起来一年大概在200到400左右就可以做一个个人网站。</p><div><p><span style=\"font-weight: bold;\">问:&nbsp; </span>我没有任何建站基础,能学会做网站吗?</p><p><strong><span style=\"font-weight: bold;\">答</span>：</strong>现在建一个网站对于新手来说，其实也是非常简单而且低成本的事情了。因为现在有大量开源免费的网站程序可以免费下载使用，就空间和域名一点钱，空间和域名加起来一年大概在200到400左右就可以做一个个人网站。如果你是个新手，认真按照下面步骤操作，一小时内你就可以做出一个网站来。</p><p><span style=\"font-weight: bold;\">第一步</span>，要准备空间和域名，这两样都是需要购买的。如果你想很快就建成网站,那推荐你用香港,以及国外的免备案空间，因为你是新手的话使用国内空间就必须需要备案,那样就会非常麻烦，你还没把网站搞起来你就被备案搞烦了，一般备案要25天到一个月还有超过一个月都没有备案下来的，没通过还要继续申请。域名尽量选国际域名最好是.com的，不要选国家域名.cn，国家cn域名在国内购买以及绑定网站转出都是比较麻烦的!域名尽量选.com结尾的,毕竟这是互联网上最被人熟知的域名后缀,如果你买了一个很不常见的域名,那么又有几个人能记住呢?这里还有一个需要提醒就是空间跟你未来要使用的建站程序相匹配,程序用的是php空间就必须要支持php,程序用asp的空间就必须买支持asp的!</p><p><span style=\"font-weight: bold;\">第二步</span>，如果你是购买的免备案空间那么可以开始这一步的操作了,如果您购买的是国内需要备案的空间,那么必须要等到您的备案号下来后,才可以继续这一步的操作。就是把买来的域名和空间绑定上,也就是常说的域名解析，这需要到域名管理后台进行操作。一般分为两种方式：第一种是A记录，“值”里面就填空间的ip地址，A记录前面的空格就填www，这是解析了www.xxx.com这样的网址，你要解析xxx.com这样的不带www的网址，A记录前面的空格就填@就可以（有的域名商是留空，有的需要填@）。第二种就是CNAME记录，也叫别名解析。如果你的空间商给有别名地址的话（别名地址一般是个二级域名地址），你就可以使用CNAME记录解析了，把A记录改成CNAME记录，后面的就填上别名地址，前面的空格填写和A记录说的一样填www和@（或留空）。</p><p><span style=\"font-weight: bold;\">第三步</span>，想好做什么网站，然后就找一套网上免费的网站程序，网上大量免费的。你做什么站就找什么程序。把程序下载后，解压出来等下一步上传到空间。这里要说一下,一般常见的网站程序分2种asp跟php,这要跟你购买的网站空间来匹配,你如果购买的空间只支持asp和asp.net,那么你用php程序是不行的!如果你购买的空间既支持asp也支持php那么是可以的!如果你买的是liunx空间只支持php程序的话,你不能安装asp的程序也包括asp.net的程序!</p><p><span style=\"font-weight: bold;\">第四步</span>，下载一个ftp上传工具，有免费的。推荐用FileZilla，这是我用过最好的ftp工具。这是用来上传你的网站程序到空间用的。没有的话就百度一下,肯定有提供下载的。安装时候，一直点下一步就可以，不要改变里面设置。</p><p><span style=\"font-weight: bold;\">第五步</span>，登陆你的空间管理后台（到空间商的网站登陆进去管理），找到ftp地址、用户名、密码。然后打开ftp工具，点左上角的“文件”——“站点管理”——左侧建一个“新站点”，然后在右侧“主机”栏填写ftp地址，端口填“21”。将下面的“匿名”改选成“一般”。然后把你的ftp账号、密码分别填写进去，点击“连接”就登陆上空间了。</p><p><span style=\"font-weight: bold;\">第六步</span>，上传网站程序到空间。在ftp工具里面的左侧现在自己电脑里找到网站程序并打开，这时程序文件会展示在左侧。在右侧是你的空间上的文件夹，点击打开“web”这个文件夹，这就是网站的根目录，其他的文件夹不用管它。打开“web”后吧里面的文件删除，全选，点鼠标右键可以删除。然后全选左侧的程序文件，然后点击鼠标右键，点“上传”就可以了。他会自动上传到右侧的空间上。</p><p><span style=\"font-weight: bold;\">第七步</span>，上传完以后。如果是asp+access开发的程序，一般就不用安装。可以直接使用了。如果是别的语言开发的网站程序一般要安装的，如php+mysql、asp+mssql等。。。如果需要安装的话，你访问你的网址他会提示你安装的，你只要填写数据库信息，如数据库名、数据库用户名、密码，前两个一般是相同的。这些数据库账号信息你可以登陆空间管理后台进入数据库空间管理里面你就找到了。其他需要填写的就是你的网站的管理账号、密码等等这些是你可以随意填的。</p><p><span style=\"font-weight: bold;\">第八步</span>，安装完就可以使用你的账号密码登陆后台管理你的网站了，当然有些信息要修改成你的，想网站底部的信息、网站名称、网站logo图片等等这些可以在后台填写修改。对于是asp+access程序的网站，一般你下载的程序里面有一个说明文文件的，他会提供你的网站的初始', '建站流程篇——教你如何快速学会做网站', 'http://localhost:3000/static/img/0e6987f0-47c4-11e9-be07-ab9daf6d4a45.jpeg');
INSERT INTO `article` VALUES (35, 1, '2019-03-16 16:22:34', 1, '<p>\"时间过得那么飞快,使我的小心眼儿里不只是着急,还有悲伤.有一天,我放学回家,看到太阳快落山了,就下决心说:\"我要比太阳更快地回家.\"我狂奔回去,站在庭院前喘气的时候,看到太阳还露着半边脸,我高兴地跳跃起来,那一天我跑赢了太阳.以后我就时常做那样的游戏,有时和太阳赛跑,有时和西北风比快,有时一个暑假才能做完的作业,我十天就做完了;那时我三年级,常常把哥哥五年级的作业拿来做.每一次比赛胜过时间,我就快乐得不知道怎么形容.\"&nbsp; 这是节选自林清玄的文章&lt;和时间赛跑&gt;<br><br>读到这里的时候,我不禁感慨,我怎么没有和时间来一个比赛,我也要跑赢它.好比说我们做博客,如果你不给自己定一个期限,总是在\"打算做\"的阶段,那永远都停滞不前,永远都跑不赢时间.&nbsp;如果你想做一个博客,赶紧行动起来,给自己定一个时间期限,买域名,买空间,备案,制作模板,,,一步一步来实现,停滞不前,注定就会输了这场比赛.<br><br>很多网友都说我的个人博客优化做得好,排名总是靠前,非常羡慕.要知道我做了博客那么长的时间,在时间上我就赢了,这就是所谓的赢在了起跑线.但是也不是说起跑线输了,就追不上了,个人博客关键字词做好,其次内容也是非常重要的,一定要坚持更新.我有段时间就好久不曾更新,因为我要一边带孩子,一边做我的工作,没有时间去做新的模板,我也看到很多新的个人博客出现了,而且排名很好,所以我们要比别人多点儿努力,多点儿精力,是可以追上的.<br><br>我也要和时间来一场比赛.我会跑赢它的,给我自己加油吧!&nbsp;</p><p style=\"text-align: center; \"><img src=\"http://localhost:3000/static/img/9f9e61f0-47c4-11e9-be07-ab9daf6d4a45.jpeg\" style=\"max-width: 100%;\">&nbsp;<br></p>', 'Come on,行动起来吧!我们和时间来一场赛跑!', 'http://localhost:3000/static/img/895dd1a0-47c4-11e9-be07-ab9daf6d4a45.jpeg');
INSERT INTO `article` VALUES (37, 2, '2019-03-16 21:33:46', 4, '<p>听着那熟悉的歌曲 ­</p><p>看着那一张张可爱的图片 ­</p><p>读着我们共同欣赏的诗…… ­</p><p>也许我们曾经相遇 ­ ­</p><p>看着你远去的背影 ­</p><p>沿着你来的方向 ­</p><p>回忆时间穿梭于幸福的点点滴滴 ­ ­</p><p>我知道 ­</p><p>幸福悄悄来临 ­</p><p>就从遇见你的那天起…… ­</p>', '遇见一个未知的你', 'http://localhost:3000/static/img/32661520-47be-11e9-af4e-21fd1c300ba8.jpeg');
INSERT INTO `article` VALUES (38, 2, '2019-03-16 21:37:19', 2, '<p><b>简介&nbsp; &nbsp; &nbsp;</b>这些开源的博客程序源码，都是经过很多次版本测试的，都有固定的使用人群。我所知道的主流的博客程序有，Z-blog，Emlog，WordPress，Typecho等，免费的cms系统有，织梦cms（dedecms），phpcms，帝国cms（EmpireCMS）等。</p><div>现在很多人都想制作一个个人博客，前端html静态页面，免费的很多，但是拿到一个静态页面，自己并不知道怎么用。你可以选择下载免费的博客程序源码，或者cms。这些开源的博客程序源码，都是经过很多次版本测试的，都有固定的使用人群。我所知道的主流的博客程序有，Z-blog，Emlog，WordPress，Typecho等，免费的cms系统有，织梦cms（dedecms），phpcms，帝国cms（EmpireCMS）等。这些都是开源免费的程序，用它们来做一个个人博客网站，是可以的。<br><br>很多新手站长不知道该如何选择合适的博客程序源码来搭建自己的个人独立博客，主要原因还是不太了解这些博客程序的特点。这些博客程序都有它的使用教程，如果你有足够的时间，可以选择去学习。<br><br>我相信很多站长，都使用过以上的博客程序源码。我先来简单说说，我在使用这些博客程序源码的一个体验感受：<br><br>1、<span style=\"font-weight: bold;\">Z-Blog</span>。Z-blog博客程序的特点在于它有asp，php两个版本，有可选择性，页面静态化做得比较好，有利于SEO优化。但Z-blog目前提供的不少主题模板和插件是收费的，而且主题不是很多。<br><br>2、<span style=\"font-weight: bold;\">Emlog</span>。Emlog(点滴记忆)，程序大小只有500KB左右。它的特点就是源程序文件非常小。Emlog的基本功能比较简单，对于做一个简单的博客来说足够。不够完美的地方在于，Emlog不能html静态化，支持的是伪静态。<br><br>3、<span style=\"font-weight: bold;\">WordPress</span>。相比较前两个来说，WordPress的人气应该是最高的，WordPress的博客主题很多，免费的，付费的，更新也快。WordPress程序依托的是插件和主题，作为国际性开源程序，它的功能非常强大。美中不足的地方在于，它的插件多，网站速度加载会比较慢。<br><br>4、<strong><span style=\"font-weight: bold;\">织梦cms</span>（dedecms）</strong>。最新版本V5.7SP2正式版，更新时间：2018年01月09日。dedecms采用PHP+MySQL的技术架构，个人站长用得也比较多，因为它上手快，标签好调用，对于想做资讯网站的站长来说，简单看看教程，也能在短时间学会。dedecms是完全开源的，不足的地方在于，漏洞很多，网站时不时被攻击挂马。<br><br>5、<span style=\"font-weight: bold;\">PHPCMS</span>。最新版 V9.6.3 ，更新时间：2017年05月15日。使用的MVC模式编程，模块化的设计，非常适合网站的二次开发，从后台的美观度来说，PHPCMS V9的后台界面最为美观，操作也简单。我记得dede和帝国cms还在用table的时候，phpcms开发模板用的是div+css，界面好看布局又合理。就扩展性来说，不是很好，v9之后，就不再更新了。<br><br>6、<span style=\"font-weight: bold;\">帝国cms</span>。从安全性来说，帝国CMS,PHPCMS的安全性高，没有什么漏洞，帝国cms页面静态化，利于优化，而且扩展性很好，适合做二次开发。但从美观度来说，帝国cms不重视这些，甚至很多都是table布局。之前我写过一篇文章，《<strong><a href=\"http://www.yangqq.com/blogs/876.html\" target=\"_blank\">个人博客，我为什么要用帝国cms？</a></strong>》，也是在使用了以上这些博客程序源码后写的一个总结，兜兜转转，最后还是使用了帝国cms，作为我的博客程序。<br><br>以上这些，仅属于个人观点，每个程序都有它的优缺点，选择什么样的程序源码，看个人的需求和爱好。比如，有程序基础的，喜欢易于开发和灵活性强的，可以选择帝国cms。喜欢漂亮的，后台易于操作的，想经常换主题的，可以选择wordpress，总的来说，根据个人的情况来选择，选适合自己的，慢慢熟悉系统。</div>', '【个人博客网站制作】自己不会个人博客网站制作，你会选择用什么博客程序源码？', 'http://localhost:3000/static/img/9ced47b0-47f0-11e9-bb95-a562c821885f.jpeg');
INSERT INTO `article` VALUES (39, 2, '2019-03-16 21:42:16', 4, '<p><b>简介</b>网页设计和做人一样，需要少一些套路，多一些真诚。那么下面就为大家揭穿那些看似好用，但用户体验并不好的设计模式。另外再附上解决办法，避免网页设计中出现这些问题</p><div>网页设计和做人一样，需要少一些套路，多一些真诚。那么下面就为大家揭穿那些看似好用，但用户体验并不好的设计模式。另外再附上解决办法，避免网页设计中出现这些问题。<br><br><strong>1、色彩种类运用过多</strong><br>很多站长为了让自己的网站更有吸引力，往往会给网站增添一些绚丽的颜色，加入大量色彩鲜艳的文字与边框，而这些颜色的运用与图片内容并不协调。降低了网站内容的可读性。所以如何更好的把握网站&lt;访问者的喜好,为用户提供一个可读性更强的网站?这其中颜色就起到了相当大的作用。<br><br><strong>解决办法</strong>：最好的办法是使用最多三种主色调与素雅的背景。<br>1、推荐给大家两篇关于颜色搭配的文章《<u><a href=\"http://www.yangqq.com/jstt/css3/2018-03-14/805.html\" target=\"_blank\">6条网页设计配色原则,让你秒变配色高手</a></u>》以及《<u><a href=\"http://www.yangqq.com/jstt/bj/2013-06-08/178.html\" target=\"_blank\">Web Color Design——设计师谈网页配色艺术</a></u>》<br>2、如果你还在为获取web颜色而烦恼的话，建议你使用<u><a href=\"http://www.peise.net/tools/web/\">Color Scheme Designer</a></u>取色工具，以不同的模式，可以让你一下获取相近的四个颜色。</div><p style=\"text-align: center;\"><img src=\"http://localhost:3000/static/img/fac86130-47f0-11e9-bb95-a562c821885f.jpeg\" style=\"max-width:100%;\"><br></p><p style=\"text-align: left;\"><strong>2、字体大小存在问题</strong><br>这类问题往往存在多种表现形式，包括字体不足12号使得用户无法看清甚至点不到后退按钮。很多网页的上的字体都是正常大小,对我们来说刚好,但是父母来说网页上的字就会偏小了。<br><br><strong>解决办法：</strong>一般中文的字体大小是12px或者14px。随着显示器分辨率不断提高，12px的文字在大于1440*900的显示器里看起来会显得比较小，阅读起来不是很容易，所以现在网页设计里面用12px的已经比较少了，特别是文章正文部分，普遍都会用14px。<br><br>对于font-family，一般来说14px及以下大小的文字，应当设置为宋体，当然也可以设置为微软雅黑。不过在XP下默认是没有雅黑字体的，所以在css里面可以这样设置字体： font-family:\"Microsoft Yahei\",simSun,Arial; 把几个字体用逗号隔开，如果系统没有第一种字体，就用第二种，如果没有第二种就用第三种，以此类推。 对于大于14px的文字，特别是大于16px的文字，宋体看起来就比较丑陋了，所以建议是用黑体或者微软雅黑，看起来回舒服一些。<br><br>3、<strong>过度使用GIF、动画与音效</strong><br><br>在某些情况下，GIF动画非常有趣；动画能够让访问者获得更好的使用体验；音效可能也有助于提升感受。但这些都只是点缀，切记不可画蛇添足。GIF动画过多会造成一种庸俗而幼稚的氛围，而大家对于音效以及音乐的取向也有所不同。有时，我们精心设计，却难以实现效果。<br><br><strong>解决办法：</strong>千万别让费尽心力添加的动画与音效成了刺眼又刺耳的垃圾元素。使用GIF动画最好能免则免&nbsp;</p>4、<strong>超大的导航菜单<br><br><div style=\"text-align: center;\"><strong><img alt=\"\" src=\"http://www.yangqq.com/d/file/jstt/css3/2018-03-25/38b6a61afae81367a8979cb9a20871c5.jpg\"></strong></div></strong><br>大型的导航菜单，对于包含大量不同子页面的网站而言，似乎是一个很好的解决方案，然而实际情况并非如此。我们常见的网站设计错误就是在边栏及子菜单中塞进长长的清单，超大的导航菜单对于绝大多数的普通用户而言，看起来更像是迷宫。这看似满足了全部用户的需求，实则会分散用户注意力，并让用户觉得不那么爽。如果导航、侧栏与底栏无法协同工作，那么网站内容再好也将没有意义。<br><br><strong>解决办法：</strong>信息分类整合其实是就是为了应对这种情况而存在的，将网站的导航内容规划为不同的大分类，有了层级，用户更容易筛选；又或者你可以将导航设计成为更为有趣的图文式链接，让它看起来不那么枯燥，也不失为一个可取的方案。永远不要低估在屏幕上留白的重要性，因为其是创造平衡美感的重要基础。<br><br><p style=\"text-align: left;\">5、<strong>乏味无趣的加载页面</strong>&nbsp;<br></p><p style=\"text-align: left;\"><div style=\"text-align: center;\"><strong><img alt=\"\" src=\"http://www.yangqq.com/d/file/jstt/css3/2018-03-25/f9e0c0b48031d0e0017fc9bad904bde3.gif\"></strong></div>随着技术的', '别让这些闹心的套路，毁了你的网页设计', 'http://localhost:3000/static/img/32661520-47be-11e9-af4e-21fd1c300ba8.jpeg');

-- ----------------------------
-- Table structure for classify
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify`  (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES (1, '生活');
INSERT INTO `classify` VALUES (2, '技术');
INSERT INTO `classify` VALUES (3, '科技');
INSERT INTO `classify` VALUES (4, '艺术');
INSERT INTO `classify` VALUES (5, '未分类');
INSERT INTO `classify` VALUES (6, 'demo');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` int(255) NOT NULL,
  `articleid` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (1, 2, 26);
INSERT INTO `collect` VALUES (2, 1, 26);
INSERT INTO `collect` VALUES (3, 3, 26);
INSERT INTO `collect` VALUES (4, 2, 27);
INSERT INTO `collect` VALUES (5, 2, 27);
INSERT INTO `collect` VALUES (6, 1, 23);
INSERT INTO `collect` VALUES (7, 3, 26);
INSERT INTO `collect` VALUES (8, 6, 26);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userid` int(255) NOT NULL,
  `articleid` int(255) NOT NULL,
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (2, '你好，世界', 1, 1, '2018-12-07 09:42:09');
INSERT INTO `comments` VALUES (3, '你是想笑死我好继承我的蚂蚁花呗嘛', 2, 1, '2018-12-07 09:42:49');
INSERT INTO `comments` VALUES (4, '楼下的都是弟弟', 3, 1, '2018-12-07 09:43:22');
INSERT INTO `comments` VALUES (5, '楼主才高八斗，真乃神人也', 2, 18, '2019-03-05 21:23:30');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `commentid` int(255) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ctime` datetime NOT NULL,
  `userid` int(255) NOT NULL,
  `replyid` int(255) NOT NULL,
  `articleid` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int(10) NULL DEFAULT NULL,
  `birth` int(100) NULL DEFAULT NULL,
  `avator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, '张一', '18895683609', 1, NULL, 'http://localhost:3000/static/img/zhangyi.jpg', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL);
INSERT INTO `user` VALUES (3, '周刚', '18895687056', 1, 23, 'http://localhost:3000/static/img/zhougang.jpg', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL);
INSERT INTO `user` VALUES (6, '佚名', '18854587963', 0, 23, NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL);
INSERT INTO `user` VALUES (1, '刘会锋', '13225734869', 1, NULL, 'http://localhost:3000/static/img/liu.jpg', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL);
INSERT INTO `user` VALUES (7, '移动', '18895685458', NULL, NULL, NULL, '13f15f773a24e8733476049073ed0a2b', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
