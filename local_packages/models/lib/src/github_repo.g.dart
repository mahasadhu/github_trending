// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GithubRepoImpl _$$GithubRepoImplFromJson(Map<String, dynamic> json) =>
    _$GithubRepoImpl(
      id: json['id'] as String,
      avatarUrl: json['avatarUrl'] as String,
      owner: json['owner'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      language: json['language'] as String,
      stargazerCount: json['stargazerCount'] as String,
      forksCount: json['forksCount'] as String,
      isExpanded: json['isExpanded'] as bool,
    );

Map<String, dynamic> _$$GithubRepoImplToJson(_$GithubRepoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatarUrl': instance.avatarUrl,
      'owner': instance.owner,
      'name': instance.name,
      'description': instance.description,
      'language': instance.language,
      'stargazerCount': instance.stargazerCount,
      'forksCount': instance.forksCount,
      'isExpanded': instance.isExpanded,
    };
