// widgets/DayOff_days_chart.dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_aqtech/features/employee_management/controllers/employee_controller.dart';
import 'package:hrm_aqtech/features/leave_day_management/controllers/leave_day_controller.dart';
import 'package:hrm_aqtech/utils/constants/colors.dart';

class LeaveDayChart extends StatelessWidget {
  const LeaveDayChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LeaveDayController());
    final employeeController = Get.put(EmployeeController());
    final data = controller.memberLeaveDays.entries.toList();
    double calculateBarWidth(int numberOfBars) {
      const double maxWidth = 40.0;
      const double minWidth = 10.0;
      final double chartWidth = MediaQuery.of(context).size.width - 60.0;
      final double width = (chartWidth / numberOfBars) - 8.0;
      return width.clamp(minWidth, maxWidth);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 32),
          const Text(
            'Biểu đồ thống kê ngày nghỉ phép',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 400,
            child: data.isEmpty
                ? const Center(
                    child: Text('No data available')) // Handle empty data
                : BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      gridData: const FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 80,
                            getTitlesWidget: (value, meta) {
                              final memberId = data[value.toInt()]
                                  .key; // Correctly reference the memberId
                              final employeeName = employeeController
                                  .getEmployeeNameById(memberId);

                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: SizedBox(
                                  width:
                                      40, // Set a fixed width to control wrapping
                                  child: Text(
                                    '$employeeName',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                    overflow:
                                        TextOverflow.visible, // Allow wrapping
                                    maxLines: 5, // Limit to two lines
                                    softWrap: true, // Enable wrapping
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toStringAsFixed(
                                    1), // Ensure two decimal places
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                          color: const Color(0xff37434d),
                          width: 1,
                        ),
                      ),
                      barGroups: data.asMap().entries.map((entry) {
                        final index = entry.key;
                        final totalDays = entry.value.value;

                        return BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              toY: totalDays, // Adjusted for height
                              color: MyColors.primaryColor,
                              width: calculateBarWidth(data.length),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ],
                        );
                      }).toList(),
                      barTouchData: BarTouchData(
                        enabled: true,
                        touchTooltipData: BarTouchTooltipData(
                          tooltipPadding: const EdgeInsets.all(8),
                          tooltipMargin: 8,
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            final memberId = data[group.x.toInt()]
                                .key; // Correctly reference the memberId
                            final employeeName = employeeController
                                .getEmployeeNameById(memberId);
                            return BarTooltipItem(
                              '$employeeName\n', // Customize header
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      '${rod.toY.toString()} ngày', // Format value
                                  style: const TextStyle(
                                    color: Colors.yellowAccent,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
