import 'dart:async';

import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';
import 'package:pip_services_metrics/pip_services_metrics.dart';

import './IMetricsClientV1.dart';

class MetricsDirectClientV1 extends DirectClient implements IMetricsClientV1 {
  MetricsDirectClientV1() : super() {
    dependencyResolver.put('controller',
        Descriptor('pip-services-metrics', 'controller', '*', '*', '*'));
  }

  @override
  Future<List<MetricDefinitionV1>> getMetricDefinitions(
      String correlationId) async {
    var timing = instrument(correlationId, 'metrics.get_metric_definitions');
    var items = await controller.getMetricDefinitions(correlationId);
    timing.endTiming();
    return items;
  }

  @override
  Future<MetricDefinitionV1> getMetricDefinitionByName(
      String correlationId, String name) async {
    var timing =
        instrument(correlationId, 'metrics.get_metric_definition_by_name');
    var item = await controller.getMetricDefinitionByName(correlationId, name);
    timing.endTiming();
    return item;
  }

  @override
  Future<DataPage<MetricValueSetV1>> getMetricsByFilter(
      String correlationId, FilterParams filter, PagingParams paging) async {
    filter = filter ?? FilterParams();
    paging = paging ?? PagingParams();

    var timing = instrument(correlationId, 'metrics.get_metrics_by_filter');
    var page =
        await controller.getMetricsByFilter(correlationId, filter, paging);
    timing.endTiming();
    return page;
  }

  @override
  Future updateMetric(
      String correlationId, MetricUpdateV1 update, int maxTimeHorizon) async {
    var timing = instrument(correlationId, 'metrics.update_metric');
    controller.updateMetric(correlationId, update, maxTimeHorizon);
    timing.endTiming();
  }

  @override
  Future updateMetrics(String correlationId, List<MetricUpdateV1> updates,
      int maxTimeHorizon) async {
    var timing = instrument(correlationId, 'metrics.update_metrics');
    controller.updateMetrics(correlationId, updates, maxTimeHorizon);
    timing.endTiming();
  }
}
