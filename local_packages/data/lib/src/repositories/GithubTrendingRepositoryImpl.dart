import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'GithubTrendingRepository.dart';

@LazySingleton(as: GithubTrendingRepository)
class GithubTrendingRepositoryImpl implements GithubTrendingRepository {
  final StreamController<List<GithubRepo>> _githubTrendingData =
      StreamController<List<GithubRepo>>();

  @override
  Future<void> getGithubTrendingData() async {

    List<GithubRepo> dummyData = [
      const GithubRepo(
          avatarUrl: "",
          owner: "owner",
          name: "name",
          description: "description",
          language: "language",
          stargazerCount: "stargazerCount",
          forksCount: "forksCount"),
      const GithubRepo(
          avatarUrl: " 1",
          owner: "owner 1",
          name: "name 1",
          description: "description 1",
          language: "language 1",
          stargazerCount: "stargazerCount 1",
          forksCount: "forksCount 1")
    ];

    _githubTrendingData.add(dummyData);
  }

  @override
  Stream<List<GithubRepo>> get githubTrendingData async* {
    yield* _githubTrendingData.stream;
  }
}
