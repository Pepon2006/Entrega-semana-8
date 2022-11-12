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
        nomb_producto 	VARCHAR (50),
		PRIMARY KEY (id_producto)
);

CREATE TABLE if NOT exists isosceles.usuario (
		id_usuario	INT NOT NULL AUTO_INCREMENT,
		id_tusuario		INT,
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
        categoria  VARCHAR (100) NOT NULL,
        PRIMARY KEY (id_tusuario)
);

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
	ADD CONSTRAINT `fk_tipousuario` FOREIGN KEY (id_tusuario) REFERENCES tipo_usuario (id_tusuario);
	
    
ALTER TABLE isosceles.region
	ADD CONSTRAINT `fk_regpais` FOREIGN KEY (id_pais) REFERENCES pais (id_pais);
 
    
ALTER TABLE isosceles.info_personal    
    ADD CONSTRAINT `fk_tipo` FOREIGN KEY (id_tipo) REFERENCES tipo_id (id_tipo),
	ADD CONSTRAINT `fk_usuariotipo` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);

    
ALTER TABLE isosceles.domicilios
	ADD CONSTRAINT `fk_domiusua` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	ADD  CONSTRAINT `fk_dompais` FOREIGN KEY (id_pais) REFERENCES pais (id_pais),
	ADD CONSTRAINT `fk_domiregion` FOREIGN KEY (id_region) REFERENCES region (id_region);
    
     
ALTER TABLE isosceles.info_finan_usuario
     ADD CONSTRAINT `fk_finausuario` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	 ADD CONSTRAINT `fk_finanemisor` FOREIGN KEY (id_entidad) REFERENCES entidad_emisora (id_entidad),
	 ADD CONSTRAINT `fk_finantipo` FOREIGN KEY (id_tipo_cuenta) REFERENCES tipo_cuenta (id_tipo_cuenta);
     
ALTER TABLE isosceles.info_finan_tarjetas_usuario
     ADD CONSTRAINT `fk_tarjeusua` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	 ADD CONSTRAINT `fk_tarjemi` FOREIGN KEY (id_entidad) REFERENCES entidad_emisora (id_entidad),
	 ADD CONSTRAINT `fk_tarjetipo` FOREIGN KEY (id_tipo_tarjeta) REFERENCES tipo_tarjeta (id_tipo_tarjeta),
	 ADD CONSTRAINT `fk_tarjeta` FOREIGN KEY (id_tarjeta) REFERENCES tarjeta (id_tarjeta);


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
    
    
    -- VISTA QUE MUESTRA LOS PRIMERO 50 PRODUCTOS CON MAS STOCK
CREATE OR REPLACE VIEW listado_prouctos_mas_stock AS
(SELECT 
unidades
,MAX(precio) AS precio_mas_alto
,MIN(precio) AS precio_mas_bajo
,AVG(precio) AS precio_promedio
,descripcion
,p.nomb_producto
FROM ingreso_pro i
INNER JOIN producto p 
ON (p.id_producto = i.id_producto)
GROUP BY i.id_producto
ORDER BY SUM(unidades) DESC LIMIT 50
);

-- 	DATOS DE CONTACTO DE LOS USUARIOS MENOR NIVEL 3 SIN TELEFONO
CREATE OR REPLACE VIEW contacto_usuario_menor_nivel3 AS 
(SELECT 
CONCAT (nombre, '  ', apellido) AS Nombre_y_Apellido
,email
,num_tel
FROM email_contacto e
	INNER JOIN usuario u
		ON e.id_usuario = u.id_usuario
	INNER JOIN contacto_tel t
		ON e.id_usuario = t.id_usuario
WHERE id_tusuario < 3 AND num_tel LIKE '%sin%'
);

-- DATOS PARA REALIZAR ENVIO
CREATE OR REPLACE VIEW datos_envio AS
(SELECT 
	CONCAT (nombre, '  ', apellido) AS Nombre_y_Apellido
-- ,   r.region
-- ,   p.pais 
,	domicilio	
,	codigo_post
,	p.nomb_producto
,	unidades
FROM egreso_pro e
	INNER JOIN usuario u
	ON (e.id_usuario = u.id_usuario)
    INNER JOIN domicilios d
    ON (envio = d.id_domi)
    INNER JOIN producto p
    ON (e.id_producto = p.id_producto)
);

