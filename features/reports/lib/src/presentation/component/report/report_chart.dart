import 'dart:math';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:preferences/preferences.dart';
import 'package:reports/report.dart';

class ReportChart extends StatelessWidget {
  const ReportChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionMeditationBloc, SessionMeditationState>(
      buildWhen: (previous, current) => current is SessionMeditationLoadedState,
      builder: (context, state) {
        if (state is SessionMeditationLoadedState) {
          final listSessionMeditation = state.listSessionMeditationDTO;

          return Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 35.0, left: 20.0, top: 35, bottom: 10),
                  child: LineChart(
                    mainData(data: listSessionMeditation),
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                height: 34,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    S.current.min,
                    style: CustomTextStyle.BODY_12.apply(color: Colors.black54),
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = CustomTextStyle.BODY_12.apply(color: Colors.black54);
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day - (6 - value.toInt()));
    final dateFormat = DateFormat('MMM dd');

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 15.0,
      child: Text(
        dateFormat.format(date),
        style: style,
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = CustomTextStyle.BODY_12.apply(color: Colors.black54);

    if (value.toInt() % 5 != 0) {
      return const SizedBox.shrink();
    }

    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 3,
        child: Text(
          value.toInt().toString(),
          style: style,
        ));
  }

  LineChartData mainData({required List<SessionDurationDTO> data}) {
    final now = DateTime.now();
    List<FlSpot> listFlSpot = [];

    final maxValue = data.isEmpty
        ? 26
        : max(data.map((e) => e.duration).reduce(max) + 6, 26);

    for (int index = 0; index <= 6; index++) {
      final date = DateTime(now.year, now.month, now.day - index);
      final dateOfDate =
          data.firstWhereOrNull((element) => element.createdAt.isSamDate(date));

      listFlSpot.add(
          FlSpot((6 - index).toDouble(), dateOfDate?.duration.toDouble() ?? 0));
    }

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: true,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 60,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 20,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: maxValue.toDouble(),
      lineBarsData: [
        LineChartBarData(
            spots: listFlSpot,
            color: StaticColors.active_duration,
            barWidth: 1,
            belowBarData:
                BarAreaData(show: true, color: Colors.white.withOpacity(0.35)),
            isStrokeCapRound: true,
            dotData: FlDotData(
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 3.5,
                  color: StaticColors.active_duration,
                );
              },
              show: true,
            )),
      ],
    );
  }
}

extension DateTimeExt on DateTime {
  bool isSamDate(DateTime date) {
    return date.year == year && date.month == month && date.day == day;
  }
}
