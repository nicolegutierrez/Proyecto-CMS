CREATE TABLE  "CMS_USUARIOS" 
   (	"COD_USUARIO" NUMBER(10,0) NOT NULL ENABLE, 
	"NOM_USUARIO" VARCHAR2(200) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"CLAVE" VARCHAR2(200) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(300) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"CORREO" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"EXTENSION" NUMBER(3,0), 
	"ESTADO" VARCHAR2(2) COLLATE "USING_NLS_COMP", 
	"COD_DEPARTAMENTO" NUMBER(10,0) NOT NULL ENABLE, 
	"COD_TIPO_USUARIO" NUMBER(10,0) NOT NULL ENABLE, 
	 CONSTRAINT "CMS_USUARIOS_PK" PRIMARY KEY ("COD_USUARIO")
  USING INDEX  ENABLE, 
	 CONSTRAINT "NOM_USUARIOS_UK1" UNIQUE ("NOM_USUARIO")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
ALTER TABLE  "CMS_USUARIOS" ADD CONSTRAINT "COD_DEPTO_FK" FOREIGN KEY ("COD_DEPARTAMENTO")
	  REFERENCES  "CMS_DEPARTAMENTOS" ("COD_DEPARTAMENTO") ENABLE
/
ALTER TABLE  "CMS_USUARIOS" ADD CONSTRAINT "COD_TIPO_USUARIO_FK" FOREIGN KEY ("COD_TIPO_USUARIO")
	  REFERENCES  "TIPOS_USUARIOS" ("COD_TIPO_USUARIO") ENABLE
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "BI_CMS_USUARIOS" 
  before insert on "CMS_USUARIOS"               
  for each row  
begin   
  if :NEW."COD_USUARIO" is null then 
    select "CMS_USUARIOS_SEQ1".nextval into :NEW."COD_USUARIO" from sys.dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_CMS_USUARIOS" ENABLE
/


CREATE TABLE  "TIPOS_USUARIOS" 
   (	"COD_TIPO_USUARIO" NUMBER(10,0) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(200) COLLATE "USING_NLS_COMP", 
	 CONSTRAINT "TIPOS_USUARIOS_PK" PRIMARY KEY ("COD_TIPO_USUARIO")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "BI_TIPOS_USUARIOS" 
  before insert on "TIPOS_USUARIOS"               
  for each row  
begin   
  if :NEW."COD_TIPO_USUARIO" is null then 
    select "TIPOS_USUARIOS_SEQ".nextval into :NEW."COD_TIPO_USUARIO" from sys.dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_TIPOS_USUARIOS" ENABLE
/


CREATE TABLE  "CMS_DEPARTAMENTOS" 
   (	"COD_DEPARTAMENTO" NUMBER(10,0) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(300) COLLATE "USING_NLS_COMP", 
	 CONSTRAINT "CMS_DEPARTAMENTOS_PK" PRIMARY KEY ("COD_DEPARTAMENTO")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "BI_CMS_DEPARTAMENTOS" 
  before insert on "CMS_DEPARTAMENTOS"               
  for each row  
begin   
  if :NEW."COD_DEPARTAMENTO" is null then 
    select "CMS_DEPARTAMENTOS_SEQ".nextval into :NEW."COD_DEPARTAMENTO" from sys.dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_CMS_DEPARTAMENTOS" ENABLE
/


CREATE TABLE  "CMS_CLAS_SERVICIOS" 
   (	"COD_CLAS_SERVICIO" NUMBER(10,0) NOT NULL ENABLE, 
	"CATEGORIA" VARCHAR2(200) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(1000) COLLATE "USING_NLS_COMP", 
	 CONSTRAINT "CMS_CLAS_SERVICIOS_PK" PRIMARY KEY ("COD_CLAS_SERVICIO")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "BI_CMS_CLAS_SERVICIOS" 
  before insert ON CMS_CLAS_SERVICIOS               
  for each row
begin   
  if :NEW.COD_CLAS_SERVICIO is null then 
    select COD_CLAS_SERVICIO_SEQ.nextval into :NEW.COD_CLAS_SERVICIO from dual; 
  end if; 
end;

/
ALTER TRIGGER  "BI_CMS_CLAS_SERVICIOS" ENABLE
/

CREATE TABLE  "CMS_SERVICIOS" 
   (	"COD_SERVICIO" NUMBER(10,0) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(200) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"COD_CLAS_SERVICIO" NUMBER(10,0) NOT NULL ENABLE, 
	"ESTADO" VARCHAR2(20) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	 CONSTRAINT "CMS_SERVICIOS_PK" PRIMARY KEY ("COD_SERVICIO")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "BI_CMS_SERVICIOS" 
  before insert ON CMS_SERVICIOS               
  for each row
begin   
  if :NEW.COD_SERVICIO is null then 
    select COD_SERVICIO_SEQ.nextval into :NEW.COD_SERVICIO from dual; 
  end if; 
end;

/
ALTER TRIGGER  "BI_CMS_SERVICIOS" ENABLE
/

CREATE TABLE  "CMS_TIPO_GESTION" 
   (	"COD_TIPO_GESTION" NUMBER(10,0) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(200) COLLATE "USING_NLS_COMP", 
	 CONSTRAINT "CMS_TIPO_GESTION_PK" PRIMARY KEY ("COD_TIPO_GESTION")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "BI_CMS_TIPO_GESTION" 
  before insert on "CMS_TIPO_GESTION"               
  for each row  
begin   
  if :NEW."COD_TIPO_GESTION" is null then 
    select "CMS_TIPO_GESTION_SEQ".nextval into :NEW."COD_TIPO_GESTION" from sys.dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_CMS_TIPO_GESTION" ENABLE
/

CREATE TABLE  "CMS_ESTADOS" 
   (	"COD_ESTADO" NUMBER(10,0) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(200) COLLATE "USING_NLS_COMP", 
	 CONSTRAINT "CMS_ESTADOS_PK" PRIMARY KEY ("COD_ESTADO")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "BI_CMS_ESTADOS" 
  before insert on "CMS_ESTADOS"               
  for each row  
begin   
  if :NEW."COD_ESTADO" is null then 
    select "CMS_ESTADOS_SEQ".nextval into :NEW."COD_ESTADO" from sys.dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_CMS_ESTADOS" ENABLE
/

CREATE TABLE  "CMS_UBICACIONES" 
   (	"COD_UBICACION" NUMBER(10,0) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(300) COLLATE "USING_NLS_COMP", 
	 CONSTRAINT "CMS_UBICACIONES_PK" PRIMARY KEY ("COD_UBICACION")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "BI_CMS_UBICACIONES" 
  before insert on "CMS_UBICACIONES"               
  for each row  
begin   
  if :NEW."COD_UBICACION" is null then 
    select "CMS_UBICACIONES_SEQ".nextval into :NEW."COD_UBICACION" from sys.dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_CMS_UBICACIONES" ENABLE
/

CREATE TABLE  "CMS_PRIORIDADES" 
   (	"COD_PRIORIDAD" NUMBER(10,0) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(100) COLLATE "USING_NLS_COMP", 
	 CONSTRAINT "CMS_PRIORIDADES_PK" PRIMARY KEY ("COD_PRIORIDAD")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "BI_CMS_PRIORIDADES" 
  before insert on "CMS_PRIORIDADES"               
  for each row  
begin   
  if :NEW."COD_PRIORIDAD" is null then 
    select "CMS_PRIORIDADES_SEQ".nextval into :NEW."COD_PRIORIDAD" from sys.dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_CMS_PRIORIDADES" ENABLE
/

CREATE TABLE  "CMS_DETA_TICKETS" 
   (	"COD_TICKET" NUMBER(10,0) NOT NULL ENABLE, 
	"COD_TIPO_GESTION" NUMBER(10,0) NOT NULL ENABLE, 
	"COD_ESTADO" NUMBER(10,0), 
	"COD_PRIORIDAD" NUMBER(10,0), 
	"COD_USUARIO_SOLICITA" VARCHAR2(100) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"COD_USUARIO_GESTOR" NUMBER(10,0), 
	"COD_USUARIO_MODIFICA" VARCHAR2(100) COLLATE "USING_NLS_COMP", 
	"TITULO" VARCHAR2(300) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(1500) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"COD_UBICACION" NUMBER(10,0), 
	"COD_DEPTO" NUMBER(10,0), 
	"COD_SERVICIO" NUMBER(10,0), 
	"ADJUNTO" BLOB, 
	"MINETYPE" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"SOLUCION" VARCHAR2(1500) COLLATE "USING_NLS_COMP", 
	"FEC_CREACION" DATE, 
	"NOM_ARCHIVO" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	 CONSTRAINT "CMS_DETA_TICKETS_PK" PRIMARY KEY ("COD_TICKET")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
ALTER TABLE  "CMS_DETA_TICKETS" ADD CONSTRAINT "TIPO_GESTION_FK" FOREIGN KEY ("COD_TIPO_GESTION")
	  REFERENCES  "CMS_TIPO_GESTION" ("COD_TIPO_GESTION") ENABLE
/
ALTER TABLE  "CMS_DETA_TICKETS" ADD CONSTRAINT "ESTADO_FK" FOREIGN KEY ("COD_ESTADO")
	  REFERENCES  "CMS_ESTADOS" ("COD_ESTADO") ENABLE
/
ALTER TABLE  "CMS_DETA_TICKETS" ADD CONSTRAINT "PRIORIDAD_FK" FOREIGN KEY ("COD_PRIORIDAD")
	  REFERENCES  "CMS_PRIORIDADES" ("COD_PRIORIDAD") ENABLE
/
ALTER TABLE  "CMS_DETA_TICKETS" ADD CONSTRAINT "UBICACION_FK" FOREIGN KEY ("COD_UBICACION")
	  REFERENCES  "CMS_UBICACIONES" ("COD_UBICACION") ENABLE
/
ALTER TABLE  "CMS_DETA_TICKETS" ADD CONSTRAINT "DEPARTAMENTO_FK" FOREIGN KEY ("COD_DEPTO")
	  REFERENCES  "CMS_DEPARTAMENTOS" ("COD_DEPARTAMENTO") ENABLE
/
ALTER TABLE  "CMS_DETA_TICKETS" ADD CONSTRAINT "SERVICIO_FK" FOREIGN KEY ("COD_SERVICIO")
	  REFERENCES  "CMS_DETALLE_SERVICIOS" ("COD_DETALLE_SERVICIO") ENABLE
/
ALTER TABLE  "CMS_DETA_TICKETS" ADD CONSTRAINT "USUARIO_GESTOR_FK" FOREIGN KEY ("COD_USUARIO_GESTOR")
	  REFERENCES  "CMS_USUARIOS" ("COD_USUARIO") ENABLE
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "BI_CMS_DETA_TICKETS" 
  before insert on "CMS_DETA_TICKETS"               
  for each row  
begin   
  if :NEW."COD_TICKET" is null then 
    select "CMS_DETA_TICKETS_SEQ".nextval into :NEW."COD_TICKET" from sys.dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_CMS_DETA_TICKETS" ENABLE
/