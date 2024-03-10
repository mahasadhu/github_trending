// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GithubRepo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GithubRepoImpl _$$GithubRepoImplFromJson(Map<String, dynamic> json) =>
    _$GithubRepoImpl(
      avatarUrl: json['avatarUrl'] as String,
      owner: json['owner'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      language: json['language'] as String,
      stargazerCount: json['stargazerCount'] as String,
      forksCount: json['forksCount'] as String,
    );

Map<String, dynamic> _$$GithubRepoImplToJson(_$GithubRepoImpl instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl,
      'owner': instance.owner,
      'name': instance.name,
      'description': instance.description,
      'language': instance.language,
      'stargazerCount': instance.stargazerCount,
      'forksCount': instance.forksCount,
    };
