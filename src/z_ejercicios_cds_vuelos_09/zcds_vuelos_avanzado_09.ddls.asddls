@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ejercicio 3 cds'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_vuelos_avanzado_09
    as select from /dmo/booking as b 
        inner join /dmo/customer as c 
            on b.customer_id = c.customer_id
{
    c.first_name            as Nombre,
    count(*)                as Numero_Reserva,
    @Semantics.amount.currencyCode: 'Moneda'
    sum( b.flight_price )   as Importe_total,
    b.currency_code         as Moneda,
    
    case 
    when sum( b.flight_price ) < 1000 then 'Ocasional'
    when sum( b.flight_price ) < 5000 then 'Frecuente'
    else 'VIP'
    end as Tipo_cliente
    
} 
group by 
c.first_name,
b.currency_code
