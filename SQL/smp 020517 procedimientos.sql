USE [DBSMP]
GO
/****** Object:  StoredProcedure [dbo].[sp_Brecha_c]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--################################################################################
create PROCEDURE [dbo].[sp_Brecha_c]
	@nombre_brecha varchar(50),
	@desc_brecha varchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	insert into brecha values (@nombre_brecha,@desc_brecha)
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_Brecha_d]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_Brecha_d]
@id_brecha int
AS
BEGIN
	SET NOCOUNT ON;
	delete from brecha
	where id_brecha = @id_brecha
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_Brecha_r]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_Brecha_r]
AS
BEGIN
	SET NOCOUNT ON;
	select * from brecha
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_Brecha_u]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Brecha_u]
    @id_brecha int,
	@nombre_brecha varchar(50),
	@desc_brecha varchar(100)
	
AS
BEGIN
	SET NOCOUNT ON;
	update brecha set
	nombre_brecha = @nombre_brecha,
	desc_brecha = @desc_brecha
	where id_brecha = @id_brecha
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Division_funcional_c]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure   [dbo].[sp_Division_funcional_c]
(
 @id_funcion int,
 @codigo_dfuncional varchar(10),
 @nombre_dFuncional varchar(100)
)
as
BEGIN
   INSERT INTO division_funcional values(@id_funcion,@codigo_dfuncional, @nombre_dFuncional)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Division_funcional_r]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Division_funcional_r]
as
select* from  division_funcional as d   inner join  funcion as f on d.id_funcion=f.id_funcion
GO
/****** Object:  StoredProcedure [dbo].[sp_Division_funcional_u]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Division_funcional_u]
(
 @id_division_funcional int,
 @id_funcion int,
 @codigo_dfuncional varchar(10),
 @nombre_dFuncional varchar(100)
)
as
begin 
  update division_funcional set
  id_funcion= @id_funcion,
  codigo_dfuncional= @codigo_dfuncional,
  nombre_dFuncional=nombre_dFuncional
  where id_division_funcional=@id_division_funcional
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Entidad_c]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--################################################################################
CREATE PROCEDURE [dbo].[sp_Entidad_c]
	@id_sector int,
	@denominacion_entidad varchar(100),
	@nombre_entidad varchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	insert into entidad values (@id_sector,@denominacion_entidad,@nombre_entidad)
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_Entidad_d]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Entidad_d]
@id_entidad int
AS
BEGIN
	SET NOCOUNT ON;
	delete from entidad
	where id_entidad = @id_entidad
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_Entidad_r]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Entidad_r]
AS
BEGIN
	SET NOCOUNT ON;
	select * from entidad inner join sector on entidad.id_sector=sector.id_sector
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_Entidad_u]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Entidad_u]
    @id_entidad int,
	@id_sector int,
	@denominacion_entidad varchar(100),
	@nombre_entidad varchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	update entidad set
	id_sector = @id_sector,
	denominacion_entidad = @denominacion_entidad,
	nombre_entidad = @nombre_entidad
	where id_entidad = @id_entidad
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Funcion_c]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Funcion_c]
(
@codigo_funcion varchar(10),
@nombre_funcion varchar(100)
)
as
insert  into funcion values (@codigo_funcion,@nombre_funcion)
GO
/****** Object:  StoredProcedure [dbo].[sp_Funcion_r]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Funcion_r]
as
select * from funcion
GO
/****** Object:  StoredProcedure [dbo].[sp_Funcion_u]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Funcion_u]
(
@id_funcion int,
@codigo_funcion varchar(10),
@nombre_funcion varchar(100)
)
as
BEGIN
	update funcion set
	 codigo_funcion=@codigo_funcion,
	 nombre_funcion=@nombre_funcion 
	 where  id_funcion=@id_funcion
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GESTIONAR_CICLOINVERSION]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************/
/*                 Edison Ponce torres           	*/
/*                  26/04/2017                      */
/*                   PY SEMO                        */
/****************************************************/

