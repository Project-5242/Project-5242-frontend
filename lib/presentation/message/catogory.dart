import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Catagory1 extends StatelessWidget {
  const Catagory1({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      children: const [
        CustomizeListTile(
          image: 'assets/images/person.png',
          title: 'Jason Jones',
          subTitle: 'Thanks, Ajay! We look forward to it as...',
          time: '5 mins ago',
        ),
        SizedBox(height: 20),
        CustomizeListTile(
          image: 'assets/images/girl.png',
          title: 'Anne Jones',
          subTitle: 'Thanks, Ajay! We look forward to it as...',
          time: '5 mins ago',
        ),
        SizedBox(height: 20),
        CustomizeListTile(
          image: 'assets/images/person.png',
          title: 'Jason Jones',
          subTitle: 'Thanks, Ajay! We look forward to it as...',
          time: '5 mins ago',
        ),
        SizedBox(height: 20),
        CustomizeListTile(
          image: 'assets/images/girl.png',
          title: 'Anne Jones',
          subTitle: 'Thanks, Ajay! We look forward to it as...',
          time: '5 mins ago',
        ),
        SizedBox(height: 20),
        CustomizeListTile(
          image: 'assets/images/person.png',
          title: 'Jason Jones',
          subTitle: 'Thanks, Ajay! We look forward to it as...',
          time: '5 mins ago',
        ),
      ],
    );
  }
}

class CustomizeListTile extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final String time;

  const CustomizeListTile({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(
            image,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
