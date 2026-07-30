@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ejercicio 2 cds'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_vuelos_medio_09 
with parameters p_fecha : abap.numc(8)
as select from /dmo/flight as f
inner join /dmo/carrier as c on f.carrier_id = c.carrier_id


{
 c.name,
 count(*) as Cuenta,
 @Semantics.amount.currencyCode: 'moneda'
 avg( f.price  as abap.curr(16,2)) as Media,
 @Semantics.amount.currencyCode: 'moneda'
 max( f.price ) as Maximo,
 @Semantics.amount.currencyCode: 'moneda'
 min( f.price ) as Minimo,
 f.currency_code as Moneda
   
} 

where f.flight_date > $parameters.p_fecha

group by 
c.name, f.currency_code
