import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';

import '../../../../data/constants/app_colors.dart';

class BarChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Set the background to white
      padding: const EdgeInsets.all(16.0),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 1000,
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  borderRadius: BorderRadius.zero,
                  toY: 400,
                  color: AppColors.themeColor,
                  width: MediaQuery.of(context).size.width * 0.046,
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  borderRadius: BorderRadius.zero,
                  toY: 800,
                  color: AppColors.themeColor,
                  width: MediaQuery.of(context).size.width * 0.046,
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  borderRadius: BorderRadius.zero,
                  toY: 600,
                  color: AppColors.themeColor,
                  width: MediaQuery.of(context).size.width * 0.046,
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  borderRadius: BorderRadius.zero,
                  toY: 400,
                  color: AppColors.themeColor,
                  width: MediaQuery.of(context).size.width * 0.046,
                ),
              ],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(
                  borderRadius: BorderRadius.zero,
                  toY: 200,
                  color: AppColors.themeColor,
                  width: MediaQuery.of(context).size.width * 0.046,
                ),
              ],
            ),
          ],
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return Text('Jan',
                          style: context.customFont('Open Sans', 12.0,
                              FontWeight.w400, AppColors.black));
                    case 1:
                      return Text('Feb',
                          style: context.customFont('Open Sans', 12.0,
                              FontWeight.w400, AppColors.black));
                    case 2:
                      return Text('Mar',
                          style: context.customFont('Open Sans', 12.0,
                              FontWeight.w400, AppColors.black));
                    case 3:
                      return Text('Apr');
                    case 4:
                      return Text('May');
                    default:
                      return Text('');
                  }
                },
                reservedSize: 28,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 200,
                getTitlesWidget: (value, meta) {
                  return Text(value.toInt().toString(),
                      style: context.customFont(
                          'Open Sans', 12.0, FontWeight.w400, AppColors.black));
                },
                reservedSize: 40,
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: const FlGridData(show: false), // Hide the grid lines
          borderData: FlBorderData(
            show: false,
          ),
        ),
      ),
    );
  }
}
