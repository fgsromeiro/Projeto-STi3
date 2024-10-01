import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/chart.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/chart_data.dart';
import 'package:projeto_sti3/src/modules/report/presentation/provider/report_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportDashboardWidget extends StatefulWidget {
  const ReportDashboardWidget({super.key});

  @override
  State<ReportDashboardWidget> createState() => _ReportDashboardWidgetState();
}

class _ReportDashboardWidgetState extends State<ReportDashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReportProvider>(
        builder: (context, provider, child) => Expanded(
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  _buildChartPie(context, provider.chartTopProducts),
                  _buildChartColumns(context, provider.chartTopSales),
                  _buildChartCartesian(context, provider.chartOrderStatus),
                ],
              ),
            ));
  }

  Widget _buildChartPie(BuildContext context, Chart chartTopProductsData) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              chartTopProductsData.title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Expanded(
              child: SfCircularChart(
                margin: EdgeInsets.zero,
                title: ChartTitle(
                    text: chartTopProductsData.subTitle,
                    alignment: ChartAlignment.center,
                    textStyle: const TextStyle(
                      fontSize: 10,
                    )),
                legend: const Legend(
                    height: '20',
                    width: '500',
                    isVisible: true,
                    position: LegendPosition.bottom,
                    overflowMode: LegendItemOverflowMode.wrap,
                    alignment: ChartAlignment.near,
                    itemPadding: 6,
                    padding: 5,
                    iconHeight: 18,
                    textStyle: TextStyle(fontSize: 10),
                    iconWidth: 10),
                series: <PieSeries<ChartData, String>>[
                  PieSeries<ChartData, String>(
                    legendIconType: LegendIconType.rectangle,
                    dataSource: chartTopProductsData.chartDatas,
                    xValueMapper: (ChartData data, _) => data.productName,
                    yValueMapper: (ChartData data, _) => data.value,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside,
                    ),
                    pointColorMapper: (datum, index) => datum.color,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartColumns(BuildContext context, Chart chartTopSalesData) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              chartTopSalesData.title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Expanded(
              child: SfCartesianChart(
                margin: EdgeInsets.zero,
                title: ChartTitle(
                  text: chartTopSalesData.subTitle,
                  alignment: ChartAlignment.center,
                  textStyle: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                primaryXAxis: CategoryAxis(
                    majorGridLines: const MajorGridLines(
                      width: 0,
                    ),
                    majorTickLines: const MajorTickLines(
                      width: 0,
                    ),
                    axisLabelFormatter: (axisLabelRenderArgs) {
                      if (axisLabelRenderArgs.value == 2) {
                        return ChartAxisLabel(
                          'Vendas/Cliente',
                          const TextStyle(),
                        );
                      }
                      return ChartAxisLabel(
                        '',
                        const TextStyle(),
                      );
                    }),
                primaryYAxis: const NumericAxis(
                  majorGridLines: MajorGridLines(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                  minimum: 0,
                  maximum: 3000,
                  interval: 500,
                ),
                legend: const Legend(
                  height: '20',
                  width: '500',
                  isVisible: true,
                  position: LegendPosition.bottom,
                  overflowMode: LegendItemOverflowMode.wrap,
                  alignment: ChartAlignment.near,
                  itemPadding: 6,
                  padding: 50,
                  iconHeight: 18,
                  textStyle: TextStyle(fontSize: 10),
                  iconWidth: 10,
                ),
                series: [
                  ColumnSeries<ChartData, String>(
                    dataSource: chartTopSalesData.chartDatas,
                    xValueMapper: (ChartData data, _) => data.productName,
                    yValueMapper: (ChartData data, _) => data.valueReal,
                    enableTooltip: false,
                    isTrackVisible: false,
                    isVisibleInLegend: false,
                    dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.inside),
                    width: 1,
                    pointColorMapper: (datum, index) => datum.color,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartCartesian(
      BuildContext context, Chart chartOrderStatusData) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              chartOrderStatusData.title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Expanded(
              child: SfCartesianChart(
                margin: EdgeInsets.zero,
                title: ChartTitle(
                    text: chartOrderStatusData.subTitle,
                    alignment: ChartAlignment.center,
                    textStyle: const TextStyle(
                      fontSize: 10,
                    )),
                primaryXAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(
                    width: 0,
                  ),
                  axisLabelFormatter: (axisLabelRenderArgs) {
                    if (axisLabelRenderArgs.value == 0) {
                      return ChartAxisLabel(
                        'Cancelados',
                        const TextStyle(),
                      );
                    }
                    return ChartAxisLabel(
                      'Aprovados',
                      const TextStyle(),
                    );
                  },
                ),
                primaryYAxis: const NumericAxis(
                  majorGridLines: MajorGridLines(
                    width: 0,
                  ),
                  minimum: 0,
                  maximum: 9,
                  interval: 1,
                ),
                series: [
                  BarSeries<ChartData, String>(
                    dataSource: chartOrderStatusData.chartDatas,
                    xValueMapper: (ChartData data, _) => data.productName,
                    yValueMapper: (ChartData data, _) => data.value,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    pointColorMapper: (datum, index) => datum.color,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
