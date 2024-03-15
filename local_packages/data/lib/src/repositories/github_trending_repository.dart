import 'package:models/models.dart';

abstract class GithubTrendingRepository {

  Stream<List<GithubRepo>> get githubTrendingData;

  Future<Resource<List<GithubRepo>>> getGithubTrendingData();

  Future<List<GithubRepo>> toggleExpanded(String githubRepoId);

  Future<List<GithubRepo>> sortByStars();

  Future<List<GithubRepo>> sortByName();
}