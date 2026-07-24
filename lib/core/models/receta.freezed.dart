// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Receta {

@JsonKey(name: 'id_receta') int? get idReceta;@JsonKey(name: 'id_articulo_producto') int get idArticuloProducto; String get nombre; double get cantidad_base;@IntToBoolConverter() bool get activo;@JsonKey(name: 'deleted_at') DateTime? get deletedAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of Receta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecetaCopyWith<Receta> get copyWith => _$RecetaCopyWithImpl<Receta>(this as Receta, _$identity);

  /// Serializes this Receta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Receta&&(identical(other.idReceta, idReceta) || other.idReceta == idReceta)&&(identical(other.idArticuloProducto, idArticuloProducto) || other.idArticuloProducto == idArticuloProducto)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.cantidad_base, cantidad_base) || other.cantidad_base == cantidad_base)&&(identical(other.activo, activo) || other.activo == activo)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idReceta,idArticuloProducto,nombre,cantidad_base,activo,deletedAt,updatedAt);

@override
String toString() {
  return 'Receta(idReceta: $idReceta, idArticuloProducto: $idArticuloProducto, nombre: $nombre, cantidad_base: $cantidad_base, activo: $activo, deletedAt: $deletedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RecetaCopyWith<$Res>  {
  factory $RecetaCopyWith(Receta value, $Res Function(Receta) _then) = _$RecetaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_receta') int? idReceta,@JsonKey(name: 'id_articulo_producto') int idArticuloProducto, String nombre, double cantidad_base,@IntToBoolConverter() bool activo,@JsonKey(name: 'deleted_at') DateTime? deletedAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$RecetaCopyWithImpl<$Res>
    implements $RecetaCopyWith<$Res> {
  _$RecetaCopyWithImpl(this._self, this._then);

  final Receta _self;
  final $Res Function(Receta) _then;

/// Create a copy of Receta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idReceta = freezed,Object? idArticuloProducto = null,Object? nombre = null,Object? cantidad_base = null,Object? activo = null,Object? deletedAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
idReceta: freezed == idReceta ? _self.idReceta : idReceta // ignore: cast_nullable_to_non_nullable
as int?,idArticuloProducto: null == idArticuloProducto ? _self.idArticuloProducto : idArticuloProducto // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,cantidad_base: null == cantidad_base ? _self.cantidad_base : cantidad_base // ignore: cast_nullable_to_non_nullable
as double,activo: null == activo ? _self.activo : activo // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Receta].
extension RecetaPatterns on Receta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Receta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Receta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Receta value)  $default,){
final _that = this;
switch (_that) {
case _Receta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Receta value)?  $default,){
final _that = this;
switch (_that) {
case _Receta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_receta')  int? idReceta, @JsonKey(name: 'id_articulo_producto')  int idArticuloProducto,  String nombre,  double cantidad_base, @IntToBoolConverter()  bool activo, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Receta() when $default != null:
return $default(_that.idReceta,_that.idArticuloProducto,_that.nombre,_that.cantidad_base,_that.activo,_that.deletedAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_receta')  int? idReceta, @JsonKey(name: 'id_articulo_producto')  int idArticuloProducto,  String nombre,  double cantidad_base, @IntToBoolConverter()  bool activo, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Receta():
return $default(_that.idReceta,_that.idArticuloProducto,_that.nombre,_that.cantidad_base,_that.activo,_that.deletedAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id_receta')  int? idReceta, @JsonKey(name: 'id_articulo_producto')  int idArticuloProducto,  String nombre,  double cantidad_base, @IntToBoolConverter()  bool activo, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Receta() when $default != null:
return $default(_that.idReceta,_that.idArticuloProducto,_that.nombre,_that.cantidad_base,_that.activo,_that.deletedAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Receta implements Receta {
  const _Receta({@JsonKey(name: 'id_receta') this.idReceta, @JsonKey(name: 'id_articulo_producto') required this.idArticuloProducto, required this.nombre, required this.cantidad_base, @IntToBoolConverter() this.activo = true, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _Receta.fromJson(Map<String, dynamic> json) => _$RecetaFromJson(json);

@override@JsonKey(name: 'id_receta') final  int? idReceta;
@override@JsonKey(name: 'id_articulo_producto') final  int idArticuloProducto;
@override final  String nombre;
@override final  double cantidad_base;
@override@JsonKey()@IntToBoolConverter() final  bool activo;
@override@JsonKey(name: 'deleted_at') final  DateTime? deletedAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of Receta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecetaCopyWith<_Receta> get copyWith => __$RecetaCopyWithImpl<_Receta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Receta&&(identical(other.idReceta, idReceta) || other.idReceta == idReceta)&&(identical(other.idArticuloProducto, idArticuloProducto) || other.idArticuloProducto == idArticuloProducto)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.cantidad_base, cantidad_base) || other.cantidad_base == cantidad_base)&&(identical(other.activo, activo) || other.activo == activo)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idReceta,idArticuloProducto,nombre,cantidad_base,activo,deletedAt,updatedAt);

@override
String toString() {
  return 'Receta(idReceta: $idReceta, idArticuloProducto: $idArticuloProducto, nombre: $nombre, cantidad_base: $cantidad_base, activo: $activo, deletedAt: $deletedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RecetaCopyWith<$Res> implements $RecetaCopyWith<$Res> {
  factory _$RecetaCopyWith(_Receta value, $Res Function(_Receta) _then) = __$RecetaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_receta') int? idReceta,@JsonKey(name: 'id_articulo_producto') int idArticuloProducto, String nombre, double cantidad_base,@IntToBoolConverter() bool activo,@JsonKey(name: 'deleted_at') DateTime? deletedAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$RecetaCopyWithImpl<$Res>
    implements _$RecetaCopyWith<$Res> {
  __$RecetaCopyWithImpl(this._self, this._then);

  final _Receta _self;
  final $Res Function(_Receta) _then;

/// Create a copy of Receta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idReceta = freezed,Object? idArticuloProducto = null,Object? nombre = null,Object? cantidad_base = null,Object? activo = null,Object? deletedAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Receta(
idReceta: freezed == idReceta ? _self.idReceta : idReceta // ignore: cast_nullable_to_non_nullable
as int?,idArticuloProducto: null == idArticuloProducto ? _self.idArticuloProducto : idArticuloProducto // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,cantidad_base: null == cantidad_base ? _self.cantidad_base : cantidad_base // ignore: cast_nullable_to_non_nullable
as double,activo: null == activo ? _self.activo : activo // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
