// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insumo_producto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InsumoProducto {

 int? get id; int get idInsumo; int get idProducto; String get nombre; double get cantidadRequerida;
/// Create a copy of InsumoProducto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InsumoProductoCopyWith<InsumoProducto> get copyWith => _$InsumoProductoCopyWithImpl<InsumoProducto>(this as InsumoProducto, _$identity);

  /// Serializes this InsumoProducto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsumoProducto&&(identical(other.id, id) || other.id == id)&&(identical(other.idInsumo, idInsumo) || other.idInsumo == idInsumo)&&(identical(other.idProducto, idProducto) || other.idProducto == idProducto)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.cantidadRequerida, cantidadRequerida) || other.cantidadRequerida == cantidadRequerida));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idInsumo,idProducto,nombre,cantidadRequerida);

@override
String toString() {
  return 'InsumoProducto(id: $id, idInsumo: $idInsumo, idProducto: $idProducto, nombre: $nombre, cantidadRequerida: $cantidadRequerida)';
}


}

/// @nodoc
abstract mixin class $InsumoProductoCopyWith<$Res>  {
  factory $InsumoProductoCopyWith(InsumoProducto value, $Res Function(InsumoProducto) _then) = _$InsumoProductoCopyWithImpl;
@useResult
$Res call({
 int? id, int idInsumo, int idProducto, String nombre, double cantidadRequerida
});




}
/// @nodoc
class _$InsumoProductoCopyWithImpl<$Res>
    implements $InsumoProductoCopyWith<$Res> {
  _$InsumoProductoCopyWithImpl(this._self, this._then);

  final InsumoProducto _self;
  final $Res Function(InsumoProducto) _then;

/// Create a copy of InsumoProducto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? idInsumo = null,Object? idProducto = null,Object? nombre = null,Object? cantidadRequerida = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idInsumo: null == idInsumo ? _self.idInsumo : idInsumo // ignore: cast_nullable_to_non_nullable
as int,idProducto: null == idProducto ? _self.idProducto : idProducto // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,cantidadRequerida: null == cantidadRequerida ? _self.cantidadRequerida : cantidadRequerida // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [InsumoProducto].
extension InsumoProductoPatterns on InsumoProducto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InsumoProducto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InsumoProducto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InsumoProducto value)  $default,){
final _that = this;
switch (_that) {
case _InsumoProducto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InsumoProducto value)?  $default,){
final _that = this;
switch (_that) {
case _InsumoProducto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int idInsumo,  int idProducto,  String nombre,  double cantidadRequerida)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InsumoProducto() when $default != null:
return $default(_that.id,_that.idInsumo,_that.idProducto,_that.nombre,_that.cantidadRequerida);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int idInsumo,  int idProducto,  String nombre,  double cantidadRequerida)  $default,) {final _that = this;
switch (_that) {
case _InsumoProducto():
return $default(_that.id,_that.idInsumo,_that.idProducto,_that.nombre,_that.cantidadRequerida);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int idInsumo,  int idProducto,  String nombre,  double cantidadRequerida)?  $default,) {final _that = this;
switch (_that) {
case _InsumoProducto() when $default != null:
return $default(_that.id,_that.idInsumo,_that.idProducto,_that.nombre,_that.cantidadRequerida);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InsumoProducto implements InsumoProducto {
  const _InsumoProducto({this.id, required this.idInsumo, required this.idProducto, required this.nombre, required this.cantidadRequerida});
  factory _InsumoProducto.fromJson(Map<String, dynamic> json) => _$InsumoProductoFromJson(json);

@override final  int? id;
@override final  int idInsumo;
@override final  int idProducto;
@override final  String nombre;
@override final  double cantidadRequerida;

/// Create a copy of InsumoProducto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InsumoProductoCopyWith<_InsumoProducto> get copyWith => __$InsumoProductoCopyWithImpl<_InsumoProducto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InsumoProductoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InsumoProducto&&(identical(other.id, id) || other.id == id)&&(identical(other.idInsumo, idInsumo) || other.idInsumo == idInsumo)&&(identical(other.idProducto, idProducto) || other.idProducto == idProducto)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.cantidadRequerida, cantidadRequerida) || other.cantidadRequerida == cantidadRequerida));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idInsumo,idProducto,nombre,cantidadRequerida);

@override
String toString() {
  return 'InsumoProducto(id: $id, idInsumo: $idInsumo, idProducto: $idProducto, nombre: $nombre, cantidadRequerida: $cantidadRequerida)';
}


}

/// @nodoc
abstract mixin class _$InsumoProductoCopyWith<$Res> implements $InsumoProductoCopyWith<$Res> {
  factory _$InsumoProductoCopyWith(_InsumoProducto value, $Res Function(_InsumoProducto) _then) = __$InsumoProductoCopyWithImpl;
@override @useResult
$Res call({
 int? id, int idInsumo, int idProducto, String nombre, double cantidadRequerida
});




}
/// @nodoc
class __$InsumoProductoCopyWithImpl<$Res>
    implements _$InsumoProductoCopyWith<$Res> {
  __$InsumoProductoCopyWithImpl(this._self, this._then);

  final _InsumoProducto _self;
  final $Res Function(_InsumoProducto) _then;

/// Create a copy of InsumoProducto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? idInsumo = null,Object? idProducto = null,Object? nombre = null,Object? cantidadRequerida = null,}) {
  return _then(_InsumoProducto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idInsumo: null == idInsumo ? _self.idInsumo : idInsumo // ignore: cast_nullable_to_non_nullable
as int,idProducto: null == idProducto ? _self.idProducto : idProducto // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,cantidadRequerida: null == cantidadRequerida ? _self.cantidadRequerida : cantidadRequerida // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
