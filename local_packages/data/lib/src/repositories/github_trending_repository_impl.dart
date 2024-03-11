import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'github_trending_repository.dart';

@LazySingleton(as: GithubTrendingRepository)
class GithubTrendingRepositoryImpl implements GithubTrendingRepository {
  final StreamController<List<GithubRepo>> _githubTrendingData =
      StreamController<List<GithubRepo>>();
  List<GithubRepo> lastValue = List.empty();

  GithubTrendingRepositoryImpl() {
    _githubTrendingData.stream.listen((event) {
      lastValue = event;
      print("GithubTrendingRepository:$lastValue");
    });
  }

  @override
  Future<void> getGithubTrendingData() async {
    List<GithubRepo> dummyData = [
      const GithubRepo(
        id: "0",
        avatarUrl: "",
        owner: "owner",
        name: "name",
        description: "description",
        language: "language",
        stargazerCount: "stargazerCount",
        forksCount: "forksCount",
        isExpanded: false,
      ),
      const GithubRepo(
        id: "1",
        avatarUrl: " 1",
        owner: "owner 1",
        name: "name 1",
        description: "description 1",
        language: "language 1",
        stargazerCount: "stargazerCount 1",
        forksCount: "forksCount 1",
        isExpanded: false,
      )
    ];

    _githubTrendingData.add(dummyData);
  }

  @override
  Stream<List<GithubRepo>> get githubTrendingData async* {
    yield* _githubTrendingData.stream;
  }
}
