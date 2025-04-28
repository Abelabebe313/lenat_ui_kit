import 'package:flutter/material.dart';
import 'package:lenat_ui_kit/common/colors.dart';
import 'package:lenat_ui_kit/signup/complete_profile.dart';

class GenderSelectionPage extends StatefulWidget {
  const GenderSelectionPage({super.key});

  @override
  State<GenderSelectionPage> createState() => _GenderSelectionPageState();
}

class _GenderSelectionPageState extends State<GenderSelectionPage> {
  String selectedGender = "female";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "ወደ ኋላ ይመለሱ",
          style: TextStyle(
            fontFamily: 'NotoSansEthiopic',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            const Text(
              "Choose Gender",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoSansEthiopic',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Lorem ipsum dolor sit amet consectetur. Mauris sagittis risus eget adipiscing. Auctor.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 30),

            /// Gender selector cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                genderCard(
                  label: "Female",
                  value: "female",
                  imagePath: "assets/images/female.png",
                ),
                genderCard(
                  label: "Male",
                  value: "male",
                  imagePath: "assets/images/male.png",
                ),
              ],
            ),

            const Spacer(),

            /// Continue button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileSetupPage(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 12,
                ),
              ),
              child: Text(
                "ጉዞዎን ይጀምሩ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontFamily: 'NotoSansEthiopic',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget genderCard({
    required String label,
    required String value,
    required String imagePath,
  }) {
    final bool isSelected = selectedGender == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = value;
        });
      },
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imagePath),
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'NotoSansEthiopic',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                if (isSelected)
                  const Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child:
                        Icon(Icons.check_circle, color: Colors.white, size: 18),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
