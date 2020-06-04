
// import { ConfigParams } from 'package:pip_services3_commons-node';
// import { Descriptor } from 'package:pip_services3_commons-node';
// import { References } from 'package:pip_services3_commons-node';

// import { MetricsMemoryPersistence } from 'pip-services-metrics-node';
// import { MetricsController } from 'pip-services-metrics-node';
// import { MetricsMongoDbPersistence } from 'pip-services-metrics-node';

// import { MetricsDirectClientV1 } from '../../../src/clients/version1/MetricsDirectClientV1';
// import { MetricsClientV1Fixture } from './MetricsClientV1Fixture';

// suite('MetricsDirectClientV1', () => {
//     let persistence: MetricsMemoryPersistence;
//     let controller: MetricsController;
//     let client: MetricsDirectClientV1;
//     let fixture: MetricsClientV1Fixture;

//     setup((done) => {
//         persistence = new MetricsMemoryPersistence();
//         persistence.configure(new ConfigParams());

//         controller = new MetricsController();
//         controller.configure(new ConfigParams());

//         client = new MetricsDirectClientV1();

//         let references = References.fromTuples(
//             new Descriptor('pip-services-metrics', 'persistence', 'memory', 'default', '1.0'), persistence,
//             new Descriptor('pip-services-metrics', 'controller', 'default', 'default', '1.0'), controller,
//             new Descriptor('pip-services-metrics', 'client', 'direct', 'default', '1.0'), client
//         );

//         controller.setReferences(references);
//         client.setReferences(references);

//         fixture = new MetricsClientV1Fixture(client);

//         persistence.open(null, done);
//     });

//     teardown((done) => {
//         persistence.close(null, done);
//     });

//     test('Metrics CRUD Operations', (done) => {
//         fixture.testMetrics(done);
//     });

//     test('Metrics definitions', (done) => {
//         fixture.testDefinitions(done);
//     });
// });