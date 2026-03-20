// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unidad_medida.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnidadMedida {

@JsonKey(name: 'id_unidad') int? get idUnidadMedida; String get nombre;
/// Create a copy of UnidadMedida
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnidadMedidaCopyWith<UnidadMedida> get copyWith => _$UnidadMedidaCopyWithImpl<UnidadMedida>(this as UnidadMedida, _$identity);

  /// Serializes this UnidadMedida to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnidadMedida&&(identical(other.idUnidadMedida, idUnidadMedida) || other.idUnidadMedida == idUnidadMedida)&&(identical(other.nombre, nombre) || other.nombre == nombre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idUnidadMedida,nombre);

@override
String toString() {
  return 'UnidadMedida(idUnidadMedida: $idUnidadMedida, nombre: $nombre)';
}


}

/// @nodoc
abstract mixin class $UnidadMedidaCopyWith<$Res>  {
  factory $UnidadMedidaCopyWith(UnidadMedida value, $Res Function(UnidadMedida) _then) = _$UnidadMedidaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_unidad') int? idUnidadMedida, String nombre
});




}
/// @nodoc
class _$UnidadMedidaCopyWithImpl<$Res>
    implements $UnidadMedidaCopyWith<$Res> {
  _$UnidadMedidaCopyWithImpl(this._self, this._then);

  final UnidadMedida _self;
  final $Res Function(UnidadMedida) _then;

/// Create a copy of UnidadMedida
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idUnidadMedida = freezed,Object? nombre = null,}) {
  return _then(_self.copyWith(
idUnidadMedida: freezed == idUnidadMedida ? _self.idUnidadMedida : idUnidadMedida // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UnidadMedida].
extension UnidadMedidaPatterns on UnidadMedida {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnidadMedida value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnidadMedida() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnidadMedida value)  $default,){
final _that = this;
switch (_that) {
case _UnidadMedida():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnidadMedida value)?  $default,){
final _that = this;
switch (_that) {
case _UnidadMedida() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_unidad')  int? idUnidadMedida,  String nombre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnidadMedida() when $default != null:
return $default(_that.idUnidadMedida,_that.nombre);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_unidad')  int? idUnidadMedida,  String nombre)  $default,) {final _that = this;
switch (_that) {
case _UnidadMedida():
return $default(_that.idUnidadMedida,_that.nombre);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id_unidad')  int? idUnidadMedida,  String nombre)?  $default,) {final _that = this;
switch (_that) {
case _UnidadMedida() when $default != null:
return $default(_that.idUnidadMedida,_that.nombre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnidadMedida implements UnidadMedida {
  const _UnidadMedida({@JsonKey(name: 'id_unidad') this.idUnidadMedida, required this.nombre});
  factory _UnidadMedida.fromJson(Map<String, dynamic> json) => _$UnidadMedidaFromJson(json);

@override@JsonKey(name: 'id_unidad') final  int? idUnidadMedida;
@override final  String nombre;

/// Create a copy of UnidadMedida
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnidadMedidaCopyWith<_UnidadMedida> get copyWith => __$UnidadMedidaCopyWithImpl<_UnidadMedida>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnidadMedidaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnidadMedida&&(identical(other.idUnidadMedida, idUnidadMedida) || other.idUnidadMedida == idUnidadMedida)&&(identical(other.nombre, nombre) || other.nombre == nombre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idUnidadMedida,nombre);

@override
String toString() {
  return 'UnidadMedida(idUnidadMedida: $idUnidadMedida, nombre: $nombre)';
}


}

/// @nodoc
abstract mixin class _$UnidadMedidaCopyWith<$Res> implements $UnidadMedidaCopyWith<$Res> {
  factory _$UnidadMedidaCopyWith(_UnidadMedida value, $Res Function(_UnidadMedida) _then) = __$UnidadMedidaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_unidad') int? idUnidadMedida, String nombre
});




}
/// @nodoc
class __$UnidadMedidaCopyWithImpl<$Res>
    implements _$UnidadMedidaCopyWith<$Res> {
  __$UnidadMedidaCopyWithImpl(this._self, this._then);

  final _UnidadMedida _self;
  final $Res Function(_UnidadMedida) _then;

/// Create a copy of UnidadMedida
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idUnidadMedida = freezed,Object? nombre = null,}) {
  return _then(_UnidadMedida(
idUnidadMedida: freezed == idUnidadMedida ? _self.idUnidadMedida : idUnidadMedida // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
