import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: themeProvider.isDarkMode ? Color(0xff020520) : Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 56,
        automaticallyImplyLeading: false,
        backgroundColor: themeProvider.isDarkMode ? Color(0xff020520) : Colors.white,
        leadingWidth: 40,
        titleSpacing: 0,
        centerTitle: false,
       
        leading: IconButton(
          icon: Icon(
            Icons.close,
            size: 26,
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            context.pushNamed('login_page');
          },),

        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Unlock All Features with Premium",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 10),
              _buildSubscriptionToggle(themeProvider),
              SizedBox(height: 10),
              Text(
                "Select a plan",
                style: TextStyle(fontSize: 16,fontFamily: 'Poppins',fontWeight: FontWeight.w400,
                color: themeProvider.isDarkMode?Colors.white:Color(0xff393939)),
              ),
              SizedBox(height: 10),
              _buildPlanSelector(themeProvider),
              SizedBox(height: 5,),
              _buildTermsText(themeProvider),
              SizedBox(height: 10),
              _buildContinueButton(themeProvider),
              SizedBox(height: 20),
              _buildFreeTrialText(context,themeProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionToggle(dynamic themeProvider) {
  return Stack(
    children: [
      Container(
        width: double.infinity, // Total width of both buttons plus padding
        height: 45, // Match height with toggle buttons
        decoration: BoxDecoration(
          color: themeProvider.isDarkMode?Color(0xff1A1C3D): Color(0xffF7F7FC), // Background color for the row
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildToggleButton('Monthly', isMonthly, () {
            setState(() {
              isMonthly = true;
            });
          },themeProvider),
          _buildToggleButton('Annually', !isMonthly, () {
            setState(() {
              isMonthly = false;
            });
          },themeProvider),
        ],
      ),
    ],
  );
}

Widget _buildToggleButton(String text, bool isSelected, VoidCallback onTap, dynamic themeProvider) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 160, // Adjust width to fit in the Stack container
      height: 45, // Height of the button
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent, // Highlight selected button
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: isSelected ? Color(0xffFDFDFD) :themeProvider.isDarkMode?Colors.white: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}


  Widget _buildPlanSelector(dynamic themeProvider) {
    return Column(
      children: [
        Container(
  height: 140,
  width: MediaQuery.of(context).size.width,
  child: ListView.builder(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    itemCount: premiumTypes.length,
    itemBuilder: (BuildContext context, int index, ) {
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
              color:themeProvider.isDarkMode?Colors.transparent: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: isSelected
                  ? Border.all(color:themeProvider.isDarkMode?Color(0xff095DEC): Color(0xff095DEC), width: 2)
                  : Border.all(color:themeProvider.isDarkMode?Color(0xffBFBFBF): Color(0xffBFBFBF), width: 2),
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
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color:themeProvider.isDarkMode?Color(0xFF095DEC): Color(0xFF095DEC),
                        ),
                      ),
                      // Always keep space for the icon, even when not selected
                      SizedBox(
                        width: 24, // Same size as the Icon's width
                        child: isSelected
                            ? Icon(
                              
                                Icons.check_rounded,
                                color:themeProvider.isDarkMode?Color(0xFF095DEC): Color(0xFF095DEC),
                                size: 20,
                              )
                            : SizedBox(), // Empty placeholder when not selected
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    packages[index],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color:themeProvider.isDarkMode?Color(0xffFFFFFF): Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    prices[index],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color:themeProvider.isDarkMode?Colors.white: Color(0xff393939),
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

        SizedBox(height: 10),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: 130,
              width: 300,
              decoration: BoxDecoration(

                color:themeProvider.isDarkMode?Colors.transparent: Colors.white,
                border: Border.all(
                  color:themeProvider.isDarkMode?Color(0xFFBFBFBF): Color(0xFFBFBFBF),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8)),
              ),
            ),
            
            Container(
              margin: const EdgeInsets.only(left: 75, top: 0),
              // padding: const EdgeInsets.only(left: 47, top: 3),
              height: 30,
              width: 150,
              decoration: BoxDecoration(
                color:themeProvider.isDarkMode?Color(0xff020520): Colors.white,
                border: Border.all(
                  color:themeProvider.isDarkMode?Color(0xFFBFBFBF): Color(0xFFBFBFBF),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  "Features",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    color:themeProvider.isDarkMode?Colors.white: Color(0xff505254)
                  ),
                ),
              ),
            ),
            Container(
              color:themeProvider.isDarkMode?Colors.transparent: Colors.white,
              margin: const EdgeInsets.only(left: 30, top: 40),
              child: Text(
                "✓  Lorem Ipsum \n✓  Lorem Ipsum \n✓  Lorem Ipsum  ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color:themeProvider.isDarkMode?Colors.white: Color(0xff393939)
                ),
              ),
             
            ),
            
          ],
        ),
      ],
    );
  }

  Widget _buildTermsText(dynamic themeProvider) {
    return Text.rich(
      TextSpan(
        text:
            "By tapping Continue, you will be charged, your subscription will auto-renew for the same price and package length until you cancel via App Store settings, and you agree to our ",
        style: TextStyle(
          fontSize: 10,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color:themeProvider.isDarkMode?Colors.white: Color(0xff545454)
        ),
        children: [
          TextSpan(
            text: "Terms",
            style: TextStyle(
              fontSize: 10,
          fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color:themeProvider.isDarkMode?Colors.white: Color(0xff545454),
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(text: ".",
          style: TextStyle(
            color:themeProvider.isDarkMode?Colors.white: Color(0xff545454),
          )),
        ],
      ),
    );
  }

  Widget _buildContinueButton(dynamic themeProvider) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor:themeProvider.isDarkMode?Color(0xFF095DEC): Color(0xFF095DEC),
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text(
        "Continue",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color:themeProvider.isDarkMode?Color(0xffFDFDFD): Color(0xffFDFDFD),
        ),
      ),
    );
  }

  Widget _buildFreeTrialText(BuildContext context, dynamic themeProvider) {
    return GestureDetector(
      onTap: () {
        context.pushNamed("call_page");
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 110),
        child: Text(
          "Start Free Trial",
          style: TextStyle(
            color:themeProvider.isDarkMode?Color(0xff095DEC): Color(0xff095DEC),
            fontSize: 16,
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
