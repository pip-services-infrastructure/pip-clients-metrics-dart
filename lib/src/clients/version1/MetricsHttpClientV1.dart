import 'dart:async';
import 'dart:convert';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';
import 'package:pip_services_metrics/pip_services_metrics.dart';

import './IMetricsClientV1.dart';

class MetricsHttpClientV1 extends CommandableHttpClient
    implements IMetricsClientV1 {
  MetricsHttpClientV1() : super('v1/metrics');

  @override
  Future<List<MetricDefinitionV1>> getMetricDefinitions(
      String correlationId) async {
    var result = await callCommand('get_metric_definitions', correlationId, {});
    if (result == null) {
      return <MetricDefinitionV1>[];
    }

    return List<MetricDefinitionV1>.from(
        json.decode(result).map((item) => MetricDefinitionV1.fromJson(item)));
  }

  @override
  Future<MetricDefinitionV1> getMetricDefinitionByName(
      String correlationId, String name) async {
    var result = await callCommand(
        'get_metric_definition_by_name', correlationId, {'name': name});

    if (result == null) {
      return null;
    }

    return MetricDefinitionV1.fromJson(json.decode(result));
  }

  @override
  Future<DataPage<MetricValueSetV1>> getMetricsByFilter(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var result = await callCommand('get_metrics_by_filter', correlationId, {
      'filter': filter ?? FilterParams(),
      'paging': paging ?? PagingParams()
    });
    if (result == null) {
      return DataPage<MetricValueSetV1>(<MetricValueSetV1>[], 0);
    }
    return DataPage<MetricValueSetV1>.fromJson(
        json.decode(result), (item) => MetricValueSetV1.fromJson(item));
  }

  @override
  Future updateMetric(
      String correlationId, MetricUpdateV1 update, int maxTimeHorizon) async {
    await callCommand('update_metric', correlationId,
        {'update': update, 'max_time_horizon': maxTimeHorizon});
  }

  @override
  Future updateMetrics(String correlationId, List<MetricUpdateV1> updates,
      int maxTimeHorizon) async {
    await callCommand('update_metrics', correlationId,
        {'updates': updates, 'max_time_horizon': maxTimeHorizon});
  }
}
