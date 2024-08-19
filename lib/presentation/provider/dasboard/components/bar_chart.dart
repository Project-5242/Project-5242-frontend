// import 'package:flutter/material.dart';
// import 'package:flutter_project/base/base.dart';

// class BarChartView extends StatelessWidget {
//   const BarChartView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8.0),
//       child: charts.BarChart(),
//     );
//   }

//   static List<charts.Series<Data, String>> _sampleData() {
//     final sample = [
//       Data('Jan', 400),
//       Data('Feb', 800),
//       Data('Mar', 600),
//       Data('Apr', 700),
//       Data('May', 1000),
//     ];
//     return [
//       charts.Series<Data, String>(
//           id: 'Data',
//           domainFn: (Data data, _) => data.month,
//           messureFn: (Data data, _) => data.y,
//           data: sample,
//           colorFn: AppColors.themeColor),
//     ];
//   }
// }

// class Data {
//   final String month;
//   int y;

//   Data(this.month, this.y);
// }
