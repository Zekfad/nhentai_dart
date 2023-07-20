import 'package:dart_mappable/dart_mappable.dart';


extension MapperBaseContainer<T extends Object> on MapperBase<T> {
  MapperContainer get container => MapperContainer.globals;
}
