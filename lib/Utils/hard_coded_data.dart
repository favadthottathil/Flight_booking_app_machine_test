import 'package:flight_booking_app/Model/data_model.dart';

class HardCodedData {
  static List<FlightData> generateFlightsData() => List.generate(
        5,
        (index) => FlightData(
          departureShort: "DBC",
          departure: "Dabaca",
          date: "01-Feb-2024",
          destinationShort: "ADY",
          destination: "Almedy",
          flightNumber: "KB7$index",
          duration: "1h 35m",
          time: "8:35 AM",
        ),
      );
}
