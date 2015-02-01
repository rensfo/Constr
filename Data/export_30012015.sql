--------------------------------------------------------
--  File created - пятница-Январь-30-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table MD_ACTIONTYPE
--------------------------------------------------------

  CREATE TABLE "MD_ACTIONTYPE" 
   (	"ID" NUMBER, 
	"CODE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(60 BYTE)
   ) ;

   COMMENT ON TABLE "MD_ACTIONTYPE"  IS 'Тип действий';
--------------------------------------------------------
--  DDL for Table MD_COL
--------------------------------------------------------

  CREATE TABLE "MD_COL" 
   (	"ID" NUMBER, 
	"CODE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(60 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MD_DATATYPE
--------------------------------------------------------

  CREATE TABLE "MD_DATATYPE" 
   (	"ID" NUMBER, 
	"CODE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(60 BYTE)
   ) ;

   COMMENT ON TABLE "MD_DATATYPE"  IS 'Тип данных';
--------------------------------------------------------
--  DDL for Table MD_DOMAIN
--------------------------------------------------------

  CREATE TABLE "MD_DOMAIN" 
   (	"ID" NUMBER, 
	"CODE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(60 BYTE), 
	"IDDATATYPE" NUMBER DEFAULT (null)
   ) ;

   COMMENT ON TABLE "MD_DOMAIN"  IS 'Домен';
--------------------------------------------------------
--  DDL for Table MD_MAINMENU
--------------------------------------------------------

  CREATE TABLE "MD_MAINMENU" 
   (	"ID" NUMBER, 
	"IDPARENT" NUMBER, 
	"CODE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(60 BYTE)
   ) ;

   COMMENT ON TABLE "MD_MAINMENU"  IS 'Главное меню';
--------------------------------------------------------
--  DDL for Table MD_MAINMENUACTION
--------------------------------------------------------

  CREATE TABLE "MD_MAINMENUACTION" 
   (	"ID" NUMBER, 
	"IDMAINMENU" NUMBER, 
	"IDACTIONTYPE" NUMBER DEFAULT (null), 
	"CODE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(60 BYTE), 
	"IDOBJFRM" NUMBER
   ) ;

   COMMENT ON TABLE "MD_MAINMENUACTION"  IS 'Действия главного меню';
--------------------------------------------------------
--  DDL for Table MD_OBJ
--------------------------------------------------------

  CREATE TABLE "MD_OBJ" 
   (	"ID" NUMBER, 
	"IDPARENT" NUMBER, 
	"CODE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(60 BYTE), 
	"HAVECATALOG" NUMBER, 
	"IDOBJCATALOG" NUMBER, 
	"IDCATALOG" NUMBER
   ) ;

   COMMENT ON TABLE "MD_OBJ"  IS 'Бизнес-объекты';
--------------------------------------------------------
--  DDL for Table MD_OBJACT
--------------------------------------------------------

  CREATE TABLE "MD_OBJACT" 
   (	"ID" NUMBER, 
	"IDOBJ" NUMBER, 
	"CODE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(60 BYTE), 
	"TEXT" VARCHAR2(2000 BYTE), 
	"IDACTIONTYPE" NUMBER
   ) ;

   COMMENT ON TABLE "MD_OBJACT"  IS 'Действия бизнес-объекта';
--------------------------------------------------------
--  DDL for Table MD_OBJCOL
--------------------------------------------------------

  CREATE TABLE "MD_OBJCOL" 
   (	"ID" NUMBER, 
	"IDOBJ" NUMBER, 
	"IDDOMAIN" NUMBER, 
	"IDCOL" NUMBER
   ) ;

   COMMENT ON TABLE "MD_OBJCOL"  IS 'Колонки таблицы';
--------------------------------------------------------
--  DDL for Table MD_OBJFRM
--------------------------------------------------------

  CREATE TABLE "MD_OBJFRM" 
   (	"ID" NUMBER, 
	"IDOBJ" NUMBER, 
	"CODE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(60 BYTE), 
	"ISCATALOGVISIBLE" NUMBER(1,0), 
	"IDOBJVIEW" NUMBER
   ) ;

   COMMENT ON COLUMN "MD_OBJFRM"."ID" IS 'ID';
   COMMENT ON COLUMN "MD_OBJFRM"."IDOBJVIEW" IS 'Представление для каталогов';
   COMMENT ON TABLE "MD_OBJFRM"  IS 'Формы';
--------------------------------------------------------
--  DDL for Table MD_OBJFRMVIEW
--------------------------------------------------------

  CREATE TABLE "MD_OBJFRMVIEW" 
   (	"ID" NUMBER, 
	"IDOBJFRM" NUMBER, 
	"IDPARENT" NUMBER, 
	"IDOBJVIEW" NUMBER
   ) ;

   COMMENT ON COLUMN "MD_OBJFRMVIEW"."ID" IS 'ID';
   COMMENT ON COLUMN "MD_OBJFRMVIEW"."IDOBJFRM" IS 'Форма';
   COMMENT ON COLUMN "MD_OBJFRMVIEW"."IDPARENT" IS 'Родительский элемент';
   COMMENT ON COLUMN "MD_OBJFRMVIEW"."IDOBJVIEW" IS 'Представление';
   COMMENT ON TABLE "MD_OBJFRMVIEW"  IS 'Элементы формы';
--------------------------------------------------------
--  DDL for Table MD_OBJFRMVIEWCOL
--------------------------------------------------------

  CREATE TABLE "MD_OBJFRMVIEWCOL" 
   (	"ID" NUMBER, 
	"IDOBJFRMVIEW" NUMBER, 
	"IDOBJVIEWCOL" NUMBER, 
	"ISVISIBLE" NUMBER(1,0), 
	"ISEDITABLE" NUMBER(1,0), 
	"ISMULTILINE" NUMBER(1,0), 
	"SETTER" VARCHAR2(100 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MD_OBJVIEW
--------------------------------------------------------

  CREATE TABLE "MD_OBJVIEW" 
   (	"ID" NUMBER, 
	"IDOBJ" NUMBER, 
	"VIEWNAME" VARCHAR2(60 BYTE), 
	"CODE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(60 BYTE), 
	"IDPARENT" NUMBER, 
	"IDVIEWCATALOG" NUMBER
   ) ;

   COMMENT ON TABLE "MD_OBJVIEW"  IS 'Представления бизнес-объекта';
--------------------------------------------------------
--  DDL for Table MD_OBJVIEWACT
--------------------------------------------------------

  CREATE TABLE "MD_OBJVIEWACT" 
   (	"ID" NUMBER, 
	"IDOBJACT" NUMBER, 
	"IDOBJVIEW" NUMBER, 
	"NORDER" NUMBER
   ) ;

   COMMENT ON TABLE "MD_OBJVIEWACT"  IS 'Действия бизнес-объекта';
--------------------------------------------------------
--  DDL for Table MD_OBJVIEWCOL
--------------------------------------------------------

  CREATE TABLE "MD_OBJVIEWCOL" 
   (	"ID" NUMBER, 
	"IDOBJVIEW" NUMBER, 
	"IDDOMAIN" NUMBER, 
	"ISID" NUMBER(1,0), 
	"ISIDPARENT" NUMBER(1,0) DEFAULT ( null ), 
	"ISIDPARENTOBJECT" NUMBER(1,0), 
	"ISIDCATALOG" NUMBER(1,0), 
	"IDOBJCOL" NUMBER, 
	"IDCOL" NUMBER
   ) ;

   COMMENT ON TABLE "MD_OBJVIEWCOL"  IS 'Колонки представления';
--------------------------------------------------------
--  DDL for Table MD_OBJVIEWCON
--------------------------------------------------------

  CREATE TABLE "MD_OBJVIEWCON" 
   (	"ID" NUMBER, 
	"IDOBJVIEW" NUMBER, 
	"IDOBJVIEWCOL" NUMBER, 
	"IDOBJVIEWREFCOL" NUMBER
   ) ;

   COMMENT ON TABLE "MD_OBJVIEWCON"  IS 'Ограничения представления';
--------------------------------------------------------
--  DDL for Table MD_OBJVIEWCONCOL
--------------------------------------------------------

  CREATE TABLE "MD_OBJVIEWCONCOL" 
   (	"ID" NUMBER, 
	"IDCOLUMN" NUMBER, 
	"IDREFCOLUMN" NUMBER, 
	"IDOBJVIEWCON" NUMBER
   ) ;

   COMMENT ON TABLE "MD_OBJVIEWCONCOL"  IS 'Колонки ограничения представления';
--------------------------------------------------------
--  DDL for Table STD_CATALOG
--------------------------------------------------------

  CREATE TABLE "STD_CATALOG" 
   (	"ID" NUMBER, 
	"IDPARENT" NUMBER, 
	"CODE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(60 BYTE)
   ) ;

   COMMENT ON TABLE "STD_CATALOG"  IS 'Стандартная таблица каталогов';
--------------------------------------------------------
--  DDL for View MD_OBJACT_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MD_OBJACT_V" ("ID", "IDOBJ", "CODE", "NAME", "TEXT", "IDACTIONTYPE") AS 
  select ID, IDOBJ, CODE, NAME, TEXT,IDACTIONTYPE 
from MD_ObjAct;
--------------------------------------------------------
--  DDL for View MD_OBJCOL_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MD_OBJCOL_V" ("ID", "IDOBJ", "CODE", "NAME", "IDDOMAIN") AS 
  select ID,IDOBJ,CODE,NAME,IDDOMAIN
from MD_ObjCol;
--------------------------------------------------------
--  DDL for View MD_OBJ_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MD_OBJ_V" ("ID", "IDPARENT", "CODE", "NAME", "HAVECATALOG", "IDOBJCATALOG", "IDCATALOG", "OBJCATALOGCODE", "OBJCATALOGNAME") AS 
  select t.ID,t.IDPARENT,t.CODE,t.NAME,t.HAVECATALOG,t.IDOBJCATALOG,t.IDCATALOG, tc.code ObjCatalogCode, tc.name ObjCatalogName
from MD_Obj t left join MD_Obj tc on (t.idObjCatalog = tc.id);
--------------------------------------------------------
--  DDL for View MD_OBJVIEWACT_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MD_OBJVIEWACT_V" ("ID", "IDOBJACT", "IDOBJVIEW", "CODE", "NAME", "TEXT", "IDAT", "CODEAT", "NAMEAT") AS 
  select ova.id, ova.idObjAct, ova.idObjView, oa.code, oa.name, oa.text, at.id idAT, at.code codeAT, at.name nameAT
from MD_ObjViewAct ova, MD_ObjAct oa, MD_ActionType at
where oa.id = ova.idObjAct
 and oa.idActionType = at.id
order by ova.nOrder;
--------------------------------------------------------
--  DDL for View MD_OBJVIEWCOL_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MD_OBJVIEWCOL_V" ("ID", "IDOBJVIEW", "CODE", "NAME", "IDDOMAIN", "ISID", "ISIDPARENT", "ISIDPARENTOBJECT", "ISIDCATALOG", "ISVISIBLE", "ISEDITABLE", "SETTER", "ISMULTILINE") AS 
  SELECT ID,IDOBJVIEW,CODE,NAME,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,ISVISIBLE,ISEDITABLE,SETTER,ISMULTILINE
  FROM MD_ObjViewCol;
--------------------------------------------------------
--  DDL for View MD_OBJVIEW_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MD_OBJVIEW_V" ("ID", "IDOBJ", "VIEWNAME", "CODE", "NAME", "IDPARENT", "IDVIEWCATALOG") AS 
  select ID,IDOBJ,VIEWNAME,CODE,NAME,IDPARENT,IDVIEWCATALOG
  from MD_ObjView;
--------------------------------------------------------
--  DDL for View STD_CATALOG_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "STD_CATALOG_V" ("ID", "IDPARENT", "CODE", "NAME") AS 
  select "ID","IDPARENT","CODE","NAME" from STD_Catalog;
REM INSERTING into MD_ACTIONTYPE
SET DEFINE OFF;
Insert into MD_ACTIONTYPE (ID,CODE,NAME) values ('1','openForm','Открыть форму');
Insert into MD_ACTIONTYPE (ID,CODE,NAME) values ('2','exit','Выход');
Insert into MD_ACTIONTYPE (ID,CODE,NAME) values ('3','refresh','Обновить таблицу');
Insert into MD_ACTIONTYPE (ID,CODE,NAME) values ('4','insert','Вставка');
Insert into MD_ACTIONTYPE (ID,CODE,NAME) values ('5','delete','Удаление');
Insert into MD_ACTIONTYPE (ID,CODE,NAME) values ('6','other','Прочее');
Insert into MD_ACTIONTYPE (ID,CODE,NAME) values ('7','search','Поиск');
Insert into MD_ACTIONTYPE (ID,CODE,NAME) values ('8','copy','Копировать');
REM INSERTING into MD_COL
SET DEFINE OFF;
Insert into MD_COL (ID,CODE,NAME) values ('1','id','id');
Insert into MD_COL (ID,CODE,NAME) values ('2','code','Мнемокод');
Insert into MD_COL (ID,CODE,NAME) values ('3','name','Наименование');
Insert into MD_COL (ID,CODE,NAME) values ('4','haveCatalog','haveCatalog');
Insert into MD_COL (ID,CODE,NAME) values ('5','idCatalog','idCatalog');
Insert into MD_COL (ID,CODE,NAME) values ('6','idDomain','idDomain');
Insert into MD_COL (ID,CODE,NAME) values ('7','idParent','idParent');
Insert into MD_COL (ID,CODE,NAME) values ('8','idTable','idTable');
Insert into MD_COL (ID,CODE,NAME) values ('9','idTableAction','idTableAction');
Insert into MD_COL (ID,CODE,NAME) values ('10','idTableCatalog','idTableCatalog');
Insert into MD_COL (ID,CODE,NAME) values ('11','idTableView','idTableView');
Insert into MD_COL (ID,CODE,NAME) values ('12','isID','Идентификатор');
Insert into MD_COL (ID,CODE,NAME) values ('13','isIdCatalog','Каталог');
Insert into MD_COL (ID,CODE,NAME) values ('14','isIdParent','Родитель');
Insert into MD_COL (ID,CODE,NAME) values ('15','isIdParentObject','Родительский объект');
Insert into MD_COL (ID,CODE,NAME) values ('16','tableCatalogCode','Код каталога');
Insert into MD_COL (ID,CODE,NAME) values ('17','tableCatalogName','Наименование каталога');
Insert into MD_COL (ID,CODE,NAME) values ('18','text','Текст');
Insert into MD_COL (ID,CODE,NAME) values ('19','textAction','Текст действия');
Insert into MD_COL (ID,CODE,NAME) values ('20','viewName','Текст запроса');
REM INSERTING into MD_DATATYPE
SET DEFINE OFF;
Insert into MD_DATATYPE (ID,CODE,NAME) values ('1','String','Строка');
Insert into MD_DATATYPE (ID,CODE,NAME) values ('2','Number','Число');
Insert into MD_DATATYPE (ID,CODE,NAME) values ('3','Float','Вещественное число');
REM INSERTING into MD_DOMAIN
SET DEFINE OFF;
Insert into MD_DOMAIN (ID,CODE,NAME,IDDATATYPE) values ('1','ID','Идентификатор','2');
Insert into MD_DOMAIN (ID,CODE,NAME,IDDATATYPE) values ('2','code','Мнемокод','1');
Insert into MD_DOMAIN (ID,CODE,NAME,IDDATATYPE) values ('3','name','Наименование','1');
Insert into MD_DOMAIN (ID,CODE,NAME,IDDATATYPE) values ('4','boolean','Логический','2');
REM INSERTING into MD_MAINMENU
SET DEFINE OFF;
Insert into MD_MAINMENU (ID,IDPARENT,CODE,NAME) values ('1',null,'menu1','Меню 1');
Insert into MD_MAINMENU (ID,IDPARENT,CODE,NAME) values ('2','1','file','Файл');
REM INSERTING into MD_MAINMENUACTION
SET DEFINE OFF;
Insert into MD_MAINMENUACTION (ID,IDMAINMENU,IDACTIONTYPE,CODE,NAME,IDOBJFRM) values ('1','2','1','MD_Object','Объекты','1');
Insert into MD_MAINMENUACTION (ID,IDMAINMENU,IDACTIONTYPE,CODE,NAME,IDOBJFRM) values ('2','2','2','exit','Выход',null);
REM INSERTING into MD_OBJ
SET DEFINE OFF;
Insert into MD_OBJ (ID,IDPARENT,CODE,NAME,HAVECATALOG,IDOBJCATALOG,IDCATALOG) values ('1',null,'Table','Таблица','1','6','2');
Insert into MD_OBJ (ID,IDPARENT,CODE,NAME,HAVECATALOG,IDOBJCATALOG,IDCATALOG) values ('2','1','Action','Действие','0',null,'2');
Insert into MD_OBJ (ID,IDPARENT,CODE,NAME,HAVECATALOG,IDOBJCATALOG,IDCATALOG) values ('3','1','Colunm','Колонка','0',null,'2');
Insert into MD_OBJ (ID,IDPARENT,CODE,NAME,HAVECATALOG,IDOBJCATALOG,IDCATALOG) values ('4','1','View','Представление','0',null,'2');
Insert into MD_OBJ (ID,IDPARENT,CODE,NAME,HAVECATALOG,IDOBJCATALOG,IDCATALOG) values ('5','4','ViewColumn','Колонка представления','0',null,'2');
Insert into MD_OBJ (ID,IDPARENT,CODE,NAME,HAVECATALOG,IDOBJCATALOG,IDCATALOG) values ('6',null,'Catalog','Каталог','0',null,'2');
Insert into MD_OBJ (ID,IDPARENT,CODE,NAME,HAVECATALOG,IDOBJCATALOG,IDCATALOG) values ('7','4','TableAction','Действие',null,null,'2');
REM INSERTING into MD_OBJACT
SET DEFINE OFF;
Insert into MD_OBJACT (ID,IDOBJ,CODE,NAME,TEXT,IDACTIONTYPE) values ('1','1','refresh','Обновить',null,'3');
Insert into MD_OBJACT (ID,IDOBJ,CODE,NAME,TEXT,IDACTIONTYPE) values ('2','1','insert','Создать','query.prepare("insert into MD_Table values(null,  null, null, 0, null, null)");
//query.bindValue(":code", value);
//query.bindValue(":id", currentRow.value(id));
if(query.exec()){  }','4');
Insert into MD_OBJACT (ID,IDOBJ,CODE,NAME,TEXT,IDACTIONTYPE) values ('4','1','copy','Копировать',null,'8');
Insert into MD_OBJACT (ID,IDOBJ,CODE,NAME,TEXT,IDACTIONTYPE) values ('5','1','delete','Удалить',null,'5');
Insert into MD_OBJACT (ID,IDOBJ,CODE,NAME,TEXT,IDACTIONTYPE) values ('6','1','search','Найти',null,'7');
REM INSERTING into MD_OBJCOL
SET DEFINE OFF;
Insert into MD_OBJCOL (ID,IDOBJ,IDDOMAIN,IDCOL) values ('1','1',null,'1');
Insert into MD_OBJCOL (ID,IDOBJ,IDDOMAIN,IDCOL) values ('2','1',null,'2');
Insert into MD_OBJCOL (ID,IDOBJ,IDDOMAIN,IDCOL) values ('3','1',null,'3');
REM INSERTING into MD_OBJFRM
SET DEFINE OFF;
Insert into MD_OBJFRM (ID,IDOBJ,CODE,NAME,ISCATALOGVISIBLE,IDOBJVIEW) values ('1','1','Object','Объекты','1','6');
Insert into MD_OBJFRM (ID,IDOBJ,CODE,NAME,ISCATALOGVISIBLE,IDOBJVIEW) values ('2','6','Catalog','Каталог',null,null);
REM INSERTING into MD_OBJFRMVIEW
SET DEFINE OFF;
Insert into MD_OBJFRMVIEW (ID,IDOBJFRM,IDPARENT,IDOBJVIEW) values ('1','1',null,'1');
Insert into MD_OBJFRMVIEW (ID,IDOBJFRM,IDPARENT,IDOBJVIEW) values ('2','1','1','2');
Insert into MD_OBJFRMVIEW (ID,IDOBJFRM,IDPARENT,IDOBJVIEW) values ('3','1','1','3');
Insert into MD_OBJFRMVIEW (ID,IDOBJFRM,IDPARENT,IDOBJVIEW) values ('4','1','1','4');
Insert into MD_OBJFRMVIEW (ID,IDOBJFRM,IDPARENT,IDOBJVIEW) values ('5','1','4','5');
Insert into MD_OBJFRMVIEW (ID,IDOBJFRM,IDPARENT,IDOBJVIEW) values ('7','1','4','7');
REM INSERTING into MD_OBJFRMVIEWCOL
SET DEFINE OFF;
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('1','1','1',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('2','1','2',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('3','1','3',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('4','1','4','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('5','1','5','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('6','1','25',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('7','1','43',null,'1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('8','1','44','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('9','1','45','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('10','2','32',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('11','2','33',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('12','2','34','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('13','2','35','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('14','2','36','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('15','3','37',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('16','3','38',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('17','3','39','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('18','3','40','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('19','3','41',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('20','4','6',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('21','4','7',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('22','4','8','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('23','4','9','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('24','4','10','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('25','4','11',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('26','5','12',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('27','5','13',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('28','5','14','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('29','5','15','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('30','5','16',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('31','5','17','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('32','5','18','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('33','5','19','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('34','5','20','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('35','7','26',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('36','7','27',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('37','7','28',null,null,null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('38','7','29','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('39','7','30','1','1',null,null);
Insert into MD_OBJFRMVIEWCOL (ID,IDOBJFRMVIEW,IDOBJVIEWCOL,ISVISIBLE,ISEDITABLE,ISMULTILINE,SETTER) values ('40','7','31','1','1',null,null);
REM INSERTING into MD_OBJVIEW
SET DEFINE OFF;
Insert into MD_OBJVIEW (ID,IDOBJ,VIEWNAME,CODE,NAME,IDPARENT,IDVIEWCATALOG) values ('1','1','MD_Obj_V','Object','Объекты',null,'6');
Insert into MD_OBJVIEW (ID,IDOBJ,VIEWNAME,CODE,NAME,IDPARENT,IDVIEWCATALOG) values ('2','2','MD_ObjAct_V','Action','Дествия','1',null);
Insert into MD_OBJVIEW (ID,IDOBJ,VIEWNAME,CODE,NAME,IDPARENT,IDVIEWCATALOG) values ('3','3','MD_ObjCol_V','Colunm','Поля','1',null);
Insert into MD_OBJVIEW (ID,IDOBJ,VIEWNAME,CODE,NAME,IDPARENT,IDVIEWCATALOG) values ('4','4','MD_ObjView_V','View','Предствления','1',null);
Insert into MD_OBJVIEW (ID,IDOBJ,VIEWNAME,CODE,NAME,IDPARENT,IDVIEWCATALOG) values ('5','5','MD_ObjViewCol_V','ViewColumn','Колонки представления','4',null);
Insert into MD_OBJVIEW (ID,IDOBJ,VIEWNAME,CODE,NAME,IDPARENT,IDVIEWCATALOG) values ('6','6','STD_Catalog_V','Catalog','Каталог',null,null);
Insert into MD_OBJVIEW (ID,IDOBJ,VIEWNAME,CODE,NAME,IDPARENT,IDVIEWCATALOG) values ('7','7','MD_ObjViewAct_V','ViewAction','Действия','4',null);
REM INSERTING into MD_OBJVIEWACT
SET DEFINE OFF;
Insert into MD_OBJVIEWACT (ID,IDOBJACT,IDOBJVIEW,NORDER) values ('1','1','1','6');
Insert into MD_OBJVIEWACT (ID,IDOBJACT,IDOBJVIEW,NORDER) values ('2','2','1','2');
Insert into MD_OBJVIEWACT (ID,IDOBJACT,IDOBJVIEW,NORDER) values ('4','4','1','4');
Insert into MD_OBJVIEWACT (ID,IDOBJACT,IDOBJVIEW,NORDER) values ('5','5','1','5');
Insert into MD_OBJVIEWACT (ID,IDOBJACT,IDOBJVIEW,NORDER) values ('6','6','1','1');
REM INSERTING into MD_OBJVIEWCOL
SET DEFINE OFF;
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('3','1','2',null,null,null,null,null,'2');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('2','1','1',null,'1',null,null,null,'7');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('4','1','3',null,null,null,null,null,'3');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('5','1','4',null,null,null,null,null,'4');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('6','4',null,'1',null,null,null,null,'1');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('7','4',null,null,null,'1',null,null,'8');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('8','4',null,null,null,null,null,null,'20');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('9','4',null,null,null,null,null,null,'2');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('10','4',null,null,null,null,null,null,'3');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('11','4',null,null,'1',null,null,null,'7');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('12','5',null,'1',null,null,null,null,'1');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('13','5',null,null,null,'1',null,null,'11');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('14','5',null,null,null,null,null,null,'2');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('15','5',null,null,null,null,null,null,'3');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('16','5',null,null,null,null,null,null,'6');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('17','5','4',null,null,null,null,null,'12');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('18','5','4',null,'1',null,null,null,'14');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('19','5','4',null,null,null,null,null,'15');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('20','5','4',null,null,null,null,null,'13');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('21','6','1','1',null,null,null,null,'1');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('22','6','1',null,'1',null,null,null,'7');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('25','1',null,null,null,null,'1',null,'5');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('26','7',null,'1',null,null,null,null,'1');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('27','7',null,null,null,null,null,null,'9');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('28','7',null,null,null,'1',null,null,'11');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('29','7',null,null,null,null,null,null,'2');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('31','7',null,null,null,null,null,null,'19');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('33','2',null,null,null,'1',null,null,'8');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('35','2',null,null,null,null,null,null,'3');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('36','2',null,null,null,null,null,null,'18');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('38','3',null,null,null,'1',null,null,'8');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('39','3',null,null,null,null,null,null,'2');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('40','3',null,null,null,null,null,null,'3');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('41','3',null,null,null,null,null,null,'6');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('45','1','3',null,null,null,null,null,'17');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('1','1','1','1',null,null,null,null,'1');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('23','6','2',null,null,null,null,null,'2');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('24','6','3',null,null,null,null,null,'3');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('30','7',null,null,null,null,null,null,'3');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('32','2',null,'1',null,null,null,null,'1');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('34','2',null,null,null,null,null,null,'2');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('37','3',null,'1',null,null,null,null,'1');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('44','1','2',null,null,null,null,null,'16');
Insert into MD_OBJVIEWCOL (ID,IDOBJVIEW,IDDOMAIN,ISID,ISIDPARENT,ISIDPARENTOBJECT,ISIDCATALOG,IDOBJCOL,IDCOL) values ('43','1','1',null,null,null,null,null,'10');
REM INSERTING into MD_OBJVIEWCON
SET DEFINE OFF;
Insert into MD_OBJVIEWCON (ID,IDOBJVIEW,IDOBJVIEWCOL,IDOBJVIEWREFCOL) values ('1','1','43','1');
REM INSERTING into MD_OBJVIEWCONCOL
SET DEFINE OFF;
Insert into MD_OBJVIEWCONCOL (ID,IDCOLUMN,IDREFCOLUMN,IDOBJVIEWCON) values ('1','43','1','1');
Insert into MD_OBJVIEWCONCOL (ID,IDCOLUMN,IDREFCOLUMN,IDOBJVIEWCON) values ('2','44','3','1');
Insert into MD_OBJVIEWCONCOL (ID,IDCOLUMN,IDREFCOLUMN,IDOBJVIEWCON) values ('3','45','4','1');
REM INSERTING into STD_CATALOG
SET DEFINE OFF;
Insert into STD_CATALOG (ID,IDPARENT,CODE,NAME) values ('1',null,'object','Объекты');
Insert into STD_CATALOG (ID,IDPARENT,CODE,NAME) values ('2','1','common','Основные');
REM INSERTING into MD_OBJACT_V
SET DEFINE OFF;
Insert into MD_OBJACT_V (ID,IDOBJ,CODE,NAME,TEXT,IDACTIONTYPE) values ('1','1','refresh','Обновить',null,'3');
Insert into MD_OBJACT_V (ID,IDOBJ,CODE,NAME,TEXT,IDACTIONTYPE) values ('2','1','insert','Создать','query.prepare("insert into MD_Table values(null,  null, null, 0, null, null)");
//query.bindValue(":code", value);
//query.bindValue(":id", currentRow.value(id));
if(query.exec()){  }','4');
Insert into MD_OBJACT_V (ID,IDOBJ,CODE,NAME,TEXT,IDACTIONTYPE) values ('4','1','copy','Копировать',null,'8');
Insert into MD_OBJACT_V (ID,IDOBJ,CODE,NAME,TEXT,IDACTIONTYPE) values ('5','1','delete','Удалить',null,'5');
Insert into MD_OBJACT_V (ID,IDOBJ,CODE,NAME,TEXT,IDACTIONTYPE) values ('6','1','search','Найти',null,'7');
REM INSERTING into MD_OBJCOL_V
SET DEFINE OFF;
REM INSERTING into MD_OBJ_V
SET DEFINE OFF;
Insert into MD_OBJ_V (ID,IDPARENT,CODE,NAME,HAVECATALOG,IDOBJCATALOG,IDCATALOG,OBJCATALOGCODE,OBJCATALOGNAME) values ('1',null,'Table','Таблица','1','6','2','Catalog','Каталог');
Insert into MD_OBJ_V (ID,IDPARENT,CODE,NAME,HAVECATALOG,IDOBJCATALOG,IDCATALOG,OBJCATALOGCODE,OBJCATALOGNAME) values ('7','4','TableAction','Действие',null,null,'2',null,null);
Insert into MD_OBJ_V (ID,IDPARENT,CODE,NAME,HAVECATALOG,IDOBJCATALOG,IDCATALOG,OBJCATALOGCODE,OBJCATALOGNAME) values ('6',null,'Catalog','Каталог','0',null,'2',null,null);
Insert into MD_OBJ_V (ID,IDPARENT,CODE,NAME,HAVECATALOG,IDOBJCATALOG,IDCATALOG,OBJCATALOGCODE,OBJCATALOGNAME) values ('5','4','ViewColumn','Колонка представления','0',null,'2',null,null);
Insert into MD_OBJ_V (ID,IDPARENT,CODE,NAME,HAVECATALOG,IDOBJCATALOG,IDCATALOG,OBJCATALOGCODE,OBJCATALOGNAME) values ('4','1','View','Представление','0',null,'2',null,null);
Insert into MD_OBJ_V (ID,IDPARENT,CODE,NAME,HAVECATALOG,IDOBJCATALOG,IDCATALOG,OBJCATALOGCODE,OBJCATALOGNAME) values ('3','1','Colunm','Колонка','0',null,'2',null,null);
Insert into MD_OBJ_V (ID,IDPARENT,CODE,NAME,HAVECATALOG,IDOBJCATALOG,IDCATALOG,OBJCATALOGCODE,OBJCATALOGNAME) values ('2','1','Action','Действие','0',null,'2',null,null);
REM INSERTING into MD_OBJVIEWACT_V
SET DEFINE OFF;
Insert into MD_OBJVIEWACT_V (ID,IDOBJACT,IDOBJVIEW,CODE,NAME,TEXT,IDAT,CODEAT,NAMEAT) values ('6','6','1','search','Найти',null,'7','search','Поиск');
Insert into MD_OBJVIEWACT_V (ID,IDOBJACT,IDOBJVIEW,CODE,NAME,TEXT,IDAT,CODEAT,NAMEAT) values ('2','2','1','insert','Создать','query.prepare("insert into MD_Table values(null,  null, null, 0, null, null)");
//query.bindValue(":code", value);
//query.bindValue(":id", currentRow.value(id));
if(query.exec()){  }','4','insert','Вставка');
Insert into MD_OBJVIEWACT_V (ID,IDOBJACT,IDOBJVIEW,CODE,NAME,TEXT,IDAT,CODEAT,NAMEAT) values ('4','4','1','copy','Копировать',null,'8','copy','Копировать');
Insert into MD_OBJVIEWACT_V (ID,IDOBJACT,IDOBJVIEW,CODE,NAME,TEXT,IDAT,CODEAT,NAMEAT) values ('5','5','1','delete','Удалить',null,'5','delete','Удаление');
Insert into MD_OBJVIEWACT_V (ID,IDOBJACT,IDOBJVIEW,CODE,NAME,TEXT,IDAT,CODEAT,NAMEAT) values ('1','1','1','refresh','Обновить',null,'3','refresh','Обновить таблицу');
REM INSERTING into MD_OBJVIEWCOL_V
SET DEFINE OFF;
REM INSERTING into MD_OBJVIEW_V
SET DEFINE OFF;
Insert into MD_OBJVIEW_V (ID,IDOBJ,VIEWNAME,CODE,NAME,IDPARENT,IDVIEWCATALOG) values ('1','1','MD_Obj_V','Object','Объекты',null,'6');
Insert into MD_OBJVIEW_V (ID,IDOBJ,VIEWNAME,CODE,NAME,IDPARENT,IDVIEWCATALOG) values ('2','2','MD_ObjAct_V','Action','Дествия','1',null);
Insert into MD_OBJVIEW_V (ID,IDOBJ,VIEWNAME,CODE,NAME,IDPARENT,IDVIEWCATALOG) values ('3','3','MD_ObjCol_V','Colunm','Поля','1',null);
Insert into MD_OBJVIEW_V (ID,IDOBJ,VIEWNAME,CODE,NAME,IDPARENT,IDVIEWCATALOG) values ('4','4','MD_ObjView_V','View','Предствления','1',null);
Insert into MD_OBJVIEW_V (ID,IDOBJ,VIEWNAME,CODE,NAME,IDPARENT,IDVIEWCATALOG) values ('5','5','MD_ObjViewCol_V','ViewColumn','Колонки представления','4',null);
Insert into MD_OBJVIEW_V (ID,IDOBJ,VIEWNAME,CODE,NAME,IDPARENT,IDVIEWCATALOG) values ('6','6','STD_Catalog_V','Catalog','Каталог',null,null);
Insert into MD_OBJVIEW_V (ID,IDOBJ,VIEWNAME,CODE,NAME,IDPARENT,IDVIEWCATALOG) values ('7','7','MD_ObjViewAct_V','ViewAction','Действия','4',null);
REM INSERTING into STD_CATALOG_V
SET DEFINE OFF;
Insert into STD_CATALOG_V (ID,IDPARENT,CODE,NAME) values ('1',null,'object','Объекты');
Insert into STD_CATALOG_V (ID,IDPARENT,CODE,NAME) values ('2','1','common','Основные');
--------------------------------------------------------
--  DDL for Index MD_ACTIONTYPE_CODE_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_ACTIONTYPE_CODE_IDX" ON "MD_ACTIONTYPE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_COL_CODE_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_COL_CODE_IDX" ON "MD_COL" ("CODE") 
  ;
--------------------------------------------------------
--  DDL for Index MD_COL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_COL_PK" ON "MD_COL" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_DATATYPE_CODE_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_DATATYPE_CODE_IDX" ON "MD_DATATYPE" ("CODE") 
  ;
--------------------------------------------------------
--  DDL for Index MD_DATATYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_DATATYPE_PK" ON "MD_DATATYPE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_DOMAIN_CODE_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_DOMAIN_CODE_IDX" ON "MD_DOMAIN" ("CODE") 
  ;
--------------------------------------------------------
--  DDL for Index MD_DOMAIN_IDDATATYPE_IDX
--------------------------------------------------------

  CREATE INDEX "MD_DOMAIN_IDDATATYPE_IDX" ON "MD_DOMAIN" ("IDDATATYPE") 
  ;
--------------------------------------------------------
--  DDL for Index MD_DOMAIN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_DOMAIN_PK" ON "MD_DOMAIN" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_MAINMENUACT_CODE_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_MAINMENUACT_CODE_IDX" ON "MD_MAINMENUACTION" ("CODE") 
  ;
--------------------------------------------------------
--  DDL for Index MD_MAINMENUACT_IDACTTYPE_IDX
--------------------------------------------------------

  CREATE INDEX "MD_MAINMENUACT_IDACTTYPE_IDX" ON "MD_MAINMENUACTION" ("IDACTIONTYPE") 
  ;
--------------------------------------------------------
--  DDL for Index MD_MAINMENUACT_IDMM_IDX
--------------------------------------------------------

  CREATE INDEX "MD_MAINMENUACT_IDMM_IDX" ON "MD_MAINMENUACTION" ("IDMAINMENU") 
  ;
--------------------------------------------------------
--  DDL for Index MD_MAINMENUACT_IDOBJFRM_IDX
--------------------------------------------------------

  CREATE INDEX "MD_MAINMENUACT_IDOBJFRM_IDX" ON "MD_MAINMENUACTION" ("IDOBJFRM") 
  ;
--------------------------------------------------------
--  DDL for Index MD_MAINMENUACTION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_MAINMENUACTION_PK" ON "MD_MAINMENUACTION" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_MAINMENUACTIONTYPE_CODE_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_MAINMENUACTIONTYPE_CODE_IDX" ON "MD_ACTIONTYPE" ("CODE") 
  ;
--------------------------------------------------------
--  DDL for Index MD_MAINMENU_CODE_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_MAINMENU_CODE_IDX" ON "MD_MAINMENU" ("CODE") 
  ;
--------------------------------------------------------
--  DDL for Index MD_MAINMENU_IDPARENT_IDX
--------------------------------------------------------

  CREATE INDEX "MD_MAINMENU_IDPARENT_IDX" ON "MD_MAINMENU" ("IDPARENT") 
  ;
--------------------------------------------------------
--  DDL for Index MD_MAINMENU_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_MAINMENU_PK" ON "MD_MAINMENU" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_OBJCOL_IDCOL_IDX
--------------------------------------------------------

  CREATE INDEX "MD_OBJCOL_IDCOL_IDX" ON "MD_OBJCOL" ("IDCOL") 
  ;
--------------------------------------------------------
--  DDL for Index MD_OBJCOL_IDDOMAIN_IDX
--------------------------------------------------------

  CREATE INDEX "MD_OBJCOL_IDDOMAIN_IDX" ON "MD_OBJCOL" ("IDDOMAIN") 
  ;
--------------------------------------------------------
--  DDL for Index MD_OBJCOL_IDTABLE_IDX
--------------------------------------------------------

  CREATE INDEX "MD_OBJCOL_IDTABLE_IDX" ON "MD_OBJCOL" ("IDOBJ") 
  ;
--------------------------------------------------------
--  DDL for Index MD_OBJFRM_CODE_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_OBJFRM_CODE_IDX" ON "MD_OBJFRM" ("CODE") 
  ;
--------------------------------------------------------
--  DDL for Index MD_OBJFRM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_OBJFRM_PK" ON "MD_OBJFRM" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_OBJFRMVIEWCOL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_OBJFRMVIEWCOL_PK" ON "MD_OBJFRMVIEWCOL" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_OBJFRMVIEW_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_OBJFRMVIEW_PK" ON "MD_OBJFRMVIEW" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_OBJVIEWCOL_IDCOL_IDX
--------------------------------------------------------

  CREATE INDEX "MD_OBJVIEWCOL_IDCOL_IDX" ON "MD_OBJVIEWCOL" ("IDCOL") 
  ;
--------------------------------------------------------
--  DDL for Index MD_OBJVIEWCOL_IDDOMAIN_IDX
--------------------------------------------------------

  CREATE INDEX "MD_OBJVIEWCOL_IDDOMAIN_IDX" ON "MD_OBJVIEWCOL" ("IDDOMAIN") 
  ;
--------------------------------------------------------
--  DDL for Index MD_OBJVIEWCOL_IDOBJCOL_IDX
--------------------------------------------------------

  CREATE INDEX "MD_OBJVIEWCOL_IDOBJCOL_IDX" ON "MD_OBJVIEWCOL" ("IDOBJCOL") 
  ;
--------------------------------------------------------
--  DDL for Index MD_OBJVIEWCOL_IDOBJVIEW_IDX
--------------------------------------------------------

  CREATE INDEX "MD_OBJVIEWCOL_IDOBJVIEW_IDX" ON "MD_OBJVIEWCOL" ("IDOBJVIEW") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLEACT_CODE_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_TABLEACT_CODE_IDX" ON "MD_OBJACT" ("CODE") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLEACT_IDTABACTTYPE_IDX
--------------------------------------------------------

  CREATE INDEX "MD_TABLEACT_IDTABACTTYPE_IDX" ON "MD_OBJACT" ("IDACTIONTYPE") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLEACT_IDTABLE_IDX
--------------------------------------------------------

  CREATE INDEX "MD_TABLEACT_IDTABLE_IDX" ON "MD_OBJACT" ("IDOBJ") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLEACTION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_TABLEACTION_PK" ON "MD_OBJACT" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLE_CODE_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_TABLE_CODE_IDX" ON "MD_OBJ" ("CODE") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLECOLUMN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_TABLECOLUMN_PK" ON "MD_OBJCOL" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLE_IDCATALOG_IDX
--------------------------------------------------------

  CREATE INDEX "MD_TABLE_IDCATALOG_IDX" ON "MD_OBJ" ("IDCATALOG") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLE_IDPARENT_IDX
--------------------------------------------------------

  CREATE INDEX "MD_TABLE_IDPARENT_IDX" ON "MD_OBJ" ("IDPARENT") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLE_IDTABLECATALOG_IDX
--------------------------------------------------------

  CREATE INDEX "MD_TABLE_IDTABLECATALOG_IDX" ON "MD_OBJ" ("IDOBJCATALOG") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_TABLE_PK" ON "MD_OBJ" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLEVIEW_CODE_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_TABLEVIEW_CODE_IDX" ON "MD_OBJVIEW" ("CODE") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLEVIEW_IDPARENT_IDX
--------------------------------------------------------

  CREATE INDEX "MD_TABLEVIEW_IDPARENT_IDX" ON "MD_OBJVIEW" ("IDPARENT") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLEVIEW_IDTABLE_IDX
--------------------------------------------------------

  CREATE INDEX "MD_TABLEVIEW_IDTABLE_IDX" ON "MD_OBJVIEW" ("IDOBJ") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLEVIEW_IDVIEWCATALOG_IDX
--------------------------------------------------------

  CREATE INDEX "MD_TABLEVIEW_IDVIEWCATALOG_IDX" ON "MD_OBJVIEW" ("IDVIEWCATALOG") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLEVIEW_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_TABLEVIEW_PK" ON "MD_OBJVIEW" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_VCONSTRREFCOL_IDVCONSTR_IDX
--------------------------------------------------------

  CREATE INDEX "MD_VCONSTRREFCOL_IDVCONSTR_IDX" ON "MD_OBJVIEWCONCOL" ("IDOBJVIEWCON") 
  ;
--------------------------------------------------------
--  DDL for Index MD_VIEWACT_IDTABACT_IDX
--------------------------------------------------------

  CREATE INDEX "MD_VIEWACT_IDTABACT_IDX" ON "MD_OBJVIEWACT" ("IDOBJACT") 
  ;
--------------------------------------------------------
--  DDL for Index MD_VIEWACT_IDTABLEVIEW_IDX
--------------------------------------------------------

  CREATE INDEX "MD_VIEWACT_IDTABLEVIEW_IDX" ON "MD_OBJVIEWACT" ("IDOBJVIEW") 
  ;
--------------------------------------------------------
--  DDL for Index MD_VIEWACTION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_VIEWACTION_PK" ON "MD_OBJVIEWACT" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_VIEWCOLUMN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_VIEWCOLUMN_PK" ON "MD_OBJVIEWCOL" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_VIEWCONSTRAINT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_VIEWCONSTRAINT_PK" ON "MD_OBJVIEWCON" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_VIEWCONSTRAINTREFCOLUMN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_VIEWCONSTRAINTREFCOLUMN_PK" ON "MD_OBJVIEWCONCOL" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_VIEWCONSTR_IDTABLEVIEW_IDX
--------------------------------------------------------

  CREATE INDEX "MD_VIEWCONSTR_IDTABLEVIEW_IDX" ON "MD_OBJVIEWCON" ("IDOBJVIEW") 
  ;
--------------------------------------------------------
--  DDL for Index MD_VIEWCONSTR_IDVIEWCOLUMN_IDX
--------------------------------------------------------

  CREATE INDEX "MD_VIEWCONSTR_IDVIEWCOLUMN_IDX" ON "MD_OBJVIEWCON" ("IDOBJVIEWCOL") 
  ;
--------------------------------------------------------
--  DDL for Index MD_VIEWCONSTR_IDVREFCOLUMN_IDX
--------------------------------------------------------

  CREATE INDEX "MD_VIEWCONSTR_IDVREFCOLUMN_IDX" ON "MD_OBJVIEWCON" ("IDOBJVIEWREFCOL") 
  ;
--------------------------------------------------------
--  DDL for Index STD_CATALOG_CODE_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "STD_CATALOG_CODE_IDX" ON "STD_CATALOG" ("CODE") 
  ;
--------------------------------------------------------
--  DDL for Index STD_CATALOG_IDPARENT_IDX
--------------------------------------------------------

  CREATE INDEX "STD_CATALOG_IDPARENT_IDX" ON "STD_CATALOG" ("IDPARENT") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C0064448
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0064448" ON "STD_CATALOG" ("ID") 
  ;
--------------------------------------------------------
--  Constraints for Table MD_ACTIONTYPE
--------------------------------------------------------

  ALTER TABLE "MD_ACTIONTYPE" ADD CONSTRAINT "MD_ACTIONTYPE_CODE_UN" UNIQUE ("CODE") ENABLE;
  ALTER TABLE "MD_ACTIONTYPE" ADD CONSTRAINT "MD_ACTIONTYPE_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_ACTIONTYPE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_COL
--------------------------------------------------------

  ALTER TABLE "MD_COL" ADD CONSTRAINT "MD_COL_CODE_UN" UNIQUE ("CODE") ENABLE;
  ALTER TABLE "MD_COL" ADD CONSTRAINT "MD_COL_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_COL" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_DATATYPE
--------------------------------------------------------

  ALTER TABLE "MD_DATATYPE" ADD CONSTRAINT "MD_DATATYPE_CODE_UN" UNIQUE ("CODE") ENABLE;
  ALTER TABLE "MD_DATATYPE" ADD CONSTRAINT "MD_DATATYPE_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_DATATYPE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_DOMAIN
--------------------------------------------------------

  ALTER TABLE "MD_DOMAIN" ADD CONSTRAINT "MD_DOMAIN_CODE_UN" UNIQUE ("CODE") ENABLE;
  ALTER TABLE "MD_DOMAIN" ADD CONSTRAINT "MD_DOMAIN_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_DOMAIN" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_MAINMENU
--------------------------------------------------------

  ALTER TABLE "MD_MAINMENU" ADD CONSTRAINT "MD_MAINMENU_CODE_UN" UNIQUE ("CODE") ENABLE;
  ALTER TABLE "MD_MAINMENU" ADD CONSTRAINT "MD_MAINMENU_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_MAINMENU" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_MAINMENUACTION
--------------------------------------------------------

  ALTER TABLE "MD_MAINMENUACTION" ADD CONSTRAINT "MD_MAINMENUACTION_CODE_UN" UNIQUE ("CODE") ENABLE;
  ALTER TABLE "MD_MAINMENUACTION" ADD CONSTRAINT "MD_MAINMENUACTION_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_MAINMENUACTION" MODIFY ("IDMAINMENU" NOT NULL ENABLE);
  ALTER TABLE "MD_MAINMENUACTION" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_OBJ
--------------------------------------------------------

  ALTER TABLE "MD_OBJ" ADD CONSTRAINT "MD_TABLE_CODE_UN" UNIQUE ("CODE") ENABLE;
  ALTER TABLE "MD_OBJ" ADD CONSTRAINT "MD_TABLE_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_OBJ" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_OBJACT
--------------------------------------------------------

  ALTER TABLE "MD_OBJACT" ADD CONSTRAINT "MD_TABLEACTION_CODE_UN" UNIQUE ("CODE") ENABLE;
  ALTER TABLE "MD_OBJACT" ADD CONSTRAINT "MD_TABLEACTION_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_OBJACT" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MD_OBJACT" MODIFY ("IDOBJ" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_OBJCOL
--------------------------------------------------------

  ALTER TABLE "MD_OBJCOL" ADD CONSTRAINT "MD_TABLECOLUMN_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_OBJCOL" MODIFY ("IDOBJ" NOT NULL ENABLE);
  ALTER TABLE "MD_OBJCOL" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_OBJFRM
--------------------------------------------------------

  ALTER TABLE "MD_OBJFRM" ADD CONSTRAINT "MD_OBJFRM_CODE_UN" UNIQUE ("CODE") ENABLE;
  ALTER TABLE "MD_OBJFRM" ADD CONSTRAINT "MD_OBJFRM_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_OBJFRM" MODIFY ("IDOBJ" NOT NULL ENABLE);
  ALTER TABLE "MD_OBJFRM" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_OBJFRMVIEW
--------------------------------------------------------

  ALTER TABLE "MD_OBJFRMVIEW" ADD CONSTRAINT "MD_OBJFRMVIEW_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_OBJFRMVIEW" MODIFY ("IDOBJFRM" NOT NULL ENABLE);
  ALTER TABLE "MD_OBJFRMVIEW" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_OBJFRMVIEWCOL
--------------------------------------------------------

  ALTER TABLE "MD_OBJFRMVIEWCOL" ADD CONSTRAINT "MD_OBJFRMVIEWCOL_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_OBJFRMVIEWCOL" MODIFY ("IDOBJFRMVIEW" NOT NULL ENABLE);
  ALTER TABLE "MD_OBJFRMVIEWCOL" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_OBJVIEW
--------------------------------------------------------

  ALTER TABLE "MD_OBJVIEW" ADD CONSTRAINT "MD_TABLEVIEW_CODE_UN" UNIQUE ("CODE") ENABLE;
  ALTER TABLE "MD_OBJVIEW" ADD CONSTRAINT "MD_TABLEVIEW_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_OBJVIEW" MODIFY ("IDOBJ" NOT NULL ENABLE);
  ALTER TABLE "MD_OBJVIEW" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_OBJVIEWACT
--------------------------------------------------------

  ALTER TABLE "MD_OBJVIEWACT" ADD CONSTRAINT "MD_VIEWACTION_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_OBJVIEWACT" MODIFY ("IDOBJVIEW" NOT NULL ENABLE);
  ALTER TABLE "MD_OBJVIEWACT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_OBJVIEWCOL
--------------------------------------------------------

  ALTER TABLE "MD_OBJVIEWCOL" ADD CONSTRAINT "MD_VIEWCOLUMN_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_OBJVIEWCOL" MODIFY ("IDOBJVIEW" NOT NULL ENABLE);
  ALTER TABLE "MD_OBJVIEWCOL" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_OBJVIEWCON
--------------------------------------------------------

  ALTER TABLE "MD_OBJVIEWCON" ADD CONSTRAINT "MD_VIEWCONSTRAINT_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_OBJVIEWCON" MODIFY ("IDOBJVIEW" NOT NULL ENABLE);
  ALTER TABLE "MD_OBJVIEWCON" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_OBJVIEWCONCOL
--------------------------------------------------------

  ALTER TABLE "MD_OBJVIEWCONCOL" ADD CONSTRAINT "MD_VIEWCONSTRAINTREFCOLUMN_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "MD_OBJVIEWCONCOL" MODIFY ("IDOBJVIEWCON" NOT NULL ENABLE);
  ALTER TABLE "MD_OBJVIEWCONCOL" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STD_CATALOG
--------------------------------------------------------

  ALTER TABLE "STD_CATALOG" ADD CONSTRAINT "STD_CATALOG_CODE_UN" UNIQUE ("CODE") ENABLE;
  ALTER TABLE "STD_CATALOG" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STD_CATALOG" ADD CONSTRAINT "STD_CATALOG_ID_UN" UNIQUE ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_DOMAIN
--------------------------------------------------------

  ALTER TABLE "MD_DOMAIN" ADD CONSTRAINT "MD_DOMAIN_MD_DATATYPE_FK" FOREIGN KEY ("IDDATATYPE")
	  REFERENCES "MD_DATATYPE" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_MAINMENU
--------------------------------------------------------

  ALTER TABLE "MD_MAINMENU" ADD CONSTRAINT "MD_MAINMENU_MD_MAINMENU_FK" FOREIGN KEY ("IDPARENT")
	  REFERENCES "MD_MAINMENU" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_MAINMENUACTION
--------------------------------------------------------

  ALTER TABLE "MD_MAINMENUACTION" ADD CONSTRAINT "MD_MAINMENUACTION_MD_OBJFRM_FK" FOREIGN KEY ("IDOBJFRM")
	  REFERENCES "MD_OBJFRM" ("ID") ENABLE;
  ALTER TABLE "MD_MAINMENUACTION" ADD CONSTRAINT "MD_MAINMENUACT_MD_MMACTTYPE_FK" FOREIGN KEY ("IDACTIONTYPE")
	  REFERENCES "MD_ACTIONTYPE" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_MAINMENUACTION" ADD CONSTRAINT "MD_MAINMENUACT_MD_MM_FK" FOREIGN KEY ("IDMAINMENU")
	  REFERENCES "MD_MAINMENU" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_MAINMENUACTION" ADD CONSTRAINT "MD_MAINMENUACT_MD_OBJVIEW_FK" FOREIGN KEY ("IDOBJFRM")
	  REFERENCES "MD_OBJVIEW" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_OBJ
--------------------------------------------------------

  ALTER TABLE "MD_OBJ" ADD CONSTRAINT "MD_TABLE_MD_TABLE_FK" FOREIGN KEY ("IDPARENT")
	  REFERENCES "MD_OBJ" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_OBJ" ADD CONSTRAINT "MD_TABLE_MD_TABLE_FKV2" FOREIGN KEY ("IDOBJCATALOG")
	  REFERENCES "MD_OBJ" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_OBJ" ADD CONSTRAINT "MD_TABLE_STD_CATALOG_FK" FOREIGN KEY ("IDCATALOG")
	  REFERENCES "STD_CATALOG" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_OBJACT
--------------------------------------------------------

  ALTER TABLE "MD_OBJACT" ADD CONSTRAINT "MD_TABLEACTION_MD_TABLE_FK" FOREIGN KEY ("IDOBJ")
	  REFERENCES "MD_OBJ" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_OBJACT" ADD CONSTRAINT "MD_TABLEACT_MD_ACTIONTYPE_FK" FOREIGN KEY ("IDACTIONTYPE")
	  REFERENCES "MD_ACTIONTYPE" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_OBJCOL
--------------------------------------------------------

  ALTER TABLE "MD_OBJCOL" ADD CONSTRAINT "MD_OBJCOL_MD_COL_FK" FOREIGN KEY ("IDCOL")
	  REFERENCES "MD_COL" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_OBJCOL" ADD CONSTRAINT "MD_TABLECOLUMN_MD_DOMAIN_FK" FOREIGN KEY ("IDDOMAIN")
	  REFERENCES "MD_DOMAIN" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_OBJCOL" ADD CONSTRAINT "MD_TABLECOLUMN_MD_TABLE_FK" FOREIGN KEY ("IDOBJ")
	  REFERENCES "MD_OBJ" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_OBJFRM
--------------------------------------------------------

  ALTER TABLE "MD_OBJFRM" ADD CONSTRAINT "MD_OBJFRM_MD_OBJVIEW_FK" FOREIGN KEY ("IDOBJVIEW")
	  REFERENCES "MD_OBJVIEW" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_OBJFRM" ADD CONSTRAINT "MD_OBJFRM_MD_OBJ_FK" FOREIGN KEY ("IDOBJ")
	  REFERENCES "MD_OBJ" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_OBJFRMVIEW
--------------------------------------------------------

  ALTER TABLE "MD_OBJFRMVIEW" ADD CONSTRAINT "MD_OBJFRMVIEW_MD_OBJFRM_FK" FOREIGN KEY ("IDOBJFRM")
	  REFERENCES "MD_OBJFRM" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_OBJFRMVIEW" ADD CONSTRAINT "MD_OBJFRMVIEW_MD_OBJVIEW_FK" FOREIGN KEY ("IDOBJVIEW")
	  REFERENCES "MD_OBJVIEW" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_OBJFRMVIEW" ADD CONSTRAINT "MD_OBJFRMVIEW_SELF_FK" FOREIGN KEY ("IDPARENT")
	  REFERENCES "MD_OBJFRMVIEW" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_OBJFRMVIEWCOL
--------------------------------------------------------

  ALTER TABLE "MD_OBJFRMVIEWCOL" ADD CONSTRAINT "MD_OBJFRMVIEWCOL_OBJFRMVIEW_FK" FOREIGN KEY ("IDOBJFRMVIEW")
	  REFERENCES "MD_OBJFRMVIEW" ("ID") ENABLE;
  ALTER TABLE "MD_OBJFRMVIEWCOL" ADD CONSTRAINT "MD_OBJFRMVIEWCOL_OBJVIEWCOL_FK" FOREIGN KEY ("IDOBJVIEWCOL")
	  REFERENCES "MD_OBJVIEWCOL" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_OBJVIEW
--------------------------------------------------------

  ALTER TABLE "MD_OBJVIEW" ADD CONSTRAINT "MD_TABLEVIEW_MD_TABLEVIEW_FK" FOREIGN KEY ("IDPARENT")
	  REFERENCES "MD_OBJVIEW" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_OBJVIEW" ADD CONSTRAINT "MD_TABLEVIEW_MD_TABLEVIEW_FKV2" FOREIGN KEY ("IDVIEWCATALOG")
	  REFERENCES "MD_OBJVIEW" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_OBJVIEW" ADD CONSTRAINT "MD_TABLEVIEW_MD_TABLE_FK" FOREIGN KEY ("IDOBJ")
	  REFERENCES "MD_OBJ" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_OBJVIEWACT
--------------------------------------------------------

  ALTER TABLE "MD_OBJVIEWACT" ADD CONSTRAINT "MD_VIEWACTION_MD_TABACT_FK" FOREIGN KEY ("IDOBJACT")
	  REFERENCES "MD_OBJACT" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_OBJVIEWACT" ADD CONSTRAINT "MD_VIEWACTION_MD_TABLEVIEW_FK" FOREIGN KEY ("IDOBJVIEW")
	  REFERENCES "MD_OBJVIEW" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_OBJVIEWCOL
--------------------------------------------------------

  ALTER TABLE "MD_OBJVIEWCOL" ADD CONSTRAINT "MD_OBJVIEWCOL_MD_COL_FK" FOREIGN KEY ("IDCOL")
	  REFERENCES "MD_COL" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_OBJVIEWCOL" ADD CONSTRAINT "MD_OBJVIEWCOL_MD_OBJCOL_FK" FOREIGN KEY ("IDOBJCOL")
	  REFERENCES "MD_OBJCOL" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_OBJVIEWCOL" ADD CONSTRAINT "MD_VIEWCOLUMN_MD_DOMAIN_FK" FOREIGN KEY ("IDDOMAIN")
	  REFERENCES "MD_DOMAIN" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_OBJVIEWCOL" ADD CONSTRAINT "MD_VIEWCOLUMN_MD_TABLEVIEW_FK" FOREIGN KEY ("IDOBJVIEW")
	  REFERENCES "MD_OBJVIEW" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_OBJVIEWCON
--------------------------------------------------------

  ALTER TABLE "MD_OBJVIEWCON" ADD CONSTRAINT "MD_VIEWCONSTR_MD_TABVIEW_FK" FOREIGN KEY ("IDOBJVIEW")
	  REFERENCES "MD_OBJVIEW" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_OBJVIEWCONCOL
--------------------------------------------------------

  ALTER TABLE "MD_OBJVIEWCONCOL" ADD CONSTRAINT "MD_VCONSTRREFCOL_MD_VCOL_FK" FOREIGN KEY ("IDCOLUMN")
	  REFERENCES "MD_OBJVIEWCOL" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "MD_OBJVIEWCONCOL" ADD CONSTRAINT "MD_VCONSTRREFCOL_MD_VCONSTR_FK" FOREIGN KEY ("IDOBJVIEWCON")
	  REFERENCES "MD_OBJVIEWCON" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STD_CATALOG
--------------------------------------------------------

  ALTER TABLE "STD_CATALOG" ADD CONSTRAINT "STD_CATALOG_STD_CATALOG_FK" FOREIGN KEY ("IDPARENT")
	  REFERENCES "STD_CATALOG" ("ID") ON DELETE CASCADE ENABLE;
