import 'package:models/models.dart';

abstract class GithubTrendingRepository {

  Stream<List<GithubRepo>> get githubTrendingData;

  Future<void> getGithubTrendingData();

}