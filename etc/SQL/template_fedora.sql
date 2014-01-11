-- MySQL dump 10.13  Distrib 5.5.32, for Linux (x86_64)
--
-- Host: localhost    Database: islandev_fedora3
-- ------------------------------------------------------
-- Server version	5.5.32-cll

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `datastreamPaths`
--

DROP TABLE IF EXISTS `datastreamPaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datastreamPaths` (
  `tokenDbID` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(199) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tokenDbID`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datastreamPaths`
--

LOCK TABLES `datastreamPaths` WRITE;
/*!40000 ALTER TABLE `datastreamPaths` DISABLE KEYS */;
/*!40000 ALTER TABLE `datastreamPaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcDates`
--

DROP TABLE IF EXISTS `dcDates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcDates` (
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dcDate` bigint(20) NOT NULL,
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcDates`
--

LOCK TABLES `dcDates` WRITE;
/*!40000 ALTER TABLE `dcDates` DISABLE KEYS */;
INSERT INTO `dcDates` VALUES ('demo:18',1032220800000);
/*!40000 ALTER TABLE `dcDates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doFields`
--

DROP TABLE IF EXISTS `doFields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doFields` (
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `ownerId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cDate` bigint(20) NOT NULL,
  `mDate` bigint(20) NOT NULL,
  `dcmDate` bigint(20) DEFAULT NULL,
  `dcTitle` text COLLATE utf8_unicode_ci,
  `dcCreator` text COLLATE utf8_unicode_ci,
  `dcSubject` text COLLATE utf8_unicode_ci,
  `dcDescription` text COLLATE utf8_unicode_ci,
  `dcPublisher` text COLLATE utf8_unicode_ci,
  `dcContributor` text COLLATE utf8_unicode_ci,
  `dcDate` text COLLATE utf8_unicode_ci,
  `dcType` text COLLATE utf8_unicode_ci,
  `dcFormat` text COLLATE utf8_unicode_ci,
  `dcIdentifier` text COLLATE utf8_unicode_ci,
  `dcSource` text COLLATE utf8_unicode_ci,
  `dcLanguage` text COLLATE utf8_unicode_ci,
  `dcRelation` text COLLATE utf8_unicode_ci,
  `dcCoverage` text COLLATE utf8_unicode_ci,
  `dcRights` text COLLATE utf8_unicode_ci,
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doFields`
--

LOCK TABLES `doFields` WRITE;
/*!40000 ALTER TABLE `doFields` DISABLE KEYS */;
INSERT INTO `doFields` VALUES ('fedora-system:ContentModel-3.0','content model object for content model objects','a','fedoraadmin',1214975383796,1378876072919,1214975384015,' content model object for content model objects .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' fedora-system:contentmodel-3.0 .',NULL,NULL,NULL,NULL,NULL),('fedora-system:FedoraObject-3.0','content model object for all objects','a','fedoraadmin',1214975383796,1378876073715,1214975384359,' content model object for all objects .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' fedora-system:fedoraobject-3.0 .',NULL,NULL,NULL,NULL,NULL),('fedora-system:ServiceDefinition-3.0','content model object for service definition objects','a','fedoraadmin',1214975383796,1378876073924,1214975384375,' content model object for service definition objects .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' fedora-system:servicedefinition-3.0 .',NULL,NULL,NULL,NULL,NULL),('fedora-system:ServiceDeployment-3.0','content model object for service deployment objects','a','fedoraadmin',1214975383796,1378876074046,1214975384406,' content model object for service deployment objects .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' fedora-system:servicedeployment-3.0 .',NULL,NULL,NULL,NULL,NULL),('demo:XML_TO_HTMLDOC','content model object for document transform demo','a','fedoraadmin',1214975382015,1378876077682,1187188590369,' content model object for document transform demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:xml_to_htmldoc .',NULL,NULL,NULL,NULL,NULL),('demo:14','data object for document transform demo','a','fedoraadmin',1214975382015,1378876077961,1214975382484,' web service definition for the fedora access service .',' sandy payette .',' fedora documentation web service web services description language (wsdl) .',' this object contains a wsdl description of the fedora access web service which can be viewed in two document formats. .',NULL,NULL,NULL,NULL,NULL,' demo:14 .',NULL,NULL,' http://www.fedora.info .',NULL,' unrestricted .'),('demo:12','service definition object for document transform demo','a','fedoraadmin',1214975382015,1378876078227,1214975382515,' service definition object for document transform demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:12 .',NULL,NULL,NULL,NULL,NULL),('demo:13','service deployment object for document transform demo','a','fedoraadmin',1214975382015,1378876078640,1214975382609,' service deployment object for document transform demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:13 .',NULL,NULL,NULL,NULL,NULL),('demo:FO_TO_PDFDOC','content model object (fo to pdf) for formatting objects demo','a','fedoraadmin',1187188591126,1378876078818,1214975382656,' content model object (fo to pdf) for formatting objects demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:fo_to_pdfdoc .',NULL,NULL,NULL,NULL,NULL),('demo:TEI_TO_PDFDOC','content model object (tei to pdf) for formatting objects demo','a','fedoraadmin',1187188591652,1378876078952,1214975382671,' content model object (tei to pdf) for formatting objects demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:tei_to_pdfdoc .',NULL,NULL,NULL,NULL,NULL),('demo:21','data object (fo to pdf) for formatting objects demo','a','fedoraadmin',1214975382015,1378876079156,1214975382703,' advanced fo sample from apache fop distribution .',' apache group .',' fop fo apache .',NULL,NULL,NULL,NULL,NULL,NULL,' demo:21 .',NULL,NULL,NULL,NULL,' unrestricted .'),('demo:26','data object (tei to pdf) for formatting objects demo','a','fedoraadmin',1214975382015,1378876079622,1214975382765,' the purple cow .',' frank gelett burgess .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:26 .',NULL,NULL,NULL,NULL,' unrestricted .'),('demo:19','service definition object (pdf) for formatting objects demo','a','fedoraadmin',1214975382015,1378876079794,1214975382781,' service definition object (pdf) for formatting objects demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:19 .',NULL,NULL,NULL,NULL,NULL),('demo:22','service definition object (fo) for formatting objects demo','a','fedoraadmin',1214975382015,1378876079992,1214975382812,' service definition object (fo) for formatting objects demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:22 .',NULL,NULL,NULL,NULL,NULL),('demo:20','service deployment object (fo to pdf) for formatting objects demo','a','fedoraadmin',1214975382015,1378876080117,1214975382828,' service deployment object (fo to pdf) for formatting objects demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:20 .',NULL,NULL,NULL,NULL,NULL),('demo:25','service deployment object (tei to fo) for formatting objects demo','a','fedoraadmin',1214975382015,1378876080239,1214975382859,' service deployment object (tei to fo) for formatting objects demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:25 .',NULL,NULL,NULL,NULL,NULL),('demo:DualResImage','content model object (image) for image collection demo','a','fedoraadmin',1187188592085,1378876080562,1214975382890,' content model object (image) for image collection demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:dualresimage .',NULL,NULL,NULL,NULL,NULL),('demo:DualResImageCollection','content model object (image collection) for image collection demo','a','fedoraadmin',1187188594682,1378876080677,1214975382906,' content model object (image collection) for image collection demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:dualresimagecollection .',NULL,NULL,NULL,NULL,NULL),('demo:SmileyBeerGlass','data object (smiley beer glass) for image collection demo','a','fedoraadmin',1214975382015,1378876181094,1214975382921,' smiley beer glass .',NULL,NULL,' i guess you could drink other things out of it, but i haven\'t tried. .',NULL,NULL,NULL,NULL,NULL,' demo:smileybeerglass .',NULL,NULL,NULL,NULL,NULL),('demo:SmileyBucket','data object (smiley bucket) for image collection demo','a','fedoraadmin',1214975382015,1379361380340,1379361380340,' steve\'s smiley bucket .',NULL,NULL,' this bucket can be used for sand, flour, sugar, dirt, paint, and water. .',NULL,NULL,NULL,NULL,NULL,' demo:smileybucket .',NULL,NULL,NULL,NULL,NULL),('demo:SmileyDinnerware','data object (smiley dinnerware) for image collection demo','a','fedoraadmin',1214975382015,1378876081371,1214975382968,' smiley dinnerware .',NULL,NULL,' made from 100% pure paper and plastic, this dinnerware is sure to impress your kids. .',NULL,NULL,NULL,NULL,NULL,' demo:smileydinnerware .',NULL,NULL,NULL,NULL,NULL),('demo:SmileyEarring','data object (smiley earring) for image collection demo','a','fedoraadmin',1214975382015,1378876081544,1214975382984,' smiley earring .',NULL,NULL,' smiling from ear to ear. .',NULL,NULL,NULL,NULL,NULL,' demo:smileyearring .',NULL,NULL,NULL,NULL,NULL),('demo:SmileyGreetingCard','data object (smiley greeting card) for image collection demo','a','fedoraadmin',1214975382015,1378876081739,1214975383000,' smiley greeting card .',NULL,NULL,' great for people who still use snail mail. .',NULL,NULL,NULL,NULL,NULL,' demo:smileygreetingcard .',NULL,NULL,NULL,NULL,NULL),('demo:SmileyKeychain','data object (smiley keychain) for image collection demo','a','fedoraadmin',1214975382015,1378876082138,1214975383015,' smiley keychain .',NULL,NULL,' it dangles from side to side while you\'re driving. .',NULL,NULL,NULL,NULL,NULL,' demo:smileykeychain .',NULL,NULL,NULL,NULL,NULL),('demo:SmileyNightlight','data object (smiley nightlight) for image collection demo','a','fedoraadmin',1214975382015,1378876082251,1214975383015,' smiley nightlight .',NULL,NULL,' simple operation: push on, push off.  very amusing for people who like to push things. .',NULL,NULL,NULL,NULL,NULL,' demo:smileynightlight .',NULL,NULL,NULL,NULL,NULL),('demo:SmileyPens','data object (smiley pens) for image collection demo','a','fedoraadmin',1214975382015,1378876082402,1214975383031,' smiley pens .',NULL,NULL,' yes, these actually write.  well, i haven\'t tested them but i\'m pretty sure. .',NULL,NULL,NULL,NULL,NULL,' demo:smileypens .',NULL,NULL,NULL,NULL,NULL),('demo:SmileyShortRoundCup','data object (smiley short round cup) for image collection demo','a','fedoraadmin',1214975382015,1378876082608,1214975383046,' smiley short round cup .',NULL,NULL,' it\'s round.  it\'s a cup.  it\'s amazing! .',NULL,NULL,NULL,NULL,NULL,' demo:smileyshortroundcup .',NULL,NULL,NULL,NULL,NULL),('demo:SmileyStuff','data object (collection) for image collection demo','a','fedoraadmin',1214975382015,1378876082794,1214975383062,' collection of smiley stuff .',NULL,NULL,' this is deb\'s collection of smiley stuff. .',NULL,NULL,NULL,NULL,NULL,' demo:smileystuff .',NULL,NULL,NULL,NULL,NULL),('demo:SmileyTallRoundCup','data object (smiley tall round cup) for image collection demo','a','fedoraadmin',1214975382015,1378876082959,1214975383078,' smiley tall round cup .',NULL,NULL,' this cup measures ten inches high (when standing).  when it\'s on it\'s side, it measures ten inches wide. .',NULL,NULL,NULL,NULL,NULL,' demo:smileytallroundcup .',NULL,NULL,NULL,NULL,NULL),('demo:SmileyToiletBrush','data object (smiley toilet brush) for image collection demo','a','fedoraadmin',1214975382015,1378876083124,1214975383093,' smiley toilet brush .',NULL,NULL,' at least one of you will be smiling while you put this item to use. .',NULL,NULL,NULL,NULL,NULL,' demo:smileytoiletbrush .',NULL,NULL,NULL,NULL,NULL),('demo:SmileyWastebasket','data object (smiley wastebasket) for image collection demo','a','fedoraadmin',1214975382015,1378876083378,1214975383125,' smiley wastebasket .',NULL,NULL,' you can throw your trash in this.  don\'t forget to recycle! .',NULL,NULL,NULL,NULL,NULL,' demo:smileywastebasket .',NULL,NULL,NULL,NULL,NULL),('demo:Collection','service definition object (collection) for image collection demo','a','fedoraadmin',1214975382015,1378876083559,1214975383125,' service definition object (collection) for image collection demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:collection .',NULL,NULL,NULL,NULL,NULL),('demo:DualResolution','service definition object (image) for image collection demo','a','fedoraadmin',1214975382015,1378876083682,1214975383156,' service definition object (image) for image collection demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:dualresolution .',NULL,NULL,NULL,NULL,NULL),('demo:CollectionImpl','service deployment object (collection) for image collection demo','a','fedoraadmin',1214975382015,1378876083773,1214975383171,' service deployment object (collection) for image collection demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:collectionimpl demo:imagecollectionimpl .',NULL,NULL,NULL,NULL,NULL),('demo:DualResImageImpl','service deployment object (image) for image collection demo','a','fedoraadmin',1214975382015,1378876083885,1214975383203,' service deployment object (image) for image collection demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:dualresimageimpl .',NULL,NULL,NULL,NULL,NULL),('demo:UVA_STD_IMAGE','content model object for image manipulation demo','a','fedoraadmin',1187188595656,1378876084003,1187188595656,' content model object for image manipulation demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:uva_std_image .',NULL,NULL,NULL,NULL,NULL),('demo:29','data object for image manipulation demo','a','fedoraadmin',1214975382015,1378876084145,1214975383234,' coliseum in rome .',' thornton staples .',' architecture, roman .',' image of coliseum in rome .',' university of virginia library .',NULL,NULL,NULL,' image/jpeg .',' demo:29 .',NULL,NULL,NULL,NULL,NULL),('demo:27','service definition object for image manipulation demo','a','fedoraadmin',1214975382015,1378876084264,1214975383250,' service definition object for image manipulation demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:27 .',NULL,NULL,NULL,NULL,NULL),('demo:28','service deployment object for image manipulation demo','a','fedoraadmin',1214975382015,1378876084358,1214975383281,' service deployment object for image manipulation demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:28 .',NULL,NULL,NULL,NULL,NULL),('demo:18','data object (ecdl paper) for simple document demo','a','fedoraadmin',1214975382015,1378876084588,1214975383312,' the mellon fedora project: digital library architecture meets xml and web services .',' sandra payette thornton staples .',' fedora repository architecture digital libraries web service open source software .',' paper on the fedora project, presented at the european digital library conference (ecdl) in 2002, rome, italy .',' springer .',NULL,' 2002-09-17 .',NULL,' application/pdf application/msword application/ps .',' demo:18 .',NULL,NULL,' http://www.fedora.info .',NULL,' unrestricted .'),('demo:31','data object (svg) for simple document demo','a','fedoraadmin',1214975382015,1378876084678,1214975383328,' data object (svg) for simple document demo .',' chris wilper the apache group .',' svg batik apache .',' demonstration digital object containing svg from the batik 1.5 distribution .',' the apache group .',NULL,NULL,NULL,' image/svg+xml .',' demo:31 .',NULL,NULL,' http://xml.apache.org/batik/ .',NULL,' the apache license .'),('demo:UVA_STD_IMAGE_1','content model object (4 jpegs) for local simple image demo','a','fedoraadmin',1187188597171,1378876084769,1187188597171,' content model object (4 jpegs) for local simple image demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:uva_std_image_1 .',NULL,NULL,NULL,NULL,NULL),('demo:5','data object (coliseum) for local simple image demo','a','fedoraadmin',1214975382015,1378876085213,1214975383375,' coliseum in rome .',' thornton staples .',' architecture, roman .',' image of coliseum in rome .',' university of virginia library .',NULL,NULL,NULL,' image/jpeg .',' demo:5 .',NULL,NULL,NULL,NULL,NULL),('demo:1','service definition object for simple image demos','a','fedoraadmin',1214975382015,1378876085296,1214975383390,' service definition object for simple image demos .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:1 .',NULL,NULL,NULL,NULL,NULL),('demo:2','service deployment object for local simple image demo','a','fedoraadmin',1214975382015,1378876085403,1214975383406,' service deployment object for local simple image demo .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' demo:2 .',NULL,NULL,NULL,NULL,NULL),('SlyMedia:root','slymedia repository','a','fedoraadmin',1378877328355,1378953250936,1378953250936,' islandora repository .',' sly media networks llc .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,' slymedia:root .',NULL,' english .',NULL,NULL,' all rights reserved sly media networks llc 2013 .'),('islandora:compoundCModel','islandora compound object content model','a','fedoraadmin',1378905839364,1378905839364,1378905839364,' islandora compound object content model .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:compoundcmodel .',NULL,NULL,NULL,NULL,NULL),('islandora:compound_collection','compound collection','a','fedoraadmin',1378905839857,1378905839857,1378905839857,' compound collection .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:compound_collection .',NULL,NULL,NULL,NULL,NULL),('islandora:newspaperCModel','islandora newspaper content model','a','fedoraadmin',1378905841996,1378905841996,1378905841996,' islandora newspaper content model .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:newspapercmodel .',NULL,NULL,NULL,NULL,NULL),('islandora:newspaperIssueCModel','islandora newspaper issue content model','a','fedoraadmin',1378905842231,1378905842231,1378905842231,' islandora newspaper issue content model .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:newspaperissuecmodel .',NULL,NULL,NULL,NULL,NULL),('islandora:newspaperPageCModel','islandora newspaper page content model','a','fedoraadmin',1378905842480,1378905842480,1378905842480,' islandora newspaper page content model .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:newspaperpagecmodel .',NULL,NULL,NULL,NULL,NULL),('islandora:newspaper_collection','newspaper collection','a','fedoraadmin',1378905842721,1378905842721,1378905842721,' newspaper collection .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:newspaper_collection .',NULL,NULL,NULL,NULL,NULL),('islandora:sp_large_image_cmodel','islandora large image content model','a','fedoraadmin',1378908375586,1378908375586,1378908375586,' islandora large image content model .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:sp_large_image_cmodel .',NULL,NULL,NULL,NULL,NULL),('islandora:sp_large_image_collection','large image collection','a','fedoraadmin',1378908376506,1378908376506,1378908376506,' large image collection .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:sp_large_image_collection .',NULL,NULL,NULL,NULL,NULL),('islandora:sp-audioCModel','islandora audio content model','a','fedoraadmin',1378910442095,1378910442095,1378910442095,' islandora audio content model .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:sp-audiocmodel .',NULL,NULL,NULL,NULL,NULL),('islandora:audio_collection','audio collection','a','fedoraadmin',1378910442400,1378910442400,1378910442400,' audio collection .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:audio_collection .',NULL,NULL,NULL,NULL,NULL),('islandora:pageCModel','islandora page content model','a','fedoraadmin',1378910471837,1378910471837,1378910471837,' islandora page content model .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:pagecmodel .',NULL,NULL,NULL,NULL,NULL),('islandora:bookCModel','islandora internet archive book content model','a','fedoraadmin',1378910472124,1378910472124,1378910472124,' islandora internet archive book content model .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:bookcmodel .',NULL,NULL,NULL,NULL,NULL),('islandora:bookCollection','book collection','a','fedoraadmin',1378910472434,1378910472434,1378910472434,' book collection .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:bookcollection .',NULL,NULL,NULL,NULL,NULL),('islandora:sp_pdf','islandora pdf content model','a','fedoraadmin',1378910485155,1378910485155,1378910485155,' islandora pdf content model .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:sp_pdf .',NULL,NULL,NULL,NULL,NULL),('islandora:sp_pdf_collection','pdf collection','a','fedoraadmin',1378910485386,1378910485386,1378910485386,' pdf collection .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:sp_pdf_collection .',NULL,NULL,NULL,NULL,NULL),('islandora:sp_videoCModel','islandora video content model','a','fedoraadmin',1378910496764,1378910496764,1378910496764,' islandora video content model .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:sp_videocmodel .',NULL,NULL,NULL,NULL,NULL),('islandora:video_collection','video collection','a','fedoraadmin',1378910497049,1378910497049,1378910497049,' video collection .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:video_collection .',NULL,NULL,NULL,NULL,NULL),('islandora:collectionCModel','islandora collection content model','a','fedoraadmin',1379365291800,1379365291800,1379365291800,' islandora collection content model .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:collectioncmodel .',NULL,NULL,NULL,NULL,NULL),('islandora:sp_basic_image','islandora basic image content model','a','fedoraadmin',1379365737109,1379365737109,1379365737109,' islandora basic image content model .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:sp_basic_image .',NULL,NULL,NULL,NULL,NULL),('islandora:sp_basic_image_collection','basic image collection','a','fedoraadmin',1379365737616,1379365737616,1379365737616,' basic image collection .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:sp_basic_image_collection .',NULL,NULL,NULL,NULL,NULL),('islandora:root','top-level collections','a','fedoraadmin',1379365747409,1380594847784,1379365747409,' top-level collection .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:root .',NULL,NULL,NULL,NULL,NULL),('islandora:6','photo of gaylord couchman','a','dbq_sandbox',1380300370632,1380300371898,1380300370920,' photo of gaylord couchman .',NULL,' ----couchman, gaylord. ----couchman, gaylord.---- .',' picture of gaylord couchman, president of the university of dubuque  .','  .',' () .',NULL,' stillimage  .','  nonprojected graphic .',' islandora:6 .',NULL,'  .',NULL,'  asia--------   .',NULL),('islandora:27','faculty publications','a','dbq_sandbox',1381787796546,1381788016379,1381787796546,' faculty publications .',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' islandora:27 .',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `doFields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doRegistry`
--

DROP TABLE IF EXISTS `doRegistry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doRegistry` (
  `doPID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `systemVersion` int(11) NOT NULL DEFAULT '0',
  `ownerId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `objectState` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`doPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doRegistry`
--

LOCK TABLES `doRegistry` WRITE;
/*!40000 ALTER TABLE `doRegistry` DISABLE KEYS */;
INSERT INTO `doRegistry` VALUES ('SlyMedia:root',9,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:1',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:12',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:13',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:14',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:18',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:19',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:2',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:20',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:21',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:22',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:25',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:26',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:27',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:28',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:29',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:31',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:5',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:Collection',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:CollectionImpl',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:DualResImage',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:DualResImageCollection',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:DualResImageImpl',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:DualResolution',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:FO_TO_PDFDOC',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:SmileyBeerGlass',2,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:SmileyBucket',3,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:SmileyDinnerware',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:SmileyEarring',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:SmileyGreetingCard',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:SmileyKeychain',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:SmileyNightlight',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:SmileyPens',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:SmileyShortRoundCup',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:SmileyStuff',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:SmileyTallRoundCup',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:SmileyToiletBrush',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:SmileyWastebasket',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:TEI_TO_PDFDOC',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:UVA_STD_IMAGE',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:UVA_STD_IMAGE_1',1,'the ownerID field is no longer used','A','the label field is no longer used'),('demo:XML_TO_HTMLDOC',1,'the ownerID field is no longer used','A','the label field is no longer used'),('fedora-system:ContentModel-3.0',1,'the ownerID field is no longer used','A','the label field is no longer used'),('fedora-system:FedoraObject-3.0',1,'the ownerID field is no longer used','A','the label field is no longer used'),('fedora-system:ServiceDefinition-3.0',1,'the ownerID field is no longer used','A','the label field is no longer used'),('fedora-system:ServiceDeployment-3.0',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:27',3,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:6',3,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:audio_collection',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:bookCModel',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:bookCollection',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:collectionCModel',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:compoundCModel',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:compound_collection',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:newspaperCModel',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:newspaperIssueCModel',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:newspaperPageCModel',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:newspaper_collection',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:pageCModel',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:root',2,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:sp-audioCModel',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:sp_basic_image',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:sp_basic_image_collection',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:sp_large_image_cmodel',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:sp_large_image_collection',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:sp_pdf',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:sp_pdf_collection',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:sp_videoCModel',1,'the ownerID field is no longer used','A','the label field is no longer used'),('islandora:video_collection',1,'the ownerID field is no longer used','A','the label field is no longer used');
/*!40000 ALTER TABLE `doRegistry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelDeploymentMap`
--

DROP TABLE IF EXISTS `modelDeploymentMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelDeploymentMap` (
  `cModel` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sDef` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sDep` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelDeploymentMap`
--

LOCK TABLES `modelDeploymentMap` WRITE;
/*!40000 ALTER TABLE `modelDeploymentMap` DISABLE KEYS */;
INSERT INTO `modelDeploymentMap` VALUES ('demo:XML_TO_HTMLDOC','demo:12','demo:13'),('demo:FO_TO_PDFDOC','demo:19','demo:20'),('demo:TEI_TO_PDFDOC','demo:19','demo:20'),('demo:TEI_TO_PDFDOC','demo:22','demo:25'),('demo:DualResImageCollection','demo:Collection','demo:CollectionImpl'),('demo:DualResImage','demo:DualResolution','demo:DualResImageImpl'),('demo:UVA_STD_IMAGE','demo:27','demo:28'),('demo:UVA_STD_IMAGE_1','demo:1','demo:2');
/*!40000 ALTER TABLE `modelDeploymentMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectPaths`
--

DROP TABLE IF EXISTS `objectPaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectPaths` (
  `tokenDbID` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tokenDbID`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectPaths`
--

LOCK TABLES `objectPaths` WRITE;
/*!40000 ALTER TABLE `objectPaths` DISABLE KEYS */;
/*!40000 ALTER TABLE `objectPaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pidGen`
--

DROP TABLE IF EXISTS `pidGen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pidGen` (
  `namespace` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `highestID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pidGen`
--

LOCK TABLES `pidGen` WRITE;
/*!40000 ALTER TABLE `pidGen` DISABLE KEYS */;
INSERT INTO `pidGen` VALUES ('demo',31),('islandora',29),('SlyMedia',2);
/*!40000 ALTER TABLE `pidGen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-05 15:23:39
