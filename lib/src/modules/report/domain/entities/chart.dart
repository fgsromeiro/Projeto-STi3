// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/chart_data.dart';

class Chart extends Equatable {
  final String title;
  final String subTitle;
  final List<ChartData> chartDatas;

  const Chart({
    required this.title,
    required this.subTitle,
    required this.chartDatas,
  });

  @override
  List<Object> get props => [title, subTitle, chartDatas];
}
