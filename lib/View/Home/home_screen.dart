import 'package:flight_booking_app/Model/data_model.dart';
import 'package:flight_booking_app/Utils/Resources/color.dart';
import 'package:flight_booking_app/Utils/flight_details_card.dart';
import 'package:flight_booking_app/Utils/hard_coded_data.dart';
import 'package:flight_booking_app/View/tab_bar_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FlightData> flightData = [];

  @override
  void initState() {
    super.initState();

    flightData = HardCodedData.generateFlightsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: _buildHeader(),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: _myflightTextWidget(),
              ),
              const SizedBox(height: 32),
              buildFlightDetails(
                flightData: flightData,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TabBarScreen(),
            )),
        backgroundColor: AppColors.kWhite,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Text _myflightTextWidget() {
    return const Text(
      'My Flights',
      style: TextStyle(
        color: AppColors.kBlack,
        fontWeight: FontWeight.w600,
        fontSize: 25,
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.menu,
          color: AppColors.kBlack,
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.kBlack,
          ),
          child: const Icon(
            Icons.person,
            color: AppColors.kWhite,
            size: 40,
          ),
        )
      ],
    );
  }
}
