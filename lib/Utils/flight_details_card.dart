import 'package:flight_booking_app/Model/data_model.dart';
import 'package:flight_booking_app/Utils/Resources/color.dart';
import 'package:flutter/material.dart';

buildFlightDetails({required List<FlightData> flightData}) {
  int? selectedCard;
  return StatefulBuilder(builder: (context, setState) {
    return Container(
      height: 950,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.kBlack,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      child: Column(
        children: flightData.asMap().entries.map((e) {
          int index = e.key;
          FlightData data = e.value;
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedCard = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: selectedCard == index ? AppColors.kWhite : Colors.transparent,
                    )),
                height: 150,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      left: 150,
                      child: Column(
                        children: [
                          const Icon(
                            Icons.airplane_ticket,
                            color: AppColors.kWhite,
                            size: 35,
                          ),
                          Text(
                            data.duration,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.kWhite,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: 25,
                      bottom: 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Date',
                            style: TextStyle(
                              // fontSize: 30,
                              color: AppColors.kGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            data.date,
                            style: const TextStyle(
                              color: AppColors.kWhite,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'FLIGHT NO',
                            style: TextStyle(
                              // fontSize: 30,
                              color: AppColors.kGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            data.flightNumber,
                            style: const TextStyle(
                              color: AppColors.kWhite,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: 25,
                      child: Column(
                        children: [
                          Text(
                            data.departureShort,
                            style: const TextStyle(
                              fontSize: 30,
                              color: AppColors.kWhite,
                            ),
                          ),
                          Text(
                            data.departure,
                            style: const TextStyle(
                              color: AppColors.kWhite,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 20,
                      child: Column(
                        children: [
                          Text(
                            data.destinationShort,
                            style: const TextStyle(
                              fontSize: 30,
                              color: AppColors.kWhite,
                            ),
                          ),
                          Text(
                            data.destination,
                            style: const TextStyle(
                              color: AppColors.kWhite,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  });
}
