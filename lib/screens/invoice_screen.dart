import 'package:ev_charging_app/custom_widgets/button.dart';
import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Invoice'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Top part with blue color
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.blue,
                  // Add your content for the top part here
                  child: const Center(
                    child: Text(
                      'Top Part',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom part with black color
              Expanded(
                flex: 7,
                child: Container(
                  color: const Color(0xff171A20),
                  // Add your content for the bottom part here
                  child: const Center(
                    child: Text(
                      'Bottom Part',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 16,
            left: 24,
            right: 24,
            child: Center(
              child: Container(
                height: 600,
                width: 357,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff171A20),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Image.asset('assets/Frame.png'),
                    const SizedBox(
                      height: 32,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Charging complete!',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Text(
                            'Dec 17, 9:00 AM',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const InvoiceRow(
                      label: 'Transaction Id',
                      value: '000985643XXX',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 1,
                      color: Color(0xfff344054),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const InvoiceRow(
                      label: 'Consumption',
                      value: '08.12kWh',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 1,
                      color: Color(0xfff344054),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const InvoiceRow(
                      label: 'Charging cost',
                      value: '€00.00',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 1,
                      color: Color(0xfff344054),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const InvoiceRow(
                      label: 'Idle Fee',
                      value: '€00.00',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 1,
                      color: Color(0xfff344054),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total amount',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff98A2B3),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '€00.00',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xffF9FAFB),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 1,
                      color: Color(0xfff344054),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            left: 24,
            right: 24,
            child: CustomButton(
              text: 'Download Invoice',
              onPressed: () {},
              backgroundColor: const Color(0xfffF7F9FC),
              buttonTextColor: const Color(0xfff171A20),
            ),
          ),
        ],
      ),
    );
  }
}

class InvoiceRow extends StatelessWidget {
  final String label;
  final String value;

  const InvoiceRow({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff98A2B3),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xffF9FAFB),
            ),
          ),
        ],
      ),
    );
  }
}
