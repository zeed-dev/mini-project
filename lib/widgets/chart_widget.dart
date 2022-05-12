import 'dart:developer';

import 'package:covid_app/models/vaccine.dart';
import 'package:covid_app/view_models/vaccine_view_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _BarChart extends StatefulWidget {
  const _BarChart({Key? key}) : super(key: key);

  @override
  State<_BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<_BarChart> {
  List<VaccineDetail> getCarts(List<VaccineModel> vaccineModels) {
    log("VACIN MODEL ${vaccineModels.length}");
    List<VaccineDetail> vaccineDetail = [];
    for (VaccineModel vaccineModels in vaccineModels) {
      for (VaccineDetail vaccineDetails in vaccineModels.detail ?? []) {
        vaccineDetail.add(vaccineDetails);
      }
    }
    log("vaccineDetail: ${vaccineDetail.length}");
    return vaccineDetail;
  }

  int index = -1;

  @override
  Widget build(BuildContext context) {
    VaccineViewModel _vaccineViewModel = Provider.of<VaccineViewModel>(context);
    List<VaccineDetail> vaccineDetails =
        getCarts(_vaccineViewModel.vaccine ?? []);

    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: vaccineDetails.map((e) {
          index++;

          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: e.divaksin1!.toDouble(),
                gradient: _barsGradient,
              )
            ],
            showingTooltipIndicators: [0],
          );
        }).toList(),
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Vaks 1';
        break;
      case 1:
        text = 'Vaks 2';
        break;
      case 2:
        text = 'Btl Vaks 1';
        break;
      case 3:
        text = 'Btl Vaks 2';
        break;
      case 4:
        text = 'Pdg Vaks 1';
        break;
      case 5:
        text = 'Pdg Vaks 2';
        break;
      default:
        text = '';
        break;
    }
    return Center(
        child: Text(
      text,
      style: style,
      textAlign: TextAlign.center,
    ));
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: (value, meta) {
              return getTitles(value, meta);
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  final _barsGradient = const LinearGradient(
    colors: [
      Colors.lightBlueAccent,
      Colors.greenAccent,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 8,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: 14,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 15,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 13,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

class BarCharts extends StatefulWidget {
  const BarCharts({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartsState();
}

class BarChartsState extends State<BarCharts> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xff2c4260),
        child: const _BarChart(),
      ),
    );
  }
}