create PROC [dbo].[SP_GESTIONAR_CICLOINVERSION]
(
@FLAT AS VARCHAR(2),
@IDCICLOINVERSION AS INT,
@NOMBRECICLOINVERSION AS  VARCHAR(50),
@DESCRIPCIONCICLOINVERSION AS  VARCHAR(100),
@USER AS INT  
)
AS
DECLARE
@AUX AS INT,
@SALIDA AS INT;

     IF( @FLAT = 'N')
     BEGIN
		  SET @AUX = ( SELECT COUNT(*) FROM estado_ciclo_inversion WITH(NOLOCK) WHERE NOMBRECICLOINVERSION = @NOMBRECICLOINVERSION AND  FL_ELIMINADO = '0');
		  IF( @AUX = 0 )
		  BEGIN			  
	           INSERT INTO estado_ciclo_inversion
	          (NOMBRECICLOINVERSION,
			  DESCRIPCIONCICLOINVERSION,
	          FL_ELIMINADO,
	          USCREADO,
	          FECCREADO)
	          VALUES
	          (@NOMBRECICLOINVERSION, @DESCRIPCIONCICLOINVERSION,'0',@USER,GETDATE());
			  
			  SET @SALIDA = 1;
			  SELECT @SALIDA;
     END 
	END


	 ELSE IF( @FLAT = 'M')
     BEGIN
          UPDATE estado_ciclo_inversion           
          SET   
	      NOMBRECICLOINVERSION=@NOMBRECICLOINVERSION,
		  DESCRIPCIONCICLOINVERSION=@DESCRIPCIONCICLOINVERSION,
          USMODIF = @USER,
          FECMODIF = GETDATE()          
          WHERE IDCICLOINVERSION = @IDCICLOINVERSION
	      SET @SALIDA = 1;
		  SELECT @SALIDA;
     END

     IF( @FLAT = 'E')
     BEGIN
          UPDATE estado_ciclo_inversion             
          SET
          FL_ELIMINADO = '1',          
          USELIMIN = @USER,
          FECELIMIN = GETDATE()          
          WHERE IDCICLOINVERSION = @IDCICLOINVERSION;
		  SET @SALIDA = 1;
		  SELECT @SALIDA
     END
	 ELSE IF( @FLAT = 'LT')
     BEGIN
          SELECT IDCICLOINVERSION, NOMBRECICLOINVERSION , DESCRIPCIONCICLOINVERSION
		  FROM estado_ciclo_inversion WITH(NOLOCK)

     END
GO
/****** Object:  StoredProcedure [dbo].[SP_GESTIONAR_FFTO]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************/
/*                 Edison Ponce torres           	*/
/*                  26/04/2017                      */
/*                   PY SEMO                        */
/****************************************************/

create PROC [dbo].[SP_GESTIONAR_FFTO]
(
@FLAT AS VARCHAR(2),
@IDFFTO AS INT,
@NOMBREFFTO AS  VARCHAR(50),
@ACRONIMOFFTO AS  VARCHAR(50),
@DESCRIPCIONFFTO AS  VARCHAR(100),
@USER AS INT  
)
AS
DECLARE
@AUX AS INT,
@SALIDA AS INT;

     IF( @FLAT = 'N')
     BEGIN
		  SET @AUX = ( SELECT COUNT(*) FROM fuente_financiamiento WITH(NOLOCK) WHERE ACRONIMOFFTO = @ACRONIMOFFTO AND  FL_ELIMINADO = '0');
		  IF( @AUX = 0 )
		  BEGIN			  
	           INSERT INTO fuente_financiamiento
	          (NOMBREFFTO,
			  ACRONIMOFFTO,
			  DESCRIPCIONFFTO,
	          FL_ELIMINADO,
	          USCREADO,
	          FECCREADO)
	          VALUES
	          (@NOMBREFFTO, @ACRONIMOFFTO,@DESCRIPCIONFFTO,'0',@USER,GETDATE());
			  
			  SET @SALIDA = 1;
			  SELECT @SALIDA;
     END 
	END


	 ELSE IF( @FLAT = 'M')
     BEGIN
          UPDATE fuente_financiamiento           
          SET   
	      NOMBREFFTO=@NOMBREFFTO,
		  ACRONIMOFFTO=@ACRONIMOFFTO,
		  DESCRIPCIONFFTO=@DESCRIPCIONFFTO,
		  USMODIF = @USER,
          FECMODIF = GETDATE()          
          WHERE IDFFTO = @IDFFTO
	      SET @SALIDA = 1;
		  SELECT @SALIDA;
     END

     IF( @FLAT = 'E')
     BEGIN
          UPDATE fuente_financiamiento             
          SET
          FL_ELIMINADO = '1',          
          USELIMIN = @USER,
          FECELIMIN = GETDATE()          
          WHERE IDFFTO = @IDFFTO;
		  SET @SALIDA = 1;
		  SELECT @SALIDA
     END
	 ELSE IF( @FLAT = 'LT')
     BEGIN
          SELECT IDFFTO, NOMBREFFTO ,ACRONIMOFFTO, DESCRIPCIONFFTO
		  FROM fuente_financiamiento WITH(NOLOCK)
 
     END
