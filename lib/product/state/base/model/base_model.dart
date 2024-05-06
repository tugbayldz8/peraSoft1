import 'package:equatable/equatable.dart';

abstract class BaseModel<T> with EquatableMixin {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
