import 'dart:convert';

class DataModel {
  late String quantity;
  late String bloodGroup;
  DataModel({
    required this.quantity,
    required this.bloodGroup,
  });

  DataModel copyWith({
    required String quantity,
    required String bloodGroup,
    
  }) {
    return DataModel(
      quantity: quantity,
      bloodGroup: bloodGroup,
      
    );
  }

  DataModel merge(DataModel model) {
    return DataModel(
      quantity: model.quantity,
      bloodGroup: model.bloodGroup,
      
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'bloodGroup': bloodGroup,
      
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {

  
    return DataModel(
      quantity: map['quantity'],
      bloodGroup: map['bloodGroup'],
      
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) => DataModel.fromMap(json.decode(source));

  @override
  String toString() => 'DataModel(quantity: $quantity, bloodGroup: $bloodGroup,)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is DataModel &&
      o.quantity == quantity &&
      o.bloodGroup == bloodGroup;
  }

  @override
  int get hashCode => quantity.hashCode ^ bloodGroup.hashCode ;
}
