DROP SCHEMA if exists isosceles;

CREATE DATABASE  if NOT exists isosceles;
USE isosceles;

CREATE TABLE if NOT exists isosceles.tipo_id (
		id_tipo INT NOT NULL AUTO_INCREMENT,
		tipo_id	VARCHAR (30) NOT NULL,
        PRIMARY KEY (id_tipo)
);

CREATE TABLE if NOT exists isosceles.pais (
		id_pais	INT NOT NULL AUTO_INCREMENT,
		pais 	VARCHAR (40) NOT NULL DEFAULT 'Sin Datos',
        PRIMARY KEY(id_pais)
);
	
    CREATE TABLE if NOT exists isosceles.region (
		id_region	INT NOT NULL AUTO_INCREMENT,
        id_pais INT NOT NULL,
		region	VARCHAR(30) NOT NULL DEFAULT 'Sin Datos',
        PRIMARY KEY (id_region)
);

CREATE TABLE if NOT exists isosceles.rubro(
		id_rubro  INT NOT NULL AUTO_INCREMENT,
        rubro  VARCHAR (50) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_rubro)
);

CREATE TABLE if NOT exists isosceles.tipo_cuenta(
		id_tipo_cuenta INT NOT NULL AUTO_INCREMENT,
        nomb_cuenta VARCHAR (50) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_tipo_cuenta)
);

CREATE TABLE if not exists isosceles.marca(
		id_marca INT NOT NULL AUTO_INCREMENT,
		nonb_marca	VARCHAR (50),
		PRIMARY KEY (id_marca)
);

CREATE TABLE if NOT exists isosceles.entidad_emisora(
		id_entidad INT NOT NULL AUTO_INCREMENT,
        nomb_entidad VARCHAR (50) NOT NULL DEFAULT 'Sin Datos',
        PRIMARY KEY (id_entidad)
);

	CREATE TABLE if NOT exists isosceles.tarjeta(
		id_tarjeta INT NOT NULL AUTO_INCREMENT,
        nomb_tarjeta VARCHAR (50) NOT NULL DEFAULT 'Sin DatosS',
        PRIMARY KEY (id_tarjeta)
);

	CREATE TABLE if NOT exists isosceles.tipo_tarjeta(
		id_tipo_tarjeta INT NOT NULL AUTO_INCREMENT,
        tipo_tarjeta VARCHAR (50) NOT NULL DEFAULT 'Sin Datos',
        PRIMARY KEY (id_tipo_tarjeta)
);
CREATE TABLE isosceles.producto(
		id_producto INT NOT NULL AUTO_INCREMENT,
        -- id_rubro 	INT,
        -- id_subrubro  INT,
        nomb_producto 	VARCHAR (50),
        -- cantidad INT,
        -- precio DECIMAL (9,2),
		PRIMARY KEY (id_producto)
);

-- CREATE TABLE if NOT exists isosceles.pro_descrip (
		-- id_descrprop INT NOT NULL AUTO_INCREMENT,
        -- id_producto  INT NOT NULL,
        -- descprod VARCHAR  (200) DEFAULT 'Sin Descrpcion ',
        -- PRIMARY KEY (id_descrprop)
-- );

CREATE TABLE if NOT exists isosceles.usuario (
		id_usuario	INT NOT NULL AUTO_INCREMENT,
		-- id_personal		INT,
		id_tusuario		INT,
       -- id_domi	INT,
       --  id_contacto	INT,
       --  id_e_contacto  	int,
        usuario		VARCHAR  (50) NOT NULL,
        contrasena	VARCHAR(35) NOT NULL,
		nombre		VARCHAR(30) DEFAULT 'Sin Datos',
		apellido	VARCHAR(40) DEFAULT 'Sin Datos',
        fecha_nac	DATE,
        PRIMARY KEY (id_usuario)
);