GO
/****** Object:  StoredProcedure [dbo].[SP_GESTIONAR_NATURALEZAINVERSION]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************/
/*                 Edison Ponce torres           	*/
/*                  05/04/2017                      */
/*                   PY SEMO                        */
/****************************************************/

CREATE PROC [dbo].[SP_GESTIONAR_NATURALEZAINVERSION]
(
@FLAT AS VARCHAR(2),
@IDNATURALEZA AS INT,
@NOMBRENATURALEZA AS  VARCHAR(50),
@DESCRIPCIONNATURALEZA AS  VARCHAR(100),
@USER AS INT  
)
AS
DECLARE
@AUX AS INT,
@SALIDA AS INT;

     IF( @FLAT = 'N')
     BEGIN
		  SET @AUX = ( SELECT COUNT(*) FROM naturalesa_inversion WITH(NOLOCK) WHERE @NOMBRENATURALEZA = @NOMBRENATURALEZA AND  FL_ELIMINADO = '0');
		  IF( @AUX = 0 )
		  BEGIN			  
	           INSERT INTO naturalesa_inversion
	          (NOMBRENATURALEZA,
			  DESCRIPCIONNATURALEZA,
	          FL_ELIMINADO,
	          USCREADO,
	          FECCREADO)
	          VALUES
	          (@NOMBRENATURALEZA, @DESCRIPCIONNATURALEZA,'0',@USER,GETDATE());
			  
			  SET @SALIDA = 1;
			  SELECT @SALIDA;
     END 
	END


	 ELSE IF( @FLAT = 'M')
     BEGIN
          UPDATE naturalesa_inversion           
          SET   
	      NOMBRENATURALEZA=@NOMBRENATURALEZA,
		  DESCRIPCIONNATURALEZA=@DESCRIPCIONNATURALEZA,
          USMODIF = @USER,
          FECMODIF = GETDATE()          
          WHERE IDNATURALEZA = @IDNATURALEZA
	      SET @SALIDA = 1;
		  SELECT @SALIDA;
     END

     IF( @FLAT = 'E')
     BEGIN
          UPDATE naturalesa_inversion             
          SET
          FL_ELIMINADO = '1',          
          USELIMIN = @USER,
          FECELIMIN = GETDATE()          
          WHERE IDNATURALEZA = @IDNATURALEZA;
		  SET @SALIDA = 1;
		  SELECT @SALIDA
     END
	 ELSE IF( @FLAT = 'LT')
     BEGIN
          SELECT IDNATURALEZA, NOMBRENATURALEZA , DESCRIPCIONNATURALEZA
		  FROM naturalesa_inversion WITH(NOLOCK)
          WHERE NOMBRENATURALEZA LIKE '%'+@NOMBRENATURALEZA+'%'
		  AND DESCRIPCIONNATURALEZA LIKE '%'+@DESCRIPCIONNATURALEZA+'%'
          ORDER BY IDNATURALEZA ASC;
     END
GO
/****** Object:  StoredProcedure [dbo].[SP_GESTIONAR_NIVELGOB]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************/
/*                 Edison Ponce torres           	*/
/*                  26/04/2017                      */
/*                   PY SEMO                        */
/****************************************************/

