@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZINCIDENCIA_09'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_INCIDENCIA_09
  provider contract transactional_query
  as projection on ZR_INCIDENCIA_09
  association [1..1] to ZR_INCIDENCIA_09 as _BaseEntity on $projection.IdIncidencia = _BaseEntity.IdIncidencia
{
  key IdIncidencia,
  Titulo,
  Descripcion,
  Categoria,
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZVV_PRIORIDAD_09', element: 'Prioridad' } }]
  @UI.textArrangement: #TEXT_ONLY
  Prioridad,

  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZVV_ESTADO_09', element: 'Estado' } }]
  @UI.textArrangement: #TEXT_ONLY
  Estado,
  
  Responsable,
  FechaAlta,
  FechaLimite,
  FechaCierre,
  @Semantics: {
    user.createdBy: true
  }
  CreatedBy,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  LastChangedBy,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LastChangedAt,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LocalLastChangedAt,
  _BaseEntity
}
