import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  bool isMonthly = true;
  int selectedPlanIndex = -1; // to track selected plan
  final List premiumtype = [
    "Popular",
    "Premium",
  ];
  final List package = [
    "Basic",
    "Standard",
  ];
  final List price = [
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
                  fontFamily: 'Poppins'),
            ),
            SizedBox(height: 20),
            Container(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isMonthly = true;
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isMonthly ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Monthly',
                        style: TextStyle(
                          color: isMonthly ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isMonthly = false;
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: !isMonthly ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Annually',
                        style: TextStyle(
                          color: !isMonthly ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Select a plan",
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: premiumtype.length,
                  itemBuilder: (BuildContext context, index) {
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
                            border: isSelected
                                ? Border.all(color: Colors.blue, width: 2)
                                : null,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      premiumtype[index],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF095DEC),
                                      ),
                                    ),
                                    SizedBox(width: 140),
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
                                  package[index],
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  price[index],
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
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                text:
                    "By tapping Continue, you will be charged, your subscription will auto-renew for the same price and package length until you cancel via App Store settings, and you agree to our ",
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: "Terms", // This is the word you want to make bold
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: ".", // Continue the text after the bold word
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
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
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                context.goNamed('loginPage');
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
            ),
          ],
        ),
      ),
    );
  }
}