CREATE TABLE if NOT exists isosceles.info_personal (
		id_personal INT NOT NULL AUTO_INCREMENT,
        id_tipo INT NOT NULL,
        id_usuario	INT NOT NULL,
		num_personal	VARCHAR(30) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_personal)
);

 CREATE TABLE if NOT exists isosceles.domicilios (
		id_domi  INT NOT NULL AUTO_INCREMENT,
        id_usuario	INT NOT NULL,
        id_pais  INT NOT  NULL,
        id_region	INT NOT NULL,
        domicilio	VARCHAR(50) NOT NULL DEFAULT 'Sin Datos',
        codigo_post  VARCHAR (35),
        PRIMARY KEY (id_domi)
);

 CREATE TABLE if NOT exists isosceles.tipo_usuario (
		id_tusuario INT NOT NULL AUTO_INCREMENT,
        categoria  VARCHAR (150) NOT NULL,
        PRIMARY KEY (id_tusuario)
);

-- CREATE TABLE if NOT exists isosceles.deposito(
		-- id_deposito INT NOT NULL AUTO_INCREMENT,
        -- id_producto INT NOT NULL,
        -- id_domi INT NOT NULL,
        -- stock INT NOT NULL,
        -- PRIMARY KEY (id_deposito)
-- );
 
CREATE TABLE if NOT exists isosceles.info_finan_usuario(
		id_finan INT NOT NULL AUTO_INCREMENT,
        id_usuario INT NOT NULL,
        id_entidad INT NOT NULL,
        id_tipo_cuenta INT NOT NULL,
        num_cuenta VARCHAR (30) DEFAULT 'Sin Datos',
        alias VARCHAR (50) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_finan)
);

	CREATE TABLE if NOT exists isosceles.info_finan_tarjetas_usuario(
		id_info_tarjeta INT NOT NULL AUTO_INCREMENT,
        id_usuario INT NOT NULL,
        id_entidad INT NOT NULL,
        id_tipo_tarjeta INT NOT NULL,
        id_tarjeta INT NOT NULL,
        num_tarjeta VARCHAR (25) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_info_tarjeta)
);
	
   -- CREATE TABLE if NOT exists isosceles.finan_unificada_usuario(
		-- id_inf_glob_usuario INT NOT NULL AUTO_INCREMENT,
        -- id_usuario INT NOT NULL,
        -- id_finan INT NOT NULL,
        -- id_info_tarjeta INT NOT NULL,
        -- PRIMARY KEY (id_inf_glob_usuario)
-- );

 -- CREATE TABLE if NOT exists isosceles.transaccion(
		-- id_trans INT NOT NULL AUTO_INCREMENT,
        -- id_usuario INT NOT NULL,
        -- id_producto INT NOT NULL,
        -- fecha DATEtime NOT NULL,
        -- cantidad  INT NOT NULL,
        -- monto decimal (9,2) DEFAULT 00.00,
        -- PRIMARY KEY (id_trans)
-- );

 CREATE TABLE if NOT exists isosceles.contacto_tel(
		id_contacto INT NOT NULL AUTO_INCREMENT,
        id_usuario	INT,
        num_tel VARCHAR(30) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_contacto)
);

CREATE TABLE if NOT exists isosceles.email_contacto(
		id_e_contacto INT NOT NULL AUTO_INCREMENT,
        id_usuario	INT,
        email VARCHAR (50) DEFAULT 'Noinformado@.ggggg',
        PRIMARY KEY (id_e_contacto)
);

-- CREAR TABLA NUEVA CATEGORIA

CREATE TABLE if NOT exists categoria(
		id_categoria INT NOT NULL AUTO_INCREMENT,
        -- id_rubro INT NOT NULL,
        categoria VARCHAR (100) DEFAULT 'Sin Sub-rubro',
        PRIMARY KEY (id_categoria)
);
        
 CREATE TABLE if not exists isosceles.ingreso_pro(
		id_ingreso INT NOT NULL AUTO_INCREMENT,
		id_usuario INT NOT NULL,
		id_rubro INT NOT NULL,
        id_categoria INT NOT NULL,
        acreditacion INT NOT NULL,
        id_marca INT NOT NULL,
        id_producto  INT NOT NULL,
		unidades INT,
		sku INT,
		precio DECIMAL (9,2),
		descripcion VARCHAR (200),
		PRIMARY KEY (id_ingreso)
);

