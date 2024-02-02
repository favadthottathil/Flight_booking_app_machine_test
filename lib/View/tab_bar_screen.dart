import 'package:flight_booking_app/Model/data_model.dart';
import 'package:flight_booking_app/Utils/Resources/color.dart';
import 'package:flight_booking_app/View/Sub%20Pages/available_flight_screen.dart';
import 'package:flight_booking_app/View/Sub%20Pages/checkout_page.dart';
import 'package:flight_booking_app/View/Sub%20Pages/route_selection_page.dart';
import 'package:flight_booking_app/View/Sub%20Pages/seat_selection_page.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> with TickerProviderStateMixin {
  List<FlightData> flightData = [];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
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
              Container(
                height: 700,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.kBlack,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TabBar(
                      controller: tabController,
                      labelColor: AppColors.kWhite,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      unselectedLabelColor: AppColors.kGrey,
                      indicator: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.kWhite,
                            width: 2,
                          ),
                        ),
                      ),
                      indicatorColor: Colors.transparent,
                      tabs: const [
                        Tab(text: 'Route'),
                        Tab(text: 'Flight'),
                        Tab(text: 'Seat'),
                        Tab(text: 'Checkout'),
                      ],
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: 500,
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          RouteSelectionPage(),
                          AvailabeFlightScreen(),
                          SeatSelectionPage(),
                          CheckOutPage(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Text _myflightTextWidget() {
    return const Text(
      'Add Flight',
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
