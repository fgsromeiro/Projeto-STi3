// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part '../../../../shared/hive/generator/client.g.dart';

@HiveType(typeId: 2)
class Client extends Equatable {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String cnpj;

  @HiveField(2)
  final String cpf;

  @HiveField(3)
  final String name;

  @HiveField(4)
  final String companyName;

  @HiveField(5)
  final String email;

  @HiveField(6)
  final String dateBirth;

  const Client({
    required this.id,
    required this.cnpj,
    required this.cpf,
    required this.name,
    required this.companyName,
    required this.email,
    required this.dateBirth,
  });

  @override
  List<Object> get props {
    return [
      id,
      cnpj,
      cpf,
      name,
      companyName,
      email,
      dateBirth,
    ];
  }
}
