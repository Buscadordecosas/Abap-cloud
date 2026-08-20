@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ayuda de Busqueda - Estado'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS

define view entity ZVV_ESTADO_09
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZDE_ESTADO' )
{
  @UI.hidden: true
  key domain_name    as DomainName,

  @UI.hidden: true
  key value_position as ValuePosition,

  @UI.hidden: true
  key language       as Language,

      @EndUserText.label: 'Estado'
      @ObjectModel.text.element: [ 'Text' ]
      value_low      as Estado,

      @EndUserText.label: 'Descripcion'
      text           as Text
}
