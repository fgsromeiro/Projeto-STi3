// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:projeto_sti3/src/modules/report/domain/entities/chart_data.dart';

class Chart {
  final String title;
  final String subTitle;
  final List<ChartData> chartDatas;

  Chart({
    required this.title,
    required this.subTitle,
    required this.chartDatas,
  });
}
