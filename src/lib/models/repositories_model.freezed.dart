// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repositories_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Node _$NodeFromJson(Map<String, dynamic> json) {
  return _Node.fromJson(json);
}

/// @nodoc
mixin _$Node {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NodeCopyWith<Node> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeCopyWith<$Res> {
  factory $NodeCopyWith(Node value, $Res Function(Node) then) =
      _$NodeCopyWithImpl<$Res, Node>;
  @useResult
  $Res call({String id, String name, String url, String? updatedAt});
}

/// @nodoc
class _$NodeCopyWithImpl<$Res, $Val extends Node>
    implements $NodeCopyWith<$Res> {
  _$NodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NodeCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$$_NodeCopyWith(_$_Node value, $Res Function(_$_Node) then) =
      __$$_NodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String url, String? updatedAt});
}

/// @nodoc
class __$$_NodeCopyWithImpl<$Res> extends _$NodeCopyWithImpl<$Res, _$_Node>
    implements _$$_NodeCopyWith<$Res> {
  __$$_NodeCopyWithImpl(_$_Node _value, $Res Function(_$_Node) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Node(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Node implements _Node {
  const _$_Node(
      {required this.id,
      required this.name,
      required this.url,
      required this.updatedAt});

  factory _$_Node.fromJson(Map<String, dynamic> json) => _$$_NodeFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String url;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'Node(id: $id, name: $name, url: $url, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Node &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, url, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NodeCopyWith<_$_Node> get copyWith =>
      __$$_NodeCopyWithImpl<_$_Node>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NodeToJson(
      this,
    );
  }
}

abstract class _Node implements Node {
  const factory _Node(
      {required final String id,
      required final String name,
      required final String url,
      required final String? updatedAt}) = _$_Node;

  factory _Node.fromJson(Map<String, dynamic> json) = _$_Node.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get url;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_NodeCopyWith<_$_Node> get copyWith => throw _privateConstructorUsedError;
}

RepositoriesResponse _$RepositoriesResponseFromJson(Map<String, dynamic> json) {
  return _RepositoriesResponse.fromJson(json);
}

/// @nodoc
mixin _$RepositoriesResponse {
  List<Node> get nodes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepositoriesResponseCopyWith<RepositoriesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoriesResponseCopyWith<$Res> {
  factory $RepositoriesResponseCopyWith(RepositoriesResponse value,
          $Res Function(RepositoriesResponse) then) =
      _$RepositoriesResponseCopyWithImpl<$Res, RepositoriesResponse>;
  @useResult
  $Res call({List<Node> nodes});
}

/// @nodoc
class _$RepositoriesResponseCopyWithImpl<$Res,
        $Val extends RepositoriesResponse>
    implements $RepositoriesResponseCopyWith<$Res> {
  _$RepositoriesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodes = null,
  }) {
    return _then(_value.copyWith(
      nodes: null == nodes
          ? _value.nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<Node>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RepositoriesResponseCopyWith<$Res>
    implements $RepositoriesResponseCopyWith<$Res> {
  factory _$$_RepositoriesResponseCopyWith(_$_RepositoriesResponse value,
          $Res Function(_$_RepositoriesResponse) then) =
      __$$_RepositoriesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Node> nodes});
}

/// @nodoc
class __$$_RepositoriesResponseCopyWithImpl<$Res>
    extends _$RepositoriesResponseCopyWithImpl<$Res, _$_RepositoriesResponse>
    implements _$$_RepositoriesResponseCopyWith<$Res> {
  __$$_RepositoriesResponseCopyWithImpl(_$_RepositoriesResponse _value,
      $Res Function(_$_RepositoriesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodes = null,
  }) {
    return _then(_$_RepositoriesResponse(
      nodes: null == nodes
          ? _value._nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<Node>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_RepositoriesResponse extends _RepositoriesResponse {
  const _$_RepositoriesResponse({required final List<Node> nodes})
      : _nodes = nodes,
        super._();

  factory _$_RepositoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RepositoriesResponseFromJson(json);

  final List<Node> _nodes;
  @override
  List<Node> get nodes {
    if (_nodes is EqualUnmodifiableListView) return _nodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodes);
  }

  @override
  String toString() {
    return 'RepositoriesResponse(nodes: $nodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepositoriesResponse &&
            const DeepCollectionEquality().equals(other._nodes, _nodes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_nodes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepositoriesResponseCopyWith<_$_RepositoriesResponse> get copyWith =>
      __$$_RepositoriesResponseCopyWithImpl<_$_RepositoriesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepositoriesResponseToJson(
      this,
    );
  }
}

abstract class _RepositoriesResponse extends RepositoriesResponse {
  const factory _RepositoriesResponse({required final List<Node> nodes}) =
      _$_RepositoriesResponse;
  const _RepositoriesResponse._() : super._();

  factory _RepositoriesResponse.fromJson(Map<String, dynamic> json) =
      _$_RepositoriesResponse.fromJson;

  @override
  List<Node> get nodes;
  @override
  @JsonKey(ignore: true)
  _$$_RepositoriesResponseCopyWith<_$_RepositoriesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
