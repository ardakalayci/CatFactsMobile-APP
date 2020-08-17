import 'package:catfacts/data/data.dart';
import 'package:catfacts/model/all_facts.dart';
import 'package:catfacts/model/random_facts.dart';



class FactsRepository {
 FactsApiClient factsApiClient = FactsApiClient();

  Future<AllFacts> getAllFacts() async {
    return await factsApiClient.getAllFacts();
  }
  Future<RandomFacts> getRandomFacts() async {
    return await factsApiClient.getRandomFacts();
  }


}