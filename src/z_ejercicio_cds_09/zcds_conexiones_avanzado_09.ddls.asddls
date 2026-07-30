@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ejercicio avanzado dia 22-0-2026'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_conexiones_avanzado_09
    with parameters p_distancia : abap.dec(9,2) 
    as select from /dmo/connection as co
    inner join /dmo/carrier as ca
        on co.carrier_id = ca.carrier_id
    inner join /dmo/airport as ai 
        on co.airport_from_id = ai.airport_id
{
    co.airport_from_id as aeropuerto_origen,
    ai.city as Ciudad,
   
    avg( co.distance as abap.dec( 10, 0 ) ) as DistanciaMedia,
    count(*) as Cuenta_Distancia,
  case
    when avg( co.distance as abap.dec( 10, 0 ) ) <  1000 then 'Corta'
    when avg( co.distance as abap.dec( 10, 0 ) ) <= 5000 then 'Media'
    else 'Larga'
  end as tipo_ruta  
} 

where co.distance =$parameters.p_distancia

group by co.airport_from_id, ai.city
