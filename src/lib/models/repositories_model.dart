import 'package:freezed_annotation/freezed_annotation.dart';

part 'repositories_model.freezed.dart';
part 'repositories_model.g.dart';

@freezed
class Node with _$Node {
  const factory Node({
    required final String id,
    required final String name,
    required final String url,
    required final String? updatedAt,
  }) = _Node;

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}

@freezed
class RepositoriesResponse with _$RepositoriesResponse {
  @JsonSerializable(explicitToJson: true)
  const factory RepositoriesResponse({
    required final List<Node> nodes,
  }) = _RepositoriesResponse;
  const RepositoriesResponse._();

  factory RepositoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$RepositoriesResponseFromJson(json);
}
