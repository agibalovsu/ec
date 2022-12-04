# frozen_string_literal: true

points = Point.create!([
                         { title: 'Moscow 1',
                           latitude: 41,
                           longitude: 45 }
                       ])

charging_stations = ChargingStation.create!([
                                              { serial_number: '111', point: points[0] },
                                              { serial_number: '112', point: points[0] },
                                              { serial_number: '113', point: points[0] }
                                            ])

connectors = Connector.create!([
                                 { connector_type: 'CHAdeMO', condition: 'free', power: 20,
                                   charging_station: charging_stations[0] },
                                 { connector_type: 'CCS_COMBO_2', condition: 'free', power: 20,
                                   charging_station: charging_stations[0] },
                                 { connector_type: 'CHAdeMO', condition: 'free', power: 20,
                                   charging_station: charging_stations[1] },
                                 { connector_type: 'CCS_COMBO_2', condition: 'free', power: 20,
                                   charging_station: charging_stations[1] },
                                 { connector_type: 'Type_2', condition: 'disable', power: 20,
                                   charging_station: charging_stations[2] }
                               ])

clients = Client.create!([
                           { name: 'Pavel', phone_number: 111 },
                           { name: 'Vasily', phone_number: 777 }
                         ])

charging_sessions = ChargingSession.create!([
                                              { client: clients[0], connector: connectors[0] }
                                            ])
