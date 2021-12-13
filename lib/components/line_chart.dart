import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:projectwallet/models/MarketChartData.dart';
import 'package:intl/intl.dart';

class LineCryptoChart extends StatefulWidget {
  final MarketChartData chartData;
  const LineCryptoChart({Key? key, required this.chartData}) : super(key: key);

  @override
  _LineCryptoChartState createState() => _LineCryptoChartState();
}

class _LineCryptoChartState extends State<LineCryptoChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    List<dynamic> prices = widget.chartData.prices;
    List<dynamic> marketCaps = widget.chartData.market_caps;
    List<dynamic> totalVolumes = widget.chartData.total_volumes;

    return Stack(
      children: <Widget>[
        Container(
          //width: 300,
          child: AspectRatio(
            aspectRatio: 1.70,
            child: Container(
              //padding: EdgeInsets.all(18),
              margin: EdgeInsets.only(right: 0, left: 20, top: 20, bottom: 20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                  color: Color(0xff232d37)),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 18.0, left: 12.0, top: 32, bottom: 12),
                child: LineChart(
                  showAvg ? avgData(prices) : mainData(prices),
                ),
              ),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(
                right: 18.0, left: 22.0, top: 20, bottom: 10),
            child: SizedBox(
              width: 60,
              height: 34,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    showAvg = !showAvg;
                  });
                },
                child: Text(
                  'avg',
                  style: TextStyle(
                      fontSize: 12,
                      color: showAvg
                          ? Colors.white.withOpacity(0.5)
                          : Colors.white),
                ),
              ),
            )),
      ],
    );
  }

/* Construct the point list for the chart */
  List<FlSpot> getMarketSpots(List<dynamic> prices) {
    List<FlSpot> mySpots = [];
    prices.asMap().forEach((index, value) {
      mySpots.add(
          FlSpot(index.toDouble(), double.parse(value[1].toStringAsFixed(5))));
    });
    //print(mySpots);
    return mySpots;
  }

  List<double> extractPriceList(prices) {
    List<double> priceList = [];
    for (var currentCouple in prices) {
      priceList.add(currentCouple[1]);
    }
    return priceList;
  }

  List<dynamic> extractTimestampList(prices) {
    List<dynamic> dateList = [];
    for (var currentCouple in prices) {
      dateList.add(currentCouple[0]);
    }
    return dateList;
  }

  List<String> dateToString(List<dynamic> dateList) {
    List<String> dateStringList = [];
    for (var currentDateTimestamp in dateList) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(currentDateTimestamp);
      final DateFormat formatter = DateFormat('dd/MM');
      final String formatted = formatter.format(date);
      //print(formatted); // something like 2013-04-20
      dateStringList.add(formatted);
    }
    return dateStringList;
  }

/* calculate the max y adding percentual to the max value */
  double maxYAxis(List<dynamic> prices) {
    int percentual = 10;
    double maxWithPercentage =
        maxValue(prices) + ((percentual / 100) * maxValue(prices));
    return maxWithPercentage;
  }

  double maxValue(List<dynamic> prices) {
    List<double> priceList = extractPriceList(prices);
    return priceList.reduce(max);
  }

  double minValue(List<dynamic> prices) {
    List<double> priceList = extractPriceList(prices);
    return priceList.reduce(min);
  }

/* calculate the min y decreasing percentual to the min value */
  double minYAxis(List<dynamic> prices) {
    int percentual = 10;
    double minWithPercentage =
        minValue(prices) - ((percentual / 100) * minValue(prices));
    return minWithPercentage > 0 ? minWithPercentage : 0;
  }

  LineChartData mainData(List<dynamic> prices) {
    List<dynamic> timestampList = extractTimestampList(prices);

    List<String> stringDate = dateToString(timestampList);
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            if (value.toInt() % 5 == 1) {
              return stringDate[value.toInt()];
            }
            return '';
          },
          margin: 8,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      //minX: 0,
      //maxX: 11,
      minY: minYAxis(prices),
      maxY: maxYAxis(prices),
      lineBarsData: [
        LineChartBarData(
          spots: getMarketSpots(prices),
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  double calculateAveragePrice(List<double> pricesValue) {
    double sum = 0;
    for (double currentValue in pricesValue) {
      sum = sum + currentValue;
    }
    double avg = sum / pricesValue.length;
    return avg;
  }

  /* Construct the point list for the chart */
  List<FlSpot> getAverageSpots(double avg) {
    List<FlSpot> mySpots = [];
    for (int i = 0; i < 30; i++) {
      mySpots.add(FlSpot(i.toDouble(), avg));
    }
    return mySpots;
  }

  LineChartData avgData(List<dynamic> prices) {
    List<dynamic> timestampList = extractTimestampList(prices);
    List<double> priceList = extractPriceList(prices);
    double avg = calculateAveragePrice(priceList);

    List<String> stringDate = dateToString(timestampList);
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(showTitles: false),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minY: minYAxis(prices),
      maxY: maxYAxis(prices),
      lineBarsData: [
        LineChartBarData(
          spots: getAverageSpots(avg),
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!,
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!,
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
