import 'package:catfacts/model/all_facts.dart';
import 'package:catfacts/model/random_facts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FactsApiClient {
  static const allFactUrl =
      "https://cat-fact.herokuapp.com/facts/";
  static const randomFactUrl =
      "https://cat-fact.herokuapp.com/facts/random";
  final http.Client httpClient = http.Client();

  Future<AllFacts> getAllFacts() async {
    final allFactsUrl = allFactUrl;
    final factsCevap = await httpClient.get(allFactsUrl);
    if (factsCevap.statusCode != 200) {
      throw Exception("fact  Apisi Geteirilemedi");
    }

    final factsCevapJSON = jsonDecode(factsCevap.body);
    return AllFacts.fromJson(factsCevapJSON);
  }

  Future<RandomFacts> getRandomFacts() async {
    final randomUrl = randomFactUrl;
    final randomCevap = await httpClient.get(randomUrl);
    if (randomCevap.statusCode != 200) {
      throw Exception("random  Apisi Geteirilemedi");
    }

    final randomCevapJSON = jsonDecode(randomCevap.body);
    return RandomFacts.fromJson(randomCevapJSON);
  }
}
