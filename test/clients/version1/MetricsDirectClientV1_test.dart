import 'package:test/test.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import 'package:pip_services_metrics/pip_services_metrics.dart';
import 'package:pip_clients_metrics/pip_clients_metrics.dart';

import './MetricsClientV1Fixture.dart';

void main() {
  group('MetricsDirectClientV1', () {
    MetricsMemoryPersistence persistence;
    MetricsController controller;
    MetricsDirectClientV1 client;
    MetricsClientV1Fixture fixture;

    setUp(() async {
      persistence = MetricsMemoryPersistence();
      persistence.configure(ConfigParams());

      controller = MetricsController();
      controller.configure(ConfigParams());

      client = MetricsDirectClientV1();

      var references = References.fromTuples([
        Descriptor(
            'pip-services-metrics', 'persistence', 'memory', 'default', '1.0'),
        persistence,
        Descriptor(
            'pip-services-metrics', 'controller', 'default', 'default', '1.0'),
        controller,
        Descriptor(
            'pip-services-metrics', 'client', 'direct', 'default', '1.0'),
        client
      ]);

      controller.setReferences(references);
      client.setReferences(references);

      fixture = MetricsClientV1Fixture(client);

      await persistence.open(null);
    });

    tearDown(() async {
      await persistence.close(
        null,
      );
    });

    test('Metrics CRUD Operations', () async {
      await fixture.testMetrics();
    });

    test('Metrics definitions', () async {
      await fixture.testDefinitions();
    });
  });
}
