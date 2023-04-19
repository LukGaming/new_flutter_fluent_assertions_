import 'package:assertion_tests/data/entities/service.dart';
import 'package:assertion_tests/data/logic/services.dart';

class MockServices implements Services {
  @override
  Future<List<Service>> getServices() async {
    List<Service> services = [
      Service(
        serviceName: 'Service A',
        serviceDone: true,
        serviceDoneDay: '2023-04-19',
      ),
      Service(
        serviceName: 'Service B',
        serviceDone: false,
        serviceDoneDay: '',
      ),
      Service(
        serviceName: 'Service C',
        serviceDone: true,
        serviceDoneDay: '2023-04-18',
      ),
    ];

    await Future.delayed(const Duration(seconds: 1));
    return services;
  }

  @override
  Future<List<Service>> getServicesByDay(String day) async {
    List<Service> serviceList = await getServices();
    return serviceList
        .where((element) => element.serviceDoneDay == day)
        .toList();
  }

  @override
  Future<List<Service>> getUndoneServices() async {
    List<Service> serviceList = await getServices();
    return serviceList
        .where((element) => element.serviceDone == false)
        .toList();
  }
}
