// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Node _$$_NodeFromJson(Map<String, dynamic> json) => _$_Node(
      id: json['id'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$_NodeToJson(_$_Node instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'updatedAt': instance.updatedAt,
    };

_$_RepositoriesResponse _$$_RepositoriesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_RepositoriesResponse(
      nodes: (json['nodes'] as List<dynamic>)
          .map((e) => Node.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RepositoriesResponseToJson(
        _$_RepositoriesResponse instance) =>
    <String, dynamic>{
      'nodes': instance.nodes,
    };