CREATE TABLE if not exists isosceles.egreso_pro(
		id_engreso INT NOT NULL AUTO_INCREMENT,
		id_usuario INT NOT NULL,
		id_rubro INT NOT NULL,
        id_categoria INT NOT NULL,
        id_marca 	INT NOT NULL,
        id_producto INT NOT NULL,
        fpago	INT NOT NULL,
        envio 	int not null,
        unidades INT,
		PRIMARY KEY (id_engreso)
);

						-- DECLARACION DE LAS FK DE TODAS LAS TABLAS

ALTER TABLE isosceles.usuario
	-- ADD CONSTRAINT `fk_personal` FOREIGN KEY (id_personal) REFERENCES info_personal (id_personal),
	ADD CONSTRAINT `fk_tipousuario` FOREIGN KEY (id_tusuario) REFERENCES tipo_usuario (id_tusuario);
	-- ADD CONSTRAINT `fk_domi` FOREIGN KEY (id_domi) REFERENCES domicilios (id_domi),
	-- ADD CONSTRAINT `fk_e_contacto` FOREIGN KEY (id_e_contacto) REFERENCES email_contacto (id_e_contacto),
	-- ADD CONSTRAINT `fk_contacto` FOREIGN KEY (id_contacto) REFERENCES contacto_tel (id_contacto);
    
ALTER TABLE isosceles.region
	ADD CONSTRAINT `fk_regpais` FOREIGN KEY (id_pais) REFERENCES pais (id_pais);
 
-- ALTER TABLE isosceles.pro_descrip 
   -- ADD CONSTRAINT `fk_producto` FOREIGN KEY (id_producto) REFERENCES producto (id_producto);
    
ALTER TABLE isosceles.info_personal    
    ADD CONSTRAINT `fk_tipo` FOREIGN KEY (id_tipo) REFERENCES tipo_id (id_tipo),
	ADD CONSTRAINT `fk_usuariotipo` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);

-- ALTER TABLE isosceles.domicilios
	-- ADD CONSTRAINT `fk_domiusuarios` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	-- ADD CONSTRAINT `fk_pais` FOREIGN KEY (id_pais) REFERENCES pais (id_pais),
	-- ADD CONSTRAINT `fk_region`  FOREIGN KEY (id_region) REFERENCES region (id_region);
    
ALTER TABLE isosceles.domicilios
	ADD CONSTRAINT `fk_domiusua` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	ADD  CONSTRAINT `fk_dompais` FOREIGN KEY (id_pais) REFERENCES pais (id_pais),
	ADD CONSTRAINT `fk_domiregion` FOREIGN KEY (id_region) REFERENCES region (id_region);
    
-- ALTER TABLE isosceles.deposito
	 -- ADD CONSTRAINT `fk_proendepo` FOREIGN KEY (id_producto) REFERENCES producto (id_producto),
	 -- ADD CONSTRAINT `fk_domidepo` FOREIGN KEY (id_domi) REFERENCES domicilios (id_domi);
     
ALTER TABLE isosceles.info_finan_usuario
     ADD CONSTRAINT `fk_finausuario` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	 ADD CONSTRAINT `fk_finanemisor` FOREIGN KEY (id_entidad) REFERENCES entidad_emisora (id_entidad),
	 ADD CONSTRAINT `fk_finantipo` FOREIGN KEY (id_tipo_cuenta) REFERENCES tipo_cuenta (id_tipo_cuenta);
     
ALTER TABLE isosceles.info_finan_tarjetas_usuario
     ADD CONSTRAINT `fk_tarjeusua` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	 ADD CONSTRAINT `fk_tarjemi` FOREIGN KEY (id_entidad) REFERENCES entidad_emisora (id_entidad),
	 ADD CONSTRAINT `fk_tarjetipo` FOREIGN KEY (id_tipo_tarjeta) REFERENCES tipo_tarjeta (id_tipo_tarjeta),
	 ADD CONSTRAINT `fk_tarjeta` FOREIGN KEY (id_tarjeta) REFERENCES tarjeta (id_tarjeta);
    
-- ALTER TABLE isosceles.finan_unificada_usuario    
	-- ADD CONSTRAINT `fk_unifinance` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	-- ADD CONSTRAINT `fk_finan`  FOREIGN KEY (id_finan) REFERENCES info_finan_usuario (id_finan),
    -- ADD CONSTRAINT `fk_inftarjeta` FOREIGN KEY (id_info_tarjeta) REFERENCES info_finan_tarjetas_usuario (id_info_tarjeta);    
    
