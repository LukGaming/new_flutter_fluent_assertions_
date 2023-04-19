import 'package:assertion_tests/data/entities/service.dart';
import 'package:assertion_tests/data/logic/services.dart';
import 'package:assertion_tests/mock/services_mock.dart';
import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  //Arrange
  Services services = MockServices();

  //Act
  var servicesList = await services.getServices();

  //Assert
  test(
    "Verify That getServices() return a List of Services",
    () => {servicesList.shouldAllBeInstanceOf<Service>()},
  );

  test(
    "Verify That All Service Fields Are not Null",
    () => {
      servicesList.shouldAllSatisfy((service) {
        service.serviceDone.shouldNotBeNull();
        service.serviceName.shouldNotBeNull();
        service.serviceDoneDay.shouldNotBeNull();
      })
    },
  );

  //Act
  var undoneServices = await services.getUndoneServices();

  //Assert
  test(
    "Verify That getUndoneServices() return a List of Services",
    () => {servicesList.shouldAllBeInstanceOf<Service>()},
  );

  test(
    "Verify That only gets undone Services",
    () => {
      undoneServices.shouldAllSatisfy((service) {
        service.serviceDone.shouldBeFalse();
      })
    },
  );
}