-- LA MISMA MUESTRA LOS TIPOS DE CUENTAS POSIBLES PARA CADA USUARIO DEL 1 AL 6 POR EL MOMENTO
USE isosceles;
CREATE OR REPLACE VIEW tipos_de_usuarios AS
(SELECT categoria
FROM tipo_usuario
);
   
   
 -- FUNCION QUE DEVUELVE EL NOMBRE COMPLETO DE LOS USUARIOS INGRESANDO EL ID_USUARIO
                -- DISPONIBLE DEL 1 AL 300 SI EL NUMERO ES MAYOR ENVIA MENSAJE DE ERROR
USE isosceles;
DROP FUNCTION IF EXISTS `nombre_completo`;

DELIMITER $$
USE isosceles$$
CREATE FUNCTION `nombre_completo` (usuario INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
	DECLARE v_nombre VARCHAR(100);
    DECLARE v_apellido VARCHAR(100);
    DECLARE v_completo VARCHAR(100);
    SET v_nombre = (SELECT nombre FROM usuario WHERE id_usuario = usuario);
    SET v_apellido = (SELECT apellido FROM usuario WHERE id_usuario = usuario);
    
		IF usuario <= 300 	THEN
			SET v_completo = concat(v_nombre, ' ', v_apellido);
        ELSE
			SET v_completo = 'Valor fuera de rango';
		END IF;
    RETURN v_completo;
END$$
DELIMITER ;

	-- FUNCION PAR AVER SI EXISTE LA CATEGORIA DE USUARIO DEL 1 AL 6 SON EXISTENTES

USE `isosceles`;
DROP function IF EXISTS `existe_categoria_usuario`;
DELIMITER $$
USE `isosceles`$$
CREATE FUNCTION `existe_categoria_usuario` (nuevo_cate_usuario INT)
RETURNs VARCHAR (150)
READS SQL DATA

BEGIN
	DECLARE nivel VARCHAR (150) ;
	DECLARE nuevo_nivel VARCHAR (150);
	DECLARE mensaje VARCHAR(150);
	DECLARE niv VARCHAR (150);
	SET niv= (CONCAT('Nivel',' ',nuevo_cate_usuario));
	SET nivel= (SELECT categoria FROM tipo_usuario WHERE (niv = categoria));
	SET nuevo_nivel = niv;
		IF nuevo_nivel = nivel THEN
			SET mensaje = 'Error,nivel existente';
		ELSE
			SET mensaje = 'Es posible crear este nuevo nivel';	
		END IF;
        RETURN mensaje;
END$$

DELIMITER ;		
            
   
   -- FUNCION QUE PERMITE SABER SI EL TIPO DE ID (Pasaporte) Y SU NUMERO COMBINADOS YA ESTA REGISTRADOS 
    -- EJEMPLO nue_tipoid Pasaporte  numid_nuev 330306423 DEBE NO HACER LA CARGA DE DATOS
     --                   Cedula de Identidad   252562474  DEBE NO HACER LA CARGA DE DATOS   
     -- SE DEBEN RESPETAR LAS MAYUSCULAS, NO PUDE CORREGIR ESO
            
USE `isosceles`;
DROP FUNCTION IF EXISTS `existe_usuario`;
DELIMITER $$
USE `isosceles`$$
CREATE FUNCTION `existe_usuario` (nue_tipoid VARCHAR (50), numid_nuev VARCHAR (30),n_usuario VARCHAR (50), nombre VARCHAR (50), 
								  apellido VARCHAR (150), fecha_nac DATE, password VARCHAR (150))

RETURNS VARCHAR (150)
READS SQL DATA

BEGIN
	DECLARE tipoidexist VARCHAR (150) ;
    DECLARE numidexist VARCHAR (150);
    DECLARE usuarioexist VARCHAR (150);
    DECLARE mensaje VARCHAR(150);
	SET tipoidexist = (SELECT tipo_id FROM tipo_id WHERE (nue_tipoid = tipo_id));
	SET numidexist = (SELECT num_personal FROM info_personal WHERE (numid_nuev = num_personal));
	-- SET usuarioexist = (SELECT usuario FROM usuario WHERE (n_usuario = usuario)); 
		IF (nue_tipoid = tipoidexist AND numidexist = numid_nuev) THEN
			SET mensaje = "tipo de identificacion y numero, ya registrados";
             ELSE   
            SET	mensaje = CONCAT_WS(' ',"Se ingresaran los sigiuentes datos",nue_tipoid,numid_nuev,nombre,apellido,'en la tabla usuario');
         END IF;    
	RETURN mensaje;
END$$
DELIMITER ;            
            
            
-- SP PARA INGRESAR NUEVA CATEGORIA DE USUARIO SI NO EXISTE, DEL 1 AL 6 SON LAS EXISTENTES

USE `isosceles`;
DROP PROCEDURE IF EXISTS `agregar_nueva_categoria`;
DELIMITER $$
USE `isosceles`$$
CREATE PROCEDURE `agregar_nueva_categoria` (IN nueva_cate_usuario INT)
READS SQL DATA

BEGIN
	DECLARE nivel VARCHAR (150) ;
	DECLARE nuevo_nivel VARCHAR (150);
	DECLARE mensaje VARCHAR(150);
	DECLARE niv VARCHAR (150);
	SET niv= (CONCAT('Nivel',' ',nueva_cate_usuario));
	SET nivel= (SELECT categoria FROM tipo_usuario WHERE (niv = categoria));
	SET nuevo_nivel = niv;
		IF nuevo_nivel = nivel THEN
			SET mensaje = 'Error,nivel existente';
		ELSE
			INSERT INTO tipo_usuario(categoria) VALUES (nuevo_nivel);
            SET mensaje = 'Es posible crear este nuevo nivel';	
		END IF;
END$$

DELIMITER ;		

            
 -- SP PARA LA CARGA DE NUEVOS USUARIOS TOMANDOCOMO PARAMETRO PARA LA CARGA QUE EL TIPO DE ID(Pasaporte) T SU NUMEROS
    -- COMBINADOS NO ESTEN REGISTRADOS
    -- EJEMPLO nue_tipoid Pasaporte  numid_nuev 330306423 DEBE NO HACER LA CARGA DE DATOS
     --                   Cedula de Identidad   252562474  DEBE NO HACER LA CARGA DE DATOS   
     -- SE DEBEN RESPETAR LAS MAYUSCULAS, NO PUDE CORREGIR ESO
     
     
USE `isosceles`;
DROP PROCEDURE IF EXISTS `ingresar_nuevo_usuario`;
DELIMITER $$
USE `isosceles`$$
CREATE PROCEDURE `ingresar_nuevo_usuario` (nue_tipoid VARCHAR (50), numid_nuev VARCHAR (30),n_usuario VARCHAR (50), nombre VARCHAR (50), 
								  apellido VARCHAR (150), fecha_nac DATE, password VARCHAR (150))

READS SQL DATA

BEGIN
	DECLARE tipoidexist VARCHAR (150) ;
    DECLARE numidexist VARCHAR (150);
    DECLARE usuarioexist VARCHAR (150);
    DECLARE mensaje VARCHAR(150);
	SET tipoidexist = (SELECT tipo_id FROM tipo_id WHERE (nue_tipoid = tipo_id));
	SET numidexist = (SELECT num_personal FROM info_personal WHERE (numid_nuev = num_personal));
	-- SET usuarioexist = (SELECT usuario FROM usuario WHERE (n_usuario = usuario)); 
		IF (nue_tipoid = tipoidexist AND numidexist = numid_nuev) THEN
			SET mensaje = "tipo de identificacion y numero, ya registrados";
             ELSE   
            INSERT INTO usuario(id_tusuario,usuario,contrasena,nombre,apellido,fecha_nac)
            VALUES (1,n_usuario,password,nombre,apellido,fecha_nac);
            SET mensaje = 'Se procedio a la carga de datos en la Tabla usuario';
         END IF;    

END$$
DELIMITER ;                         