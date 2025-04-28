import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lenat_ui_kit/market/market_screen.dart';
import 'package:lenat_ui_kit/media/media_screen.dart';
import 'package:lenat_ui_kit/profile/profile_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text('Home Page')),
    MediaPage(),
    Center(child: Text('Consult Page')),
    MarketPage(),
    ProfilePage(),
  ];

  final List<IconData> _icons = [
    HugeIcons.strokeRoundedHome04,
    HugeIcons.strokeRoundedAlbum02,
    HugeIcons.strokeRoundedStethoscope02,
    HugeIcons.strokeRoundedStore01,
    HugeIcons.strokeRoundedUserSquare,
  ];

  final List<String> _labels = [
    "ዋና ገፅ",
    "ሚዲያ",
    "ኮንሰልት",
    "ገበያ",
    "ፕሮፋይል",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Stack(
        children: [
          Positioned.fill(
            child: _pages[_selectedIndex],
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(_icons.length, (index) {
                    final isSelected = _selectedIndex == index;
                    return GestureDetector(
                      onTap: () => _onItemTapped(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: isSelected
                            ? BoxDecoration(
                                color: const Color(0xFFEAF2FB),
                                borderRadius: BorderRadius.circular(12),
                              )
                            : null,
                        child: Row(
                          children: [
                            HugeIcon(
                              icon: _icons[index],
                              color: isSelected ? Colors.blue : Colors.black,
                              size: 24.0,
                            ),
                            if (isSelected) ...[
                              const SizedBox(width: 6),
                              Text(
                                _labels[index],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'NotoSansEthiopic',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
