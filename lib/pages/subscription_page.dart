import 'package:calliverse/pages/call.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  bool isMonthly = true;
  int selectedPlanIndex = -1; // Track selected plan

  final List<String> premiumTypes = [
    "Popular",
    "Premium",
  ];
  final List<String> packages = [
    "Basic",
    "Standard",
  ];
  final List<String> prices = [
    '\$12.99/month',
    '\$24.99/month',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            context.goNamed('loginPage');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Unlock All Features with Premium",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 20),
            _buildSubscriptionToggle(),
            SizedBox(height: 20),
            Text(
              "Select a plan",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            _buildPlanSelector(),
            SizedBox(height: 10),
            _buildTermsText(),
            SizedBox(height: 30),
            _buildContinueButton(),
            SizedBox(height: 20),
            _buildFreeTrialText(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionToggle() {
    return Row(
      children: [
        _buildToggleButton('Monthly', isMonthly, () {
          setState(() {
            isMonthly = true;
          });
        }),
        _buildToggleButton('Annually', !isMonthly, () {
          setState(() {
            isMonthly = false;
          });
        }),
      ],
    );
  }

  Widget _buildToggleButton(String text, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildPlanSelector() {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: premiumTypes.length,
        itemBuilder: (BuildContext context, int index) {
          bool isSelected = selectedPlanIndex == index;
          return Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedPlanIndex = index;
                });
              },
              child: Container(
                height: 140,
                width: 260,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: isSelected ? Border.all(color: Colors.blue, width: 2) : null,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            premiumTypes[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF095DEC),
                            ),
                          ),
                          if (isSelected)
                            Icon(
                              Icons.check,
                              color: Colors.blue,
                              weight: 20,
                            ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Text(
                        packages[index],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        prices[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTermsText() {
    return Text.rich(
      TextSpan(
        text: "By tapping Continue, you will be charged, your subscription will auto-renew for the same price and package length until you cancel via App Store settings, and you agree to our ",
        style: TextStyle(
          fontSize: 10,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: "Terms",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(text: "."),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0081FF),
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text(
        "Continue",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildFreeTrialText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Call(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Text(
          "Start Free Trial",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
