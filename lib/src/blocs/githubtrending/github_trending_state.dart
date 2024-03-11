part of 'github_trending_bloc.dart';

@freezed
sealed class GithubTrendingState with _$GithubTrendingState {
  const factory GithubTrendingState.initial() = _Initial;
  const factory GithubTrendingState.loading() = _Loading;
  const factory GithubTrendingState.error(String message, Exception? exception) = _Error;
  const factory GithubTrendingState.data(List<GithubRepo> data) = _Data;
}
