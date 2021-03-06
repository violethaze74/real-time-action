USE [WeatherMyWay]
GO
/****** Object:  UserDefinedFunction [dbo].[RetrieveGTForecast]    Script Date: 12.09.2016 19:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[RetrieveGTForecast] 
(@CondId bigint, @VitaminDId bigint, @MelanomaRiskId bigint, @GroupItemId bigint,  @CurrentDate datetime, @UserId bigint)
--RETURNS  TABLE  AS
 --RETURN  
 RETURNS 
 varchar(max)
AS 
BEGIN
	DECLARE  @CountForecast integer
	DECLARE  @GTF nvarchar(max)
	DECLARE  @UnsendForecast nvarchar(max)

	set @GTF =  (select r.Forecast from [WeatherMyWay].[dbo].[SendForecast] sf
		inner join [WeatherMyWay].[dbo].[Recommendations] r on (r.[GroupItemId] = sf.[SendForecastID])
		where sf.[WeatherCond]=@CondId and sf.[VitaminD]=@VitaminDId and sf.[MelanomaRisk]=@MelanomaRiskId and sf.[UserId] = @UserId and sf.[ForecastDate] = @CurrentDate)

	if (@CountForecast != NULL) BEGIN		
		RETURN @GTF
	END
	ELSE BEGIN
		SET @UnsendForecast = (select [WeatherMyWay].[dbo].[Recommendations].[Forecast] from [WeatherMyWay].[dbo].[Recommendations] where
		[GroupItemId] not in (select [SendForecastID] from [WeatherMyWay].[dbo].[SendForecast] where [WeatherCond]=@CondId and [VitaminD]=@VitaminDId and [MelanomaRisk]=@MelanomaRiskId) and
		[CondId]=@CondId and [VitaminDId]=@VitaminDId and [MelanomaRiskId]=@MelanomaRiskId)
		RETURN @GTF
	END
	RETURN 'Return'
END;
	
