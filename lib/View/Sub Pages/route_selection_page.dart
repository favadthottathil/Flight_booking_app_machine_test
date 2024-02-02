import 'package:flight_booking_app/Utils/custom_textfield.dart';
import 'package:flutter/material.dart';

class RouteSelectionPage extends StatefulWidget {
  const RouteSelectionPage({super.key});

  @override
  State<RouteSelectionPage> createState() => _RouteSelectionPageState();
}

class _RouteSelectionPageState extends State<RouteSelectionPage> {
  final depatureController = TextEditingController();
  final destinationController = TextEditingController();
  final dateController = TextEditingController();
  final travelerController = TextEditingController();
  final classController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomTextField(
            controller: depatureController,
            labelText: 'From',
          ),
          const SizedBox(height: 20),
          CustomTextField(controller: destinationController, labelText: 'TO'),
          const SizedBox(height: 20),
          CustomTextField(controller: dateController, labelText: 'DATE'),
          const SizedBox(height: 20),
          CustomTextField(
            controller: travelerController,
            labelText: 'TRAVELER',
            keyBoardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          CustomTextField(controller: classController, labelText: 'CLASS'),
        ],
      ),
    );
  }
}
