import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services_metrics/pip_services_metrics.dart';
import './IMetricsClientV1.dart';

class MetricsNullClientV1 implements IMetricsClientV1 {
  @override
  Future<List<MetricDefinitionV1>> getMetricDefinitions(
      String correlationId) async {
    return null;
  }

  @override
  Future<MetricDefinitionV1> getMetricDefinitionByName(
      String correlationId, String name) async {
    return null;
  }

  @override
  Future<DataPage<MetricValueSetV1>> getMetricsByFilter(
      String correlationId, FilterParams filter, PagingParams paging) async {
    return DataPage<MetricValueSetV1>(<MetricValueSetV1>[], 0);
  }

  @override
  Future updateMetric(
      String correlationId, MetricUpdateV1 update, int maxTimeHorizon) async {
    return null;
  }

  @override
  Future updateMetrics(String correlationId, List<MetricUpdateV1> updates,
      int maxTimeHorizon) async {
    return null;
  }
}