CREATE PROC [dbo].[SP_GESTIONAR_NIVELGOB]
(
@FLAT AS VARCHAR(2),
@IDNIVELGOB AS INT,
@NOMBRENIVELGOB AS  VARCHAR(50),
@DESCRIPCIONNIVELGOB AS  VARCHAR(100),
@USER AS INT  
)
AS
DECLARE
@AUX AS INT,
@SALIDA AS INT;

     IF( @FLAT = 'N')
     BEGIN
		  SET @AUX = ( SELECT COUNT(*) FROM nivel_gobierno WITH(NOLOCK) WHERE NOMBRENIVELGOB = @NOMBRENIVELGOB AND  FL_ELIMINADO = '0');
		  IF( @AUX = 0 )
		  BEGIN			  
	           INSERT INTO nivel_gobierno
	          (NOMBRENIVELGOB,
			  DESCRIPCIONNIVELGOB,
	          FL_ELIMINADO,
	          USCREADO,
	          FECCREADO)
	          VALUES
	          (@NOMBRENIVELGOB, @DESCRIPCIONNIVELGOB,'0',@USER,GETDATE());
			  
			  SET @SALIDA = 1;
			  SELECT @SALIDA;
     END 
	END


	 ELSE IF( @FLAT = 'M')
     BEGIN
          UPDATE nivel_gobierno        
          SET   
	      NOMBRENIVELGOB=@NOMBRENIVELGOB,
		  DESCRIPCIONNIVELGOB=@DESCRIPCIONNIVELGOB,
          USMODIF = @USER,
          FECMODIF = GETDATE()          
          WHERE IDNIVELGOB = @IDNIVELGOB
	      SET @SALIDA = 1;
		  SELECT @SALIDA;
     END

     IF( @FLAT = 'E')
     BEGIN
          UPDATE nivel_gobierno           
          SET
          FL_ELIMINADO = '1',          
          USELIMIN = @USER,
          FECELIMIN = GETDATE()          
          WHERE IDNIVELGOB = @IDNIVELGOB;
		  SET @SALIDA = 1;
		  SELECT @SALIDA
     END
	 ELSE IF( @FLAT = 'LT')
     BEGIN
          SELECT IDNIVELGOB, NOMBRENIVELGOB , DESCRIPCIONNIVELGOB
		  FROM nivel_gobierno WITH(NOLOCK)
          WHERE NOMBRENIVELGOB LIKE '%'+@NOMBRENIVELGOB+'%'
		  AND DESCRIPCIONNIVELGOB LIKE '%'+@DESCRIPCIONNIVELGOB+'%'
          ORDER BY IDNIVELGOB ASC;
     END
GO
/****** Object:  StoredProcedure [dbo].[SP_GESTIONAR_TIPOINVERSION]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************/
/*                 Edison Ponce torres           	*/
/*                  05/04/2017                      */
/*                   PY SEMO                        */
/****************************************************/

CREATE PROC [dbo].[SP_GESTIONAR_TIPOINVERSION]
(
@FLAT AS VARCHAR(2),
@IDTIPOINVERSION AS INT,
@NOMBRETIPOINVERSION AS  VARCHAR(50),
@DESCRIPCIONTIPOINVERSION AS  VARCHAR(100),
@USER AS INT  
)
AS
DECLARE
@AUX AS INT,
@SALIDA AS INT;

     IF( @FLAT = 'N')
     BEGIN
		  SET @AUX = ( SELECT COUNT(*) FROM tipo_inversion WITH(NOLOCK) WHERE NOMBRETIPOINVERSION = @NOMBRETIPOINVERSION AND  FL_ELIMINADO = '0');
		  IF( @AUX = 0 )
		  BEGIN			  
	           INSERT INTO tipo_inversion
	          (NOMBRETIPOINVERSION,
			  DESCRIPCIONTIPOINVERSION,
	          FL_ELIMINADO,
	          USCREADO,
	          FECCREADO)
	          VALUES
	          (@NOMBRETIPOINVERSION, @DESCRIPCIONTIPOINVERSION,'0',@USER,GETDATE());
			  
			  SET @SALIDA = 1;
			  SELECT @SALIDA;
     END 
	END


	 ELSE IF( @FLAT = 'M')
     BEGIN
          UPDATE tipo_inversion          
          SET   
	      NOMBRETIPOINVERSION=@NOMBRETIPOINVERSION,
		  DESCRIPCIONTIPOINVERSION=@DESCRIPCIONTIPOINVERSION,
          USMODIF = @USER,
          FECMODIF = GETDATE()          
          WHERE IDTIPOINVERSION = @IDTIPOINVERSION
	      SET @SALIDA = 1;
		  SELECT @SALIDA;
     END

     IF( @FLAT = 'E')
     BEGIN
          UPDATE tipo_inversion        
          SET
          FL_ELIMINADO = '1',          
          USELIMIN = @USER,
          FECELIMIN = GETDATE()          
          WHERE IDTIPOINVERSION = @IDTIPOINVERSION;
		  SET @SALIDA = 1;
		  SELECT @SALIDA
     END
	 ELSE IF( @FLAT = 'LT')
     BEGIN
          SELECT IDTIPOINVERSION, NOMBRETIPOINVERSION , DESCRIPCIONTIPOINVERSION
		  FROM tipo_inversion WITH(NOLOCK)
          WHERE NOMBRETIPOINVERSION LIKE '%'+@NOMBRETIPOINVERSION+'%'
		  AND DESCRIPCIONTIPOINVERSION LIKE '%'+@DESCRIPCIONTIPOINVERSION+'%'
          ORDER BY IDTIPOINVERSION ASC;
     END
