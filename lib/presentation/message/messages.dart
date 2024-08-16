import 'package:flutter/material.dart';
import 'catogory.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate the sizes based on screen width and height
    final appBarIconSize = screenWidth * 0.07;
    final tabBarFontSize = screenWidth * 0.035;
    final titleFontSize = screenWidth * 0.045;
    final verticalSpacing = screenHeight * 0.01;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  // Handle back button tap
                },
                child: Image.asset(
                  'assets/images/rightArrow.png',
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.1,
                ),
              ),
              Text(
                'Messages',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0B8FAC),
                ),
              ),
              Image.asset(
                'assets/images/Frame.png',
                height: 28,
                width: 28,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: verticalSpacing),
            TabBar(
              controller: _tabController,
              isScrollable: true,  // Allows tabs to have a small width difference
              /*indicator: BoxDecoration(),*/ // Removes the default indicator line
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Favorite',
                ),
              ],
            ),
            SizedBox(height: verticalSpacing),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Catagory1(),
                  Catagory1(), // Using the same widget for simplicity
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
