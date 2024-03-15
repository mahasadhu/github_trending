part of 'github_trending_bloc.dart';

@freezed
sealed class GithubTrendingState with _$GithubTrendingState {
  const factory GithubTrendingState.initial() = GithubTrendingStateInitial;
  const factory GithubTrendingState.loading() = GithubTrendingStateLoading;
  const factory GithubTrendingState.error(String message, Exception? exception) = GithubTrendingStateError;
  const factory GithubTrendingState.success(List<GithubRepo> data) = GithubTrendingStateSuccess;
}
