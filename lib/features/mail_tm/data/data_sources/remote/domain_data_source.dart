
import '../../../domain/entities/domain.dart';
import '../../models/domain.dart';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class DomainRemoteDataSource {
  Future<List<DomainModel>> getDomains();

}

class DomainDataSourceImpl implements DomainRemoteDataSource {
  final http.Client client;

  DomainDataSourceImpl({required this.client});

  @override
  Future<List<DomainModel>> getDomains() async {
    final response = await client.get(Uri.parse('https://api.mail.tm/domains'));
    print('statusCode');
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);
      final List<dynamic> domainsJson = jsonMap['hydra:member'];
      print(domainsJson);
      return domainsJson.map((domainJson) => DomainModel.fromJson(domainJson)).toList();
    } else {
      throw Exception('Failed to load domains');
    }
  }
}