@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection CDS View'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo: {
    typeName: 'Connection',
    typeNamePlural: 'Connections'
}
@Search.searchable: true
define view entity ZI_CONNECTION_GM
  as select from /dmo/connection as Connection
  association [1..*] to ZI_FLIGHT_GM_R  as _Flight  on  $projection.CarrierId    = _Flight.CarrierId
                                                    and $projection.ConnectionId = _Flight.ConnectionId
  association [1]    to ZI_CARRIER_GM_R as _Carrier on  $projection.CarrierId = _Carrier.CarrierId
{
      @UI.facet: [{ id: 'Connection',
                    purpose: #STANDARD,
                    type: #IDENTIFICATION_REFERENCE,
                    position: 10,
                    label: 'Connection Details'},
                  { id: 'Flight',
                    purpose: #STANDARD,
                    type: #LINEITEM_REFERENCE,
                    position: 20,
                    label: 'Flight Details',
                    targetElement: '_Flight'}]

      @UI.identification: [{ position: 10 }]
      @UI.lineItem: [{ position: 10, label: 'Airline' }]
      @ObjectModel.text.association: '_Carrier'
      @Search.defaultSearchElement: true
  key carrier_id      as CarrierId,
      @UI.identification: [{ position: 20 }]
      @UI.lineItem: [{ position: 20, label: 'FlightNo' }]
      @Search.defaultSearchElement: true
  key connection_id   as ConnectionId,
      @UI.identification: [{ position: 30, label: 'Departure Airport ID' }]
      @UI.lineItem: [{ position: 30, label: 'Departure Airport ID' }]
      @UI.selectionField: [{ position: 10 }]
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: {
          name: 'ZI_AIRPORT_GM_VH',     
          element: 'AirportId'
      } }]
      airport_from_id as AirportFromId,
      @UI.lineItem: [{ position: 40 }]
      @UI.selectionField: [{ position: 20 }]
      @UI.identification: [{ position: 40 }]
      @Consumption.valueHelpDefinition: [{ entity: {
      name: 'ZI_AIRPORT_GM_VH',
      element: 'AirportId'
      } }]
      @EndUserText.label: 'Destination Airport ID'
      airport_to_id   as AirportToId,
      @UI.lineItem: [{ position: 50 }]
      @UI.identification: [{ position: 50 }]
      departure_time  as DepartureTime,
      @UI.lineItem: [{ position: 60 }]
      @UI.identification: [{ position: 60 }]
      arrival_time    as ArrivalTime,
      @UI.identification: [{ position: 70 }]
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      distance        as Distance,
      distance_unit   as DistanceUnit,
      // Association -->
      @Search.defaultSearchElement: true
      _Flight,
      @Search.defaultSearchElement: true
      _Carrier
}
