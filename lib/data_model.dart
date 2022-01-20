import 'dart:convert';

import 'package:flutter/foundation.dart';

class RequestModel {
  final List<DataModel> dataModel;
  RequestModel({
    required this.dataModel,
  });

  RequestModel copyWith({
    required List<DataModel> dataModel,
  }) {
    return RequestModel(
      dataModel: dataModel,
    );
  }

  RequestModel merge(RequestModel model) {
    return RequestModel(
      dataModel: model.dataModel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dataModel': dataModel.map((x) => x.toMap()).toList(),
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    
  
    return RequestModel(
      dataModel: List<DataModel>.from(map['dataModel']?.map((x) => DataModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestModel.fromJson(String source) => RequestModel.fromMap(json.decode(source));

  @override
  String toString() => 'RequestModel(dataModel: $dataModel)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is RequestModel &&
      listEquals(o.dataModel, dataModel);
  }

  @override
  int get hashCode => dataModel.hashCode;
}


class DataModel {
  late String name;
  late String age;
  late String bloodGroup;
  DataModel({
    required this.name,
    required this.age,
    required this.bloodGroup,
  });

  DataModel copyWith({
    required String age,
    required String name,
    required String bloodGroup,
    
  }) {
    return DataModel(
      name: name,
      age:  age,
      bloodGroup: bloodGroup,
      
    );
  }

  DataModel merge(DataModel model) {
    return DataModel(
      name: model.name,
      age:  model.age,
      bloodGroup: model.bloodGroup,
      
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'bloodGroup': bloodGroup,
      
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {

  
    return DataModel(
      name: map['name'],
      age:  map['age'],
      bloodGroup: map['bloodGroup'],
      
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) => DataModel.fromMap(json.decode(source));

  @override
  String toString() => 'DataModel(name: $name,age: $age, bloodGroup: $bloodGroup,)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is DataModel &&
      o.name == name &&
      o.age == age &&
      o.bloodGroup == bloodGroup;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ bloodGroup.hashCode ;
}
