import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_aqtech/features/employee_management/controllers/employee_controller.dart';
import 'package:hrm_aqtech/features/over_time_management/controllers/over_time_controller.dart';
import 'package:hrm_aqtech/utils/constants/colors.dart';

class OvertimeWorkChart extends StatelessWidget {
  const OvertimeWorkChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OverTimeController());
    final employeeController = Get.put(EmployeeController());

    final data = controller.memberOvertimeHours.entries.toList();
    double calculateBarWidth(int numberOfBars) {
      const double maxWidth = 40.0;
      const double minWidth = 10.0;
      final double chartWidth = MediaQuery.of(context).size.width - 60.0;
      final double width = (chartWidth / numberOfBars) - 8.0;
      return width.clamp(minWidth, maxWidth);
    }

    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
      child: Column(
        children: [
          const SizedBox(height: 32),
          const Text(
            'Biểu đồ thống kê giờ làm thêm',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 400,
            child: data.isEmpty
                ? Container() // Handle empty data
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
                                      .getEmployeeNameById(memberId) ??
                                  'Unknown';
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: SizedBox(
                                  width: 40.0, // Fixed width for label
                                  child: Text(
                                    employeeName,
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
                              if ((value + 1) % 0.5 == 0) {
                                return Text(
                                  value.toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
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
                        final totalHours = entry.value.value;

                        return BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              toY: totalHours,
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
                            final memberId = data[group.x.toInt()].key;
                            final employeeName = employeeController
                                    .getEmployeeNameById(memberId) ??
                                'Unknown';
                            return BarTooltipItem(
                              '$employeeName\n',
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${rod.toY.toString()} giờ',
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
          ),
        ],
      ),
    );
  }
}
