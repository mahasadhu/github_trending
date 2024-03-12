import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'package:rxdart/rxdart.dart';
import 'github_trending_repository.dart';

@LazySingleton(as: GithubTrendingRepository)
class GithubTrendingRepositoryImpl implements GithubTrendingRepository {

  final BehaviorSubject<List<GithubRepo>> _githubTrendingData = BehaviorSubject();

  List<GithubRepo> lastValue = List.empty();

  GithubTrendingRepositoryImpl() {
    _githubTrendingData.stream.listen((event) {
      lastValue = event;
      print("GithubTrendingRepository:$lastValue");
    });
  }

  @override
  Future<Resource<List<GithubRepo>>> getGithubTrendingData() async {

    await Future.delayed(const Duration(seconds: 3));

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
        name: "name 3",
        description: "description 1",
        language: "language 1",
        stargazerCount: "stargazerCount 1",
        forksCount: "forksCount 1",
        isExpanded: true,
      )
    ];

    _githubTrendingData.add(dummyData);

    // return ResourceError("error neh", null);
    return ResourceSuccess(dummyData);
  }

  @override
  Stream<List<GithubRepo>> get githubTrendingData async* {
    yield* _githubTrendingData.stream;
  }

  @override
  Future<List<GithubRepo>> toggleExpanded(String githubRepoId) async {
    List<GithubRepo> currentData = lastValue.map((e) {
      if (e.id == githubRepoId) {
        return e.copyWith(isExpanded: !e.isExpanded);
      } else {
        return e;
      }
    }).toList();

    _githubTrendingData.add(currentData);

    return currentData;
  }
}