GO
/****** Object:  StoredProcedure [dbo].[SP_GESTIONAR_TIPOLOGIAINVERSION]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************/
/*                 Edison Ponce torres           	*/
/*                  05/04/2017                      */
/*                   PY SEMO                        */
/****************************************************/

CREATE PROC [dbo].[SP_GESTIONAR_TIPOLOGIAINVERSION]
(
@FLAT AS VARCHAR(2),
@IDTIPOLOGIAINVERSION AS INT,
@NOMBRETIPOLOGIA AS  VARCHAR(50),
@DESCRIPCIONTIPOLOGIA AS  VARCHAR(100),
@USER AS INT  
)
AS
DECLARE
@AUX AS INT,
@SALIDA AS INT;

     IF( @FLAT = 'N')
     BEGIN
		  SET @AUX = ( SELECT COUNT(*) FROM tipologia_inversion WITH(NOLOCK) WHERE NOMBRETIPOLOGIA = @NOMBRETIPOLOGIA AND  FL_ELIMINADO = '0');
		  IF( @AUX = 0 )
		  BEGIN			  
	           INSERT INTO tipologia_inversion
	          (NOMBRETIPOLOGIA,
			  DESCRIPCIONTIPOLOGIA,
	          FL_ELIMINADO,
	          USCREADO,
	          FECCREADO)
	          VALUES
	          (@NOMBRETIPOLOGIA, @DESCRIPCIONTIPOLOGIA,'0',@USER,GETDATE());
			  
			  SET @SALIDA = 1;
			  SELECT @SALIDA;
     END 
	END


	 ELSE IF( @FLAT = 'M')
     BEGIN
          UPDATE tipologia_inversion            
          SET   
	      NOMBRETIPOLOGIA=@NOMBRETIPOLOGIA,
		  DESCRIPCIONTIPOLOGIA=@DESCRIPCIONTIPOLOGIA,
          USMODIF = @USER,
          FECMODIF = GETDATE()          
          WHERE IDTIPOLOGIAINVERSION = @IDTIPOLOGIAINVERSION
	      SET @SALIDA = 1;
		  SELECT @SALIDA;
     END

     IF( @FLAT = 'E')
     BEGIN
          UPDATE tipologia_inversion            
          SET
          FL_ELIMINADO = '1',          
          USELIMIN = @USER,
          FECELIMIN = GETDATE()          
          WHERE IDTIPOLOGIAINVERSION = @IDTIPOLOGIAINVERSION;
		  SET @SALIDA = 1;
		  SELECT @SALIDA
     END
	 ELSE IF( @FLAT = 'LT')
     BEGIN
          SELECT IDTIPOLOGIAINVERSION, NOMBRETIPOLOGIA , DESCRIPCIONTIPOLOGIA
		  FROM tipologia_inversion WITH(NOLOCK)
          WHERE NOMBRETIPOLOGIA LIKE '%'+@NOMBRETIPOLOGIA+'%'
		  AND DESCRIPCIONTIPOLOGIA LIKE '%'+@DESCRIPCIONTIPOLOGIA+'%'
          ORDER BY IDTIPOLOGIAINVERSION ASC;
     END
