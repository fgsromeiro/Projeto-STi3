import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/item.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/order.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/payment.dart';
import 'package:projeto_sti3/src/modules/order/presentation/provider/order_provider.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/age_group_sales_totals.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/chart.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/chart_data.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/city_sales_totals.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/payment_totals_per_day.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/top_selling_product.dart';
import 'package:projeto_sti3/src/shared/di/dependency_assembly.dart';
import 'package:projeto_sti3/src/shared/extensions/parser_extension_datetime.dart';
import 'package:projeto_sti3/src/shared/extensions/parser_extension_string.dart';
import 'package:projeto_sti3/src/utils/styles.dart';

class ReportProvider extends ChangeNotifier {
  final orderProvider = dependencyAssembly<OrderProvider>();

  final _chartTopProducts = Chart(
    title: 'Top Produtos',
    subTitle: 'Produtos mais vendidos',
    chartDatas: [],
  );
  final _chartTopSales = Chart(
    title: 'Top Vendas',
    subTitle: 'Clientes com maior valor em compras',
    chartDatas: [],
  );
  final _chartOrderStatus = Chart(
    title: 'Pedidos',
    subTitle: 'Pedidos aprovados e cancelados',
    chartDatas: [],
  );

  final List<TopSellingProduct> _topSellingProducts = [];
  List<PaymentTotalsPerDay> _paymentTotalsPerDays = [];
  final List<CitySalesTotals> _citySalesTotals = [];
  final List<AgeGroupSalesTotals> _ageGroupSalesTotals = [];

  Chart get chartTopProducts => _chartTopProducts;
  Chart get chartTopSales => _chartTopSales;
  Chart get chartOrderStatus => _chartOrderStatus;

  List<TopSellingProduct> get topSellingProducts => _topSellingProducts;
  List<PaymentTotalsPerDay> get paymentTotalsPerDays => _paymentTotalsPerDays;
  List<CitySalesTotals> get citySalesTotals => _citySalesTotals;
  List<AgeGroupSalesTotals> get ageGroupSalesTotals => _ageGroupSalesTotals;

  void load() {
    loadChartTopProducts();
    loadChartTopSales();
    loadChartOrderStatus();
    loadTableTopSelling();
    loadTablePaymentTotalsPerDay();
    loadTableCitySalesTotals();
    loadTableAgeGroupSalesTotals();

    notifyListeners();
  }

  void loadChartTopProducts() {
    if (orderProvider.listOfOrder.isEmpty) return;

    Map<String, int> mapProductPerQuantity = {};
    var index = 0;

    for (var order in orderProvider.listOfOrder) {
      for (var item in order.itens) {
        mapProductPerQuantity.update(
          item.title,
          (value) => value + 1,
          ifAbsent: () => 1,
        );
      }
    }
    var sortedByKey = Map.fromEntries(
      mapProductPerQuantity.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value)),
    );

    sortedByKey.forEach(
      (key, value) {
        if (index < 5) {
          _chartTopProducts.chartDatas.add(
            ChartData(
              productName: key,
              value: value,
              valueReal: 0,
              color: AppColors.chartColors[index],
            ),
          );
        }

        index++;
      },
    );
  }

  void loadChartTopSales() {
    if (orderProvider.listOfOrder.isEmpty) return;

    Map<String, double> mapProductPerQuantity = {};

    var index = 0;

    for (var order in orderProvider.listOfOrder) {
      mapProductPerQuantity.update(
        order.client.name,
        (value) => value + order.totalValue,
        ifAbsent: () => order.totalValue,
      );
    }
    var sortedByKey = Map.fromEntries(
      mapProductPerQuantity.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value)),
    );

    sortedByKey.forEach(
      (key, value) {
        if (index < 5) {
          _chartTopSales.chartDatas.add(
            ChartData(
              productName: key,
              valueReal: value,
              value: 0,
              color: AppColors.chartColors[index],
            ),
          );
        }

        index++;
      },
    );
  }

  void loadChartOrderStatus() {
    if (orderProvider.listOfOrder.isEmpty) return;

    Map<String, int> mapProductPerQuantity = {};

    var index = 0;

    for (var order in orderProvider.listOfOrder) {
      mapProductPerQuantity.update(
        order.status,
        (value) => value + 1,
        ifAbsent: () => 1,
      );
    }
    var sortedByKey = Map.fromEntries(
      mapProductPerQuantity.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value)),
    );

    sortedByKey.forEach(
      (key, value) {
        if (index < 5) {
          _chartOrderStatus.chartDatas.add(
            ChartData(
              productName: key,
              valueReal: 0,
              value: value,
              color: AppColors.chartColors[index],
            ),
          );
        }

        index++;
      },
    );
  }

  void loadTableTopSelling() {
    if (orderProvider.listOfOrder.isEmpty) return;

    Map<String, List<Item>> mapperItens = {};

    for (var order in orderProvider.listOfOrder) {
      for (var item in order.itens) {
        mapperItens.update(
          item.title,
          (value) => value..add(item),
          ifAbsent: () => [item],
        );
      }
    }

    mapperItens.forEach(
      (key, value) {
        _topSellingProducts.add(
          TopSellingProduct(
            nameProduct: key,
            quantity: value.length,
            totalValue: value.fold(
              0,
              (total, item) => total + item.unitValue,
            ),
          ),
        );
      },
    );
  }

  void loadTableCitySalesTotals() {
    if (orderProvider.listOfOrder.isEmpty) return;

    Map<String, List<Order>> mapperOrder = {};

    for (var order in orderProvider.listOfOrder) {
      mapperOrder.update(
        order.deliveryAddress.city,
        (value) => value..add(order),
        ifAbsent: () => [order],
      );
    }

    mapperOrder.forEach(
      (key, value) {
        _citySalesTotals.add(
          CitySalesTotals(
            city: key,
            quantityOrders: value.length,
            totalValue:
                value.fold(0, (total, order) => total + order.totalValue),
          ),
        );
      },
    );
  }

  void loadTableAgeGroupSalesTotals() {
    if (orderProvider.listOfOrder.isEmpty) return;

    Map<String, List<Order>> mapperOrder = {};

    for (var order in orderProvider.listOfOrder) {
      mapperOrder.update(
        order.client.dateBirth.toDate().calculateAge(),
        (value) => value..add(order),
        ifAbsent: () => [order],
      );
    }

    mapperOrder.forEach(
      (key, value) {
        _ageGroupSalesTotals.add(
          AgeGroupSalesTotals(
            ageRange: key,
            quantityOrders: value.length,
            totalValue:
                value.fold(0, (total, order) => total + order.totalValue),
          ),
        );
      },
    );
  }

  void loadTablePaymentTotalsPerDay() {
    if (orderProvider.listOfOrder.isEmpty) return;

    Map<String, Payment> mapperPayment = {};
    List<PaymentTotalsPerDay> updatedList = [];

    for (var order in orderProvider.listOfOrder) {
      for (var payment in order.payments) {
        mapperPayment.update(
          order.creationDate,
          (value) => payment,
          ifAbsent: () => payment,
        );
      }
    }

    mapperPayment.forEach(
      (key, value) {
        updatedList.add(
          PaymentTotalsPerDay(
            paymentMethod: value.title,
            orderDate: key,
            value: value.value,
          ),
        );
      },
    );

    _paymentTotalsPerDays = updatedList
      ..sort(
        (a, b) => a.orderDate.compareTo(b.orderDate),
      );
  }
}
