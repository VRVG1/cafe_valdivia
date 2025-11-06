// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insumo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Insumo {

 int? get id; String get nombre; String? get descripcion;@JsonKey(name: 'id_unidad') int get idUnidad;@JsonKey(name: 'consto_unitario') String get costoUnitario;
/// Create a copy of Insumo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InsumoCopyWith<Insumo> get copyWith => _$InsumoCopyWithImpl<Insumo>(this as Insumo, _$identity);

  /// Serializes this Insumo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Insumo&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.idUnidad, idUnidad) || other.idUnidad == idUnidad)&&(identical(other.costoUnitario, costoUnitario) || other.costoUnitario == costoUnitario));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,idUnidad,costoUnitario);

@override
String toString() {
  return 'Insumo(id: $id, nombre: $nombre, descripcion: $descripcion, idUnidad: $idUnidad, costoUnitario: $costoUnitario)';
}


}

/// @nodoc
abstract mixin class $InsumoCopyWith<$Res>  {
  factory $InsumoCopyWith(Insumo value, $Res Function(Insumo) _then) = _$InsumoCopyWithImpl;
@useResult
$Res call({
 int? id, String nombre, String? descripcion,@JsonKey(name: 'id_unidad') int idUnidad,@JsonKey(name: 'consto_unitario') String costoUnitario
});




}
/// @nodoc
class _$InsumoCopyWithImpl<$Res>
    implements $InsumoCopyWith<$Res> {
  _$InsumoCopyWithImpl(this._self, this._then);

  final Insumo _self;
  final $Res Function(Insumo) _then;

/// Create a copy of Insumo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nombre = null,Object? descripcion = freezed,Object? idUnidad = null,Object? costoUnitario = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,idUnidad: null == idUnidad ? _self.idUnidad : idUnidad // ignore: cast_nullable_to_non_nullable
as int,costoUnitario: null == costoUnitario ? _self.costoUnitario : costoUnitario // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Insumo].
extension InsumoPatterns on Insumo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Insumo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Insumo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Insumo value)  $default,){
final _that = this;
switch (_that) {
case _Insumo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Insumo value)?  $default,){
final _that = this;
switch (_that) {
case _Insumo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String nombre,  String? descripcion, @JsonKey(name: 'id_unidad')  int idUnidad, @JsonKey(name: 'consto_unitario')  String costoUnitario)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Insumo() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.idUnidad,_that.costoUnitario);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String nombre,  String? descripcion, @JsonKey(name: 'id_unidad')  int idUnidad, @JsonKey(name: 'consto_unitario')  String costoUnitario)  $default,) {final _that = this;
switch (_that) {
case _Insumo():
return $default(_that.id,_that.nombre,_that.descripcion,_that.idUnidad,_that.costoUnitario);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String nombre,  String? descripcion, @JsonKey(name: 'id_unidad')  int idUnidad, @JsonKey(name: 'consto_unitario')  String costoUnitario)?  $default,) {final _that = this;
switch (_that) {
case _Insumo() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.idUnidad,_that.costoUnitario);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Insumo implements Insumo {
  const _Insumo({this.id, required this.nombre, this.descripcion, @JsonKey(name: 'id_unidad') required this.idUnidad, @JsonKey(name: 'consto_unitario') required this.costoUnitario});
  factory _Insumo.fromJson(Map<String, dynamic> json) => _$InsumoFromJson(json);

@override final  int? id;
@override final  String nombre;
@override final  String? descripcion;
@override@JsonKey(name: 'id_unidad') final  int idUnidad;
@override@JsonKey(name: 'consto_unitario') final  String costoUnitario;

/// Create a copy of Insumo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InsumoCopyWith<_Insumo> get copyWith => __$InsumoCopyWithImpl<_Insumo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InsumoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Insumo&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.idUnidad, idUnidad) || other.idUnidad == idUnidad)&&(identical(other.costoUnitario, costoUnitario) || other.costoUnitario == costoUnitario));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,idUnidad,costoUnitario);

@override
String toString() {
  return 'Insumo(id: $id, nombre: $nombre, descripcion: $descripcion, idUnidad: $idUnidad, costoUnitario: $costoUnitario)';
}


}

/// @nodoc
abstract mixin class _$InsumoCopyWith<$Res> implements $InsumoCopyWith<$Res> {
  factory _$InsumoCopyWith(_Insumo value, $Res Function(_Insumo) _then) = __$InsumoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String nombre, String? descripcion,@JsonKey(name: 'id_unidad') int idUnidad,@JsonKey(name: 'consto_unitario') String costoUnitario
});




}
/// @nodoc
class __$InsumoCopyWithImpl<$Res>
    implements _$InsumoCopyWith<$Res> {
  __$InsumoCopyWithImpl(this._self, this._then);

  final _Insumo _self;
  final $Res Function(_Insumo) _then;

/// Create a copy of Insumo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nombre = null,Object? descripcion = freezed,Object? idUnidad = null,Object? costoUnitario = null,}) {
  return _then(_Insumo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,idUnidad: null == idUnidad ? _self.idUnidad : idUnidad // ignore: cast_nullable_to_non_nullable
as int,costoUnitario: null == costoUnitario ? _self.costoUnitario : costoUnitario // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
