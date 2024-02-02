import 'package:flight_booking_app/Controller/payment_controller.dart';
import 'package:flight_booking_app/Utils/Resources/color.dart';
import 'package:flight_booking_app/View/Payment%20Failed/payment_failed.dart';
import 'package:flight_booking_app/View/Payment%20Success/payment_success.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

int totalCount = 0;

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final PaymentController _paymentController = PaymentController();

  int totalAmount = 0;

  @override
  void initState() {
    super.initState();

    totalAmount = totalCount * 170;

    _paymentController.razorpay = Razorpay();
    // payment success
    _paymentController.razorpay.on(
      'payment.success',
      (PaymentSuccessResponse response) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PaymentSuccess(),
            ));
      },
    );
    // payment failed
    _paymentController.razorpay.on(
      'payment.error',
      (PaymentSuccessResponse response) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PaymentFailed(),
            ));
      },
    );
    // external vault
    _paymentController.razorpay.on(
      'external.wallet.payment',
      (PaymentSuccessResponse response) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PaymentSuccess(),
            ));
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _paymentController.razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildFirstColumn(),
              _buildSecondColumn(),
              _buildThirdColumn(),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(color: AppColors.kGrey),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Booked Seats: $totalCount',
                style: const TextStyle(
                  color: AppColors.kWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$ $totalAmount',
                style: const TextStyle(
                  fontSize: 32,
                  color: AppColors.kWhite,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              _paymentController.openCheckout(totalAmount);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kWhite,
                foregroundColor: AppColors.kBlack,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: const Size(250, 60)),
            child: const Center(
              child: Text(
                'Pay Now',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildFirstColumn() {
    final firstColumn = [
      const Text(
        'DBC',
        style: TextStyle(
          color: AppColors.kWhite,
          fontSize: 32,
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        'DABACA',
        style: TextStyle(
          color: AppColors.kWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];

    final secondColumn = [
      const Text(
        'FLIGHT DATE',
        style: TextStyle(
          color: AppColors.kWhite,
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        'TUE 23',
        style: TextStyle(
          color: AppColors.kWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];

    final thirdColumn = [
      const Text(
        'BOARDING TIME',
        style: TextStyle(
          color: AppColors.kWhite,
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        '8:35',
        style: TextStyle(
          color: AppColors.kWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...firstColumn,
        const SizedBox(height: 40),
        ...secondColumn,
        const SizedBox(height: 30),
        ...thirdColumn
      ],
    );
  }

  _buildSecondColumn() {
    final firstColumn = [
      const Icon(
        Icons.flight_takeoff,
        color: AppColors.kWhite,
        size: 32.0,
      ),
      const SizedBox(
        height: 8.0,
      ),
      const Text(
        '1h 35m',
        style: TextStyle(
          color: AppColors.kWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];

    final secondColumn = [
      const Text(
        "GATE",
        style: TextStyle(
          color: AppColors.kWhite,
        ),
      ),
      const SizedBox(
        height: 8.0,
      ),
      const Text(
        "B2",
        style: TextStyle(
          color: AppColors.kWhite,
          fontWeight: FontWeight.bold,
        ),
      )
    ];
    final thirdColumn = [
      const Text(
        "SEAT",
        style: TextStyle(
          color: AppColors.kWhite,
        ),
      ),
      const SizedBox(
        height: 8.0,
      ),
      const Text(
        '3B',
        style: TextStyle(
          color: AppColors.kWhite,
          fontWeight: FontWeight.bold,
        ),
      )
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...firstColumn,
        const SizedBox(height: 40),
        ...secondColumn,
        const SizedBox(height: 30),
        ...thirdColumn
      ],
    );
  }

  Widget _buildThirdColumn() {
    final firstColumn = [
      const Text(
        'ADY',
        style: TextStyle(
          color: AppColors.kWhite,
          fontSize: 32,
        ),
      ),
      const SizedBox(
        height: 8.0,
      ),
      const Text(
        'Almedy',
        style: TextStyle(
          color: AppColors.kWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];
    final secondColumn = [
      const Text(
        "FLIGHT NO",
        style: TextStyle(
          color: AppColors.kWhite,
        ),
      ),
      const SizedBox(
        height: 8.0,
      ),
      const Text(
        'KB70',
        style: TextStyle(
          color: AppColors.kWhite,
          fontWeight: FontWeight.bold,
        ),
      )
    ];
    final thirdColumn = [
      const Text(
        "CLASS",
        style: TextStyle(
          color: AppColors.kWhite,
        ),
      ),
      const SizedBox(
        height: 8.0,
      ),
      const Text(
        "Economy",
        style: TextStyle(
          color: AppColors.kWhite,
          fontWeight: FontWeight.bold,
        ),
      )
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...firstColumn,
        const SizedBox(
          height: 40.0,
        ),
        ...secondColumn,
        const SizedBox(height: 32.0),
        ...thirdColumn,
      ],
    );
  }
}