GO
/****** Object:  StoredProcedure [dbo].[sp_grupo_funcional_c]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_grupo_funcional_c]
(
@id_division_funcional int,
@id_sector int,
@codigo_Gfuncional varchar(10),
@nombre_Gfuncional varchar(100)
)
as
begin 
insert into grupo_funcional values (@id_division_funcional,@id_sector,@codigo_Gfuncional,@nombre_Gfuncional)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_grupo_funcional_r]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_grupo_funcional_r]
as
select* from grupo_funcional as gr inner join division_funcional df on gr.id_division_funcional=df.id_division_funcional inner join sector s on gr.id_sector=s.id_sector
GO
/****** Object:  StoredProcedure [dbo].[sp_grupo_funcional_u]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_grupo_funcional_u]
(
@id_grupo_funcional int,
@id_division_funcional int,
@id_sector int,
@codigo_Gfuncional varchar(10),
@nombre_Gfuncional varchar(100)
)
as
begin 
update grupo_funcional set 
id_division_funcional=@id_division_funcional, 
id_sector=@id_sector,
codigo_g_funcional=@codigo_Gfuncional,
nombre_g_funcional=@nombre_Gfuncional
where id_grupo_funcional=@id_grupo_funcional
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_Indicador_c]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Indicador_c]
@nombre_indicador varchar(100),
@definicion_indicador varchar(100),
@unidad_medida_indicador varchar(50)
as
begin
insert into indicador values (@nombre_indicador,@definicion_indicador,@unidad_medida_indicador)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Indicador_r]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Indicador_r]
as
select * from indicador
GO
/****** Object:  StoredProcedure [dbo].[sp_Indicador_u]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Indicador_u]
@id_indicador int,
@nombre_indicador varchar(100),
@definicion_indicador varchar(100),
@unidad_medida_indicador varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	update indicador
	set
	nombre_indicador   = @nombre_indicador ,
	definicion_indicador=@definicion_indicador ,
	unidad_medida_indicador=@unidad_medida_indicador
	where id_indicador = @id_indicador
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListaDepartamento]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListaDepartamento]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	SELECT distinct departamento as departamentos from ubigeo
	--SELECT distinct top(93) provincia as departamento from ubigeo where provincia is not null
	-- en el ajax no imprime los caracteres especiales
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListaDistrito]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOhan
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ListaDistrito]
@provincia varchar(70)
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select distinct distrito as distritos from ubigeo where provincia=@provincia and distrito is not null
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListaProvincia]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOhan
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ListaProvincia]
@departamento varchar(70)
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--select distinct provincia from ubigeo where departamento=@departamento and provincia is not null
	SELECT distinct provincia as provincias from ubigeo where provincia is not null and departamento = @departamento
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModalidadE_c]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ModalidadE_c]
@nombre_modalidad_ejec varchar(100),
@desc_modalidad_ejec varchar(200)
AS
begin
insert into modalidad_ejecucion values (@nombre_modalidad_ejec,@desc_modalidad_ejec)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ModalidadE_r]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ModalidadE_r]
as
select * from modalidad_ejecucion
GO
/****** Object:  StoredProcedure [dbo].[sp_ModalidadE_u]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_ModalidadE_u]
@id_modalidad_ejec int,
@nombre_modalidad_ejec varchar(100),
@desc_modalidad_ejec varchar(200)
AS
BEGIN
	SET NOCOUNT ON;
	update modalidad_ejecucion
	set
	nombre_modalidad_ejec = @nombre_modalidad_ejec,
	desc_modalidad_ejec=@desc_modalidad_ejec
	where id_modalidad_ejec = @id_modalidad_ejec
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RubroE_c]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_RubroE_c] 
@nombre_ejecucion varchar(100),
@descripcion_rubro varchar(200)
as
begin
insert into rubro_ejecucion values (@nombre_ejecucion, @descripcion_rubro)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_RubroE_r]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_RubroE_r]
as
select * from rubro_ejecucion
GO
/****** Object:  StoredProcedure [dbo].[sp_RubroE_u]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RubroE_u]
@id_rubro_ejecucion int,
@nombre_rubro_ejec varchar(100),
@descripcion_rubro_ejec varchar(200)
AS
BEGIN
	SET NOCOUNT ON;
	update rubro_ejecucion
	set
	nombre_rubro_ejec= @nombre_rubro_ejec,
	descripcion_rubro_ejec=@descripcion_rubro_ejec
	where id_rubro_ejecucion = @id_rubro_ejecucion
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Sector_c]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Sector_c]
@nombre_sector varchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	insert into sector values (@nombre_sector)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Sector_d]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_Sector_d]
@id_sector int
AS
BEGIN
	SET NOCOUNT ON;
	delete sector
	
	where id_sector = @id_sector
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Sector_r]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Sector_r]
AS
BEGIN
	SET NOCOUNT ON;
	select * from sector
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Sector_u]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_Sector_u]
@id_sector int,
@nombre_sector varchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	update sector
	set
	nombre_sector = @nombre_sector
	where id_sector = @id_sector
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UnidadE_c]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_UnidadE_c]
@nombre_ue varchar(200)
as
insert into unidad_ejecutora values (@nombre_ue)
GO
/****** Object:  StoredProcedure [dbo].[sp_UnidadE_r]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UnidadE_r]
as
select * from unidad_ejecutora
GO
/****** Object:  StoredProcedure [dbo].[sp_UnidadE_u]    Script Date: 2/05/2017 08:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_UnidadE_u]
@id_ue int,
@nombre_ue varchar(200)
AS
BEGIN
	SET NOCOUNT ON;
	update unidad_ejecutora
	set
	nombre_ue  = @nombre_ue 
	where id_ue = @id_ue
END
GO
