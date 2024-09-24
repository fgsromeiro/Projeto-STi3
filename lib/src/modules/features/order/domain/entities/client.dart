// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Client extends Equatable {
  final String id;
  final String cnpj;
  final String cpf;
  final String name;
  final String companyName;
  final String email;
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
