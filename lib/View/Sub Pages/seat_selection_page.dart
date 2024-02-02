import 'package:flight_booking_app/Utils/Resources/color.dart';
import 'package:flight_booking_app/View/Sub%20Pages/checkout_page.dart';
import 'package:flutter/material.dart';

class SeatSelectionPage extends StatefulWidget {
  const SeatSelectionPage({super.key});

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  List<int> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          top: 8,
          right: 24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildPlaneWithSeatOption(),
            _buildFlightInfoColumn(),
          ],
        ),
      ),
    );
  }

  _buildFlightInfoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'DBC',
          style: TextStyle(
            color: AppColors.kWhite,
            fontSize: 30,
          ),
        ),
        const Text(
          'Dabaca',
          style: TextStyle(
            color: AppColors.kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        const Icon(
          Icons.flight_land,
          color: AppColors.kWhite,
          size: 40,
        ),
        const Text(
          '1h 35m',
          style: TextStyle(
            color: AppColors.kWhite,
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'ADY',
          style: TextStyle(color: AppColors.kWhite, fontSize: 32),
        ),
        const Text(
          'Almedy',
          style: TextStyle(
            color: AppColors.kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'FLIGHT NO',
          style: TextStyle(
            color: AppColors.kWhite,
          ),
        ),
        const Text(
          'KB70',
          style: TextStyle(
            color: AppColors.kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'BOOKED SEATS',
          style: TextStyle(
            color: AppColors.kWhite,
          ),
        ),
        Text(
          selectedSeats.length.toString(),
          style: const TextStyle(
            color: AppColors.kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _buildPlaneWithSeatOption() {
    return ClipPath(
      clipper: PlaneClipper(),
      child: Container(
        color: Colors.white54,
        width: 225,
        height: 500,
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Text(
              'TUE 23, 8:35 AM',
              style: TextStyle(
                color: AppColors.kWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Economy Class',
              style: TextStyle(
                color: AppColors.kWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            _buildSeatGrid(),
          ],
        ),
      ),
    );
  }

  _buildSeatGrid() {
    return SizedBox(
      height: 300,
      width: 200,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 16,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: GestureDetector(
            onTap: () {
             
              setState(() {
                if (selectedSeats.contains(index)) {
                  selectedSeats.remove(index);
                  totalCount = selectedSeats.length - 1;
                } else {
                  selectedSeats.add(index);

                  totalCount = selectedSeats.length;
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.kBlack,
                  border: Border.all(
                    color: AppColors.kWhite,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: selectedSeats.contains(index) ? const Icon(Icons.check, color: AppColors.kWhite) : const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}

class PlaneClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(10, size.height);
    path.lineTo(0, size.height / 2.3);

    path.quadraticBezierTo(size.width / 5, 0, size.width / 2, 0);
    path.quadraticBezierTo(size.width - size.width / 5, 0, size.width, size.height / 2.3);
    path.lineTo(size.width - 10, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
