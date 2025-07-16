import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportTab extends StatelessWidget {
  const ReportTab({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Activity Summary',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colors.primary,
            ),
          ),
          const SizedBox(height: 16),

          // Chart
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                        return Text(days[value.toInt()]);
                      },
                      reservedSize: 24,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                barGroups: [
                  BarChartGroupData(x: 0, barRods: [
                    BarChartRodData(toY: 5, color: colors.primary)
                  ]),
                  BarChartGroupData(x: 1, barRods: [
                    BarChartRodData(toY: 6.5, color: colors.primary)
                  ]),
                  BarChartGroupData(x: 2, barRods: [
                    BarChartRodData(toY: 4, color: colors.primary)
                  ]),
                  BarChartGroupData(x: 3, barRods: [
                    BarChartRodData(toY: 7, color: colors.primary)
                  ]),
                  BarChartGroupData(x: 4, barRods: [
                    BarChartRodData(toY: 5.5, color: colors.primary)
                  ]),
                  BarChartGroupData(x: 5, barRods: [
                    BarChartRodData(toY: 3, color: colors.primary)
                  ]),
                  BarChartGroupData(x: 6, barRods: [
                    BarChartRodData(toY: 4.5, color: colors.primary)
                  ]),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Monthly Summary
          // Monthly Summary
          Text(
            'Monthly Summary',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: colors.primary,
            ),
          ),
          const SizedBox(height: 12),

// Summary Container
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    _SummaryTile(
                      icon: Icons.fitness_center,
                      label: 'Workouts',
                      value: '18',
                    ),
                    _SummaryTile(
                      icon: Icons.timer,
                      label: 'Time',
                      value: '12h 30min',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    _SummaryTile(
                      icon: Icons.local_fire_department,
                      label: 'Calories',
                      value: '3,800 kcal',
                    ),
                    _SummaryTile(
                      icon: Icons.directions_walk,
                      label: 'Steps',
                      value: '85,000',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Top Activity: Running 🏃',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'You improved consistency by 20% compared to last month. Great progress!',
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Performance Insight
          Text(
            'Performance Insights',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: colors.primary,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colors.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'You’ve improved your workout consistency by 20% compared to last week! Keep it up!',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _SummaryTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: colors.surfaceVariant,
          child: Icon(icon, color: colors.primary, size: 18),
          radius: 20,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(fontSize: 13, color: Colors.black54)),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
