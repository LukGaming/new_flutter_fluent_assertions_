import 'package:assertion_tests/data/entities/service.dart';

abstract class Services {
  Future<List<Service>> getServices();
  Future<List<Service>> getServicesByDay(String day);
  Future<List<Service>> getUndoneServices();
}
