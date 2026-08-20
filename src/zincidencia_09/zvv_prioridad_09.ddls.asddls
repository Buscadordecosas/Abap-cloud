@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ayuda de Busqueda - Prioridad'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS

define view entity ZVV_PRIORIDAD_09
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZDO_PRIORIDAD' )
{
  @UI.hidden: true
  key domain_name    as DomainName,

  @UI.hidden: true
  key value_position as ValuePosition,

  @UI.hidden: true
  key language       as Language,

      @EndUserText.label: 'Prioridad'
      @ObjectModel.text.element: [ 'Text' ]
      value_low      as Prioridad,

      @EndUserText.label: 'Descripcion'
      text           as Text
}
