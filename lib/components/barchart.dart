import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(8),
        child: BarChart(
          BarChartData(barGroups: [
            BarChartGroupData(x: 0, barRods: [
              BarChartRodData(
                  y: 10,
                  colors: [Colors.purple, Colors.purple],
                  width: 30,
                  borderRadius: BorderRadius.circular(24),
                  backDrawRodData: BackgroundBarChartRodData(y:30,colors: [Colors.purpleAccent[100], Colors.purpleAccent[100]],show: true)

              ),
            ]),
            BarChartGroupData(x: 10, barRods: [
              BarChartRodData(
                  y: 20,
                  colors: [Colors.purple, Colors.purple],
                  width: 30,
                  borderRadius: BorderRadius.circular(24),
                  backDrawRodData: BackgroundBarChartRodData(y:30,colors: [Colors.purpleAccent[100], Colors.purpleAccent[100]],show: true)

              ),
            ]),
            BarChartGroupData(x: 20, barRods: [
              BarChartRodData(
                  y: 5,
                  colors: [Colors.purple, Colors.purple],
                  width: 30,
                  borderRadius: BorderRadius.circular(24),
                  backDrawRodData: BackgroundBarChartRodData(y:30,colors: [Colors.purpleAccent[100], Colors.purpleAccent[100]],show: true)

              ),
            ]),
            BarChartGroupData(x: 30, barRods: [
              BarChartRodData(
                  y: 25,
                  colors: [Colors.purple, Colors.purple],
                  width: 30,
                  borderRadius: BorderRadius.circular(24),
                  backDrawRodData: BackgroundBarChartRodData(y:30,colors: [Colors.purpleAccent[100], Colors.purpleAccent[100]],show: true)

              ),
            ]),
            BarChartGroupData(x: 10, barRods: [
              BarChartRodData(
                  y: 20,
                  colors: [Colors.purple, Colors.purple],
                  width: 30,
                  borderRadius: BorderRadius.circular(24),
                  backDrawRodData: BackgroundBarChartRodData(y:30,colors: [Colors.purpleAccent[100], Colors.purpleAccent[100]],show: true)

              ),
            ]),
            BarChartGroupData(x: 20, barRods: [
              BarChartRodData(
                  y: 5,
                  colors: [Colors.purple, Colors.purple],
                  width: 30,
                  borderRadius: BorderRadius.circular(24),
                  backDrawRodData: BackgroundBarChartRodData(y:30,colors: [Colors.purpleAccent[100], Colors.purpleAccent[100]],show: true)

              ),
            ]),
            BarChartGroupData(x: 30, barRods: [
              BarChartRodData(
                  y: 25,
                  colors: [Colors.purple, Colors.purple],
                  width: 30,
                  borderRadius: BorderRadius.circular(24),
                  backDrawRodData: BackgroundBarChartRodData(y:30,colors: [Colors.purpleAccent[100], Colors.purpleAccent[100]],show: true)

              ),
            ]),
          ],
              rangeAnnotations: RangeAnnotations(horizontalRangeAnnotations: [HorizontalRangeAnnotation(y1:0,y2:0,color: Colors.yellow),],verticalRangeAnnotations: []),
              alignment: BarChartAlignment.spaceEvenly,
              groupsSpace: 20,
              backgroundColor: Colors.transparent,
              borderData: FlBorderData(show: false),

              titlesData: FlTitlesData(show: true,leftTitles: SideTitles(showTitles: false))
          ),

        ),
      ),
    );
  }
}

