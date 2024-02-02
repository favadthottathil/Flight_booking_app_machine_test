class FlightData {
  final String departureShort;
  final String departure;
  final String date;
  final String destinationShort;
  final String destination;
  final String flightNumber;
  final String duration;
  final String time;
  final double? price;
  final String? seat;

  FlightData({
    required this.departureShort,
    required this.departure,
    required this.date,
    required this.destinationShort,
    required this.destination,
    required this.flightNumber,
    required this.duration,
    required this.time,
    this.price,
    this.seat,
  });
}
