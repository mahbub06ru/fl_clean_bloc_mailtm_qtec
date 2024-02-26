
import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/domain.dart';
import '../../models/domain.dart';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class DomainRemoteDataSource {
  Future<List<DomainModel>> getDomains();
}

class DomainRemoteDataSourceImpl implements DomainRemoteDataSource {
  final http.Client client;

  DomainRemoteDataSourceImpl({required this.client});

  @override
  Future<List<DomainModel>> getDomains() async {
    final response = await client.get(
      Uri.parse('https://api.mail.tm/domains'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print('statusCode');
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List<dynamic> domainsJson = json.decode(response.body)['hydra:member'];
      print(domainsJson);
      return domainsJson.map((domainJson) => DomainModel.fromJson(domainJson)).toList();
    } else {
      throw Exception('Failed to load domains');
    }
  }
}



/*@override
  Future<List<DomainModel>> getDomains() =>
      _getDomainFromUrl('https://api.mail.tm/domains');

  Future<List<DomainModel>> _getDomainFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print('statusCode');
    print(response.statusCode);
    if (response.statusCode == 200) {
      return domainListFromRemoteJson(response.body);
    } else {
      throw ServerFailure();
    }
  }
}*/