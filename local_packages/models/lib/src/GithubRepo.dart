import 'package:freezed_annotation/freezed_annotation.dart';

part 'GithubRepo.freezed.dart';
part 'GithubRepo.g.dart';

@freezed
class GithubRepo with _$GithubRepo {
  const factory GithubRepo({
    required String avatarUrl,
    required String owner,
    required String name,
    required String description,
    required String language,
    required String stargazerCount,
    required String forksCount,
    required bool isExpanded,
  }) = _GithubRepo;

  factory GithubRepo.fromJson(Map<String, Object?> json) =>
      _$GithubRepoFromJson(json);
}