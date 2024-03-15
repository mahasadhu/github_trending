part of 'github_trending_bloc.dart';

@freezed
sealed class GithubTrendingEvent with _$GithubTrendingEvent {
  const factory GithubTrendingEvent.githubTrendingStarted() = _GithubTrendingStarted;
  const factory GithubTrendingEvent.githubTrendingRefreshed() = _GithubTrendingRefreshed;
  const factory GithubTrendingEvent.githubTrendingSortByStarsClicked() = _GithubTrendingSortByStarsClicked;
  const factory GithubTrendingEvent.githubTrendingSortByNameClicked() = _GithubTrendingSortByNameClicked;
  const factory GithubTrendingEvent.githubTrendingItemClicked(GithubRepo data) = _GithubTrendingItemClicked;
}