-- ALTER TABLE isosceles.transaccion
	-- ADD CONSTRAINT `fk_usuatransac` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    -- ADD CONSTRAINT `fk_productransac` FOREIGN KEY (id_producto) REFERENCES producto (id_producto);
    
 -- ALTER TABLE nomb_producto 
	-- ADD CONSTRAINT `fk_marca` FOREIGN KEY (id_marca) REFERENCES marca (id_marca);  

ALTER TABLE isosceles.ingreso_pro 
	ADD CONSTRAINT `fk_ingrusuario` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    ADD CONSTRAINT `fk_ingrubro`  FOREIGN KEY (id_rubro) REFERENCES rubro (id_rubro),
    ADD CONSTRAINT  `fk_ingcategoria` FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
	ADD CONSTRAINT `fk_ing_acredi` FOREIGN KEY (acreditacion) REFERENCES info_finan_usuario (id_finan),
    ADD CONSTRAINT `fk_ingmarca`  FOREIGN KEY (id_marca) REFERENCES marca (id_marca),	
    ADD CONSTRAINT `fk_ingproduc` FOREIGN KEY (id_producto) REFERENCES producto (id_producto);
	
    
ALTER TABLE isosceles.egreso_pro
	ADD CONSTRAINT `fk_usuario_egreso` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    ADD CONSTRAINT `fk_rubro_egreso` FOREIGN KEY  (id_rubro) REFERENCES rubro (id_rubro),
    ADD CONSTRAINT `fk_categoria_egreso` FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
    ADD CONSTRAINT `fk_marca_egreso` FOREIGN KEY (id_marca) REFERENCES marca (id_marca),
    ADD CONSTRAINT `fk_prod_egreso`  FOREIGN KEY (id_producto) REFERENCES producto (id_producto),
    ADD CONSTRAINT `fk_fpago_egreso` FOREIGN KEY (fpago) REFERENCES info_finan_tarjetas_usuario (id_info_tarjeta),
    ADD CONSTRAINT `fk_envio_egreso` FOREIGN KEY (envio) REFERENCES  domicilios (id_domi);
    
						-- MODIFICACIONES 
		-- PARA AUMENTAR LA CANTIDAD DE CARACTERES DE LA COLUMNA REGION 
	SET FOREIGN_KEY_CHECKS = 0;
	USE isosceles;
	ALTER TABLE region
	MODIFY COLUMN region VARCHAR (100); 
	SET FOREIGN_KEY_CHECKS = 1;
    
    
    	-- PARA AUMENTAR LA CANTIDAD DE CARACTERES DE LA COLUMNA TIPO_ID
    ALTER TABLE isosceles.tipo_id
    MODIFY COLUMN tipo_id  VARCHAR (50);
    
    -- CAMBIAR EL NOMBRE DE LA TABLA TIPO_PRO Y DE SUS COLUMNAS
-- USE isosceles;
-- RENAME TABLE tipo_pro TO rubro;
-- ALTER TABLE rubro RENAME COLUMN id_tipo TO id_rubro; 
-- ALTER TABLE rubro RENAME COLUMN nomb_cuenta TO rubro;



-- ALTER TABLE isosceles.sub_rubro 
	-- ADD CONSTRAINT `fk_idrubro` FOREIGN KEY (id_rubro) REFERENCES rubro (id_rubro);

-- ALTER TABLE isosceles.producto
	-- ADD CONSTRAINT `fk_rubro`  FOREIGN KEY (id_rubro) REFERENCES rubro (id_rubro),
	-- ADD CONSTRAINT `fk_subrubro` FOREIGN KEY (id_subrubro) REFERENCES sub_rubro (id_subrubro);
    
-- ALTER TABLE isosceles.pro_descrip RENAME COLUMN id_producto TO id_subrubro;

-- ALTER TABLE isosceles.sub_rubro
	-- ADD CONSTRAINT `fk_desc_subrubro` FOREIGN KEY (id_subrubro) REFERENCES sub_rubro (id_subrubro);