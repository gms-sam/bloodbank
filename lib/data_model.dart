import 'dart:convert';

class DataModel {
  late String name;
  late String bloodGroup;
  late String age;
  DataModel({
    required this.name,
    required this.bloodGroup,
    required this.age,
  });

  DataModel copyWith({
    required String name,
    required String bloodGroup,
    required String age,
  }) {
    return DataModel(
      name: name,
      bloodGroup: bloodGroup,
      age: age,
    );
  }

  DataModel merge(DataModel model) {
    return DataModel(
      name: model.name,
      bloodGroup: model.bloodGroup,
      age: model.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'bloodGroup': bloodGroup,
      'age': age,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {

  
    return DataModel(
      name: map['name'],
      bloodGroup: map['bloodGroup'],
      age: map['age'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) => DataModel.fromMap(json.decode(source));

  @override
  String toString() => 'DataModel(name: $name, bloodGroup: $bloodGroup, age: $age)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is DataModel &&
      o.name == name &&
      o.bloodGroup == bloodGroup &&
      o.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ bloodGroup.hashCode ^ age.hashCode;
}
