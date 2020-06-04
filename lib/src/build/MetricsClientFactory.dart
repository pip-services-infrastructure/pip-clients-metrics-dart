// import 'package:pip_services3_components/pip_services3_components.dart';
// import 'package:pip_services3_commons/pip_services3_commons.dart';

// import '../clients/version1/MetricsNullClientV1.dart';
// import '../clients/version1/MetricsDirectClientV1.dart';
// import '../clients/version1/MetricsHttpClientV1.dart';

// class MetricsClientFactory extends Factory {
//   static final descriptor =
//       Descriptor('pip-services-metrics', 'factory', 'client', 'default', '1.0');
//   static final ClientNullDescriptor =
//       Descriptor('pip-services-metrics', 'client', 'null', '*', '1.0');
//   static final ClientDirectDescriptor =
//       Descriptor('pip-services-metrics', 'client', 'direct', '*', '1.0');
//   static final ClientHttpDescriptor =
//       Descriptor('pip-services-metrics', 'client', 'http', '*', '1.0');

//   MetricsClientFactory() : super() {
//     registerAsType(ClientNullDescriptor, MetricsNullClientV1);
//     registerAsType(ClientDirectDescriptor, MetricsDirectClientV1);
//     registerAsType(ClientHttpDescriptor, MetricsHttpClientV1);
//   }
// }
