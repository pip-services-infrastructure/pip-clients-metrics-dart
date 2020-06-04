import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services_metrics/pip_services_metrics.dart';

/// The client interface of package:pip_services3_metrics service
abstract class IMetricsClientV1 {
    /// Gets the metric definitions.
    /// correlationId The correlation identifier.
   Future<List<MetricDefinitionV1>> getMetricDefinitions(String correlationId);

    /// Gets the metric definition by name 
    /// correlationId The correlation identifier.
    /// name The name.
   Future<MetricDefinitionV1> getMetricDefinitionByName(String correlationId, String name);

    /// Gets the metrics by filter asynchronous
    /// correlationId The correlation identifier.
    /// filterThe filter.
    /// pagingThe paging.
   Future<DataPage<MetricValueSetV1>> getMetricsByFilter(String correlationId, FilterParams filter , PagingParams paging);

    /// Updates the metric asynchronous
    /// correlationId The correlation identifier.
    /// updateThe update.
    /// maxTimeHorizon  The maximum time horizon.
    Future updateMetric(String correlationId, MetricUpdateV1 update, int maxTimeHorizon);

    /// Updates the metrics asynchronous
    /// correlationId The correlation identifier.
    /// updatesThe updates.
    /// maxTimeHorizon The maximum time horizon.
    Future updateMetrics(String correlationId, List<MetricUpdateV1> updates, int maxTimeHorizon);
}
