import 'package:flight_booking_app/Model/data_model.dart';
import 'package:flight_booking_app/Utils/Resources/color.dart';
import 'package:flight_booking_app/Utils/days_calender_widget.dart';
import 'package:flight_booking_app/Utils/flight_details_card.dart';
import 'package:flight_booking_app/Utils/hard_coded_data.dart';
import 'package:flutter/material.dart';

class AvailabeFlightScreen extends StatefulWidget {
  const AvailabeFlightScreen({super.key});

  @override
  State<AvailabeFlightScreen> createState() => _AvailabeFlightScreenState();
}

class _AvailabeFlightScreenState extends State<AvailabeFlightScreen> {
  late final ScrollController controller;
  late final List<DateTime> days;
  List<FlightData> flightData = [];
  int? selectedDate;

  @override
  void initState() {
    super.initState();
    controller = ScrollController(initialScrollOffset: 60.0 * DateTime.now().day);
    days = generateDays(month: DateTime.now());
    flightData = HardCodedData.generateFlightsData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 80,
            child: ListView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: days.length,
              itemBuilder: (context, index) => _buildDayWidget(
                day: days[index],
                selectedDate: selectedDate,
                index: index,
              ),
            ),
          ),
          const SizedBox(height: 24),
          buildFlightDetails(
            flightData: flightData,
            
          )
        ],
      ),
    );
  }

  _buildDayWidget({required DateTime day, required int? selectedDate, required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: () {
          setState(() {
            this.selectedDate = index;
          });
        },
        child: Container(
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: selectedDate == index ? AppColors.kWhite : AppColors.kGrey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                daysMap[day.weekday].toString(),
                style: TextStyle(
                  color: selectedDate == index ? AppColors.kWhite : AppColors.kGrey,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                day.day.toString(),
                style: TextStyle(
                  color: selectedDate == index ? AppColors.kWhite : AppColors.kGrey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
