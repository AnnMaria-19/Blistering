@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier Interface view'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define view entity ZI_CARRIER_GM_R
  as select from /dmo/carrier as Carrier
{
  key carrier_id    as CarrierId,
      @Semantics.text: true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      name          as Name,
      currency_code as CurrencyCode
}
