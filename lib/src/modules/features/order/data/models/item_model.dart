import 'dart:convert';

import 'package:projeto_sti3/src/modules/features/order/domain/entities/item.dart';

class ItemModel extends Item {
  const ItemModel({
    required super.id,
    required super.idProduct,
    required super.title,
    required super.quantity,
    required super.unitValue,
  });

  factory ItemModel.fromEntity(Item entity) => ItemModel(
        id: entity.id,
        idProduct: entity.idProduct,
        title: entity.title,
        quantity: entity.quantity,
        unitValue: entity.unitValue,
      );

  Item toEntity() => Item(
        id: id,
        idProduct: idProduct,
        title: title,
        quantity: quantity,
        unitValue: unitValue,
      );

  factory ItemModel.fromMap(Map<String, Object?> map) => ItemModel(
        id: map['id'] != null ? map['id'] as String : '',
        idProduct: map['idProduto'] != null ? map['idProduto'] as String : '',
        title: map['nome'] != null ? map['nome'] as String : '',
        quantity: map['quantidade'] != null ? map['quantidade'] as int : 0,
        unitValue:
            map['valorUnitario'] != null ? map['valorUnitario'] as double : 0.0,
      );

  factory ItemModel.fromJson(String json) =>
      ItemModel.fromMap(jsonDecode(json) as Map<String, Object?>);
}
