import 'dart:async';

import 'package:data/src/network/dtos/github_repo_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'package:rxdart/rxdart.dart';
import 'github_trending_repository.dart';

@Singleton(as: GithubTrendingRepository)
class GithubTrendingRepositoryImpl implements GithubTrendingRepository {
  final BehaviorSubject<List<GithubRepo>> _githubTrendingData =
      BehaviorSubject();
  final Dio _httpClient;

  List<GithubRepo> lastValue = List.empty();

  GithubTrendingRepositoryImpl(this._httpClient) {
    _githubTrendingData.stream.listen((event) {
      lastValue = event;
      print("GithubTrendingRepository:$lastValue");
    });
  }

  @override
  Future<Resource<List<GithubRepo>>> getGithubTrendingData() async {
    List<GithubRepo> githubRepos;
    try {
      Response response = await _httpClient.get("/orgs/octokit/repos");
      githubRepos =
          GithubRepoDTOList.fromJson({"githubRepoDTOList": response.data})
              .githubRepoDTOList
              .map((e) => e.map())
              .toList();

    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
        print(e.toString());
      }

      githubRepos = List.empty();

      return ResourceError(e.message ?? "Unknown Error", e);
    }

    _githubTrendingData.add(githubRepos);
    return ResourceSuccess(githubRepos);
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

  @override
  Future<List<GithubRepo>> sortByName() async {
    List<GithubRepo> orderedList = lastValue.map((e) => e).toList();
    orderedList.sort((a, b) => a.name.compareTo(b.name));

    _githubTrendingData.add(orderedList);

    return orderedList;
  }

  @override
  Future<List<GithubRepo>> sortByStars() async {
    List<GithubRepo> orderedList = lastValue.map((e) => e).toList();
    orderedList.sort((a, b) => (int.parse(a.stargazerCount).compareTo(int.parse(b.stargazerCount))) * -1);

    _githubTrendingData.add(orderedList);

    return orderedList;
  }
}
