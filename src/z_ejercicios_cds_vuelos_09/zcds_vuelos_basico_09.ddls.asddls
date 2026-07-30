@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ejercicios de CDS_09'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_vuelos_basico_09 as select from /dmo/carrier
{
    carrier_id, 
    name,
    currency_code  
}
