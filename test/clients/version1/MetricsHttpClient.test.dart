import 'package:test/test.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import 'package:pip_services_metrics/pip_services_metrics.dart';
import 'package:pip_clients_metrics/pip_clients_metrics.dart';

import './MetricsClientV1Fixture.dart';

void main() {
  group('MetricsHttpClientV1', () {
    MetricsMemoryPersistence persistence;
    MetricsController controller;
    MetricsHttpServiceV1 service;
    MetricsHttpClientV1 client;
    MetricsClientV1Fixture fixture;

    setUp(() async {
      persistence = MetricsMemoryPersistence();
      persistence.configure(ConfigParams());

      controller = MetricsController();
      controller.configure(ConfigParams());

      var httpConfig = ConfigParams.fromTuples([
        'connection.protocol',
        'http',
        'connection.port',
        3000,
        'connection.host',
        'localhost'
      ]);

      service = MetricsHttpServiceV1();
      service.configure(httpConfig);

      client = MetricsHttpClientV1();
      client.configure(httpConfig);

      var references = References.fromTuples([
        Descriptor(
            'pip-services-metrics', 'persistence', 'memory', 'default', '1.0'),
        persistence,
        Descriptor(
            'pip-services-metrics', 'controller', 'default', 'default', '1.0'),
        controller,
        Descriptor('pip-services-metrics', 'service', 'http', 'default', '1.0'),
        service,
        Descriptor('pip-services-metrics', 'client', 'http', 'default', '1.0'),
        client
      ]);
      controller.setReferences(references);
      service.setReferences(references);
      client.setReferences(references);

      fixture = MetricsClientV1Fixture(client);

      await persistence.open(null);

      await service.open(null);
      await client.open(
        null,
      );
    });

    tearDown(() async {
      await client.close(null);
      await service.close(null);
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
