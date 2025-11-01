// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movimiento_inventario_insumo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovimientoInventarioInsumo {

 int? get id; int get idInsumo; String? get tipo; int get cantidad; DateTime get fecha; int get idDetalleCompra; int get idDetalleProduccion; String? get motivo;
/// Create a copy of MovimientoInventarioInsumo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovimientoInventarioInsumoCopyWith<MovimientoInventarioInsumo> get copyWith => _$MovimientoInventarioInsumoCopyWithImpl<MovimientoInventarioInsumo>(this as MovimientoInventarioInsumo, _$identity);

  /// Serializes this MovimientoInventarioInsumo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovimientoInventarioInsumo&&(identical(other.id, id) || other.id == id)&&(identical(other.idInsumo, idInsumo) || other.idInsumo == idInsumo)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.idDetalleCompra, idDetalleCompra) || other.idDetalleCompra == idDetalleCompra)&&(identical(other.idDetalleProduccion, idDetalleProduccion) || other.idDetalleProduccion == idDetalleProduccion)&&(identical(other.motivo, motivo) || other.motivo == motivo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idInsumo,tipo,cantidad,fecha,idDetalleCompra,idDetalleProduccion,motivo);

@override
String toString() {
  return 'MovimientoInventarioInsumo(id: $id, idInsumo: $idInsumo, tipo: $tipo, cantidad: $cantidad, fecha: $fecha, idDetalleCompra: $idDetalleCompra, idDetalleProduccion: $idDetalleProduccion, motivo: $motivo)';
}


}

/// @nodoc
abstract mixin class $MovimientoInventarioInsumoCopyWith<$Res>  {
  factory $MovimientoInventarioInsumoCopyWith(MovimientoInventarioInsumo value, $Res Function(MovimientoInventarioInsumo) _then) = _$MovimientoInventarioInsumoCopyWithImpl;
@useResult
$Res call({
 int? id, int idInsumo, String? tipo, int cantidad, DateTime fecha, int idDetalleCompra, int idDetalleProduccion, String? motivo
});




}
/// @nodoc
class _$MovimientoInventarioInsumoCopyWithImpl<$Res>
    implements $MovimientoInventarioInsumoCopyWith<$Res> {
  _$MovimientoInventarioInsumoCopyWithImpl(this._self, this._then);

  final MovimientoInventarioInsumo _self;
  final $Res Function(MovimientoInventarioInsumo) _then;

/// Create a copy of MovimientoInventarioInsumo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? idInsumo = null,Object? tipo = freezed,Object? cantidad = null,Object? fecha = null,Object? idDetalleCompra = null,Object? idDetalleProduccion = null,Object? motivo = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idInsumo: null == idInsumo ? _self.idInsumo : idInsumo // ignore: cast_nullable_to_non_nullable
as int,tipo: freezed == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as String?,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,idDetalleCompra: null == idDetalleCompra ? _self.idDetalleCompra : idDetalleCompra // ignore: cast_nullable_to_non_nullable
as int,idDetalleProduccion: null == idDetalleProduccion ? _self.idDetalleProduccion : idDetalleProduccion // ignore: cast_nullable_to_non_nullable
as int,motivo: freezed == motivo ? _self.motivo : motivo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MovimientoInventarioInsumo].
extension MovimientoInventarioInsumoPatterns on MovimientoInventarioInsumo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovimientoInventarioInsumo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovimientoInventarioInsumo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovimientoInventarioInsumo value)  $default,){
final _that = this;
switch (_that) {
case _MovimientoInventarioInsumo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovimientoInventarioInsumo value)?  $default,){
final _that = this;
switch (_that) {
case _MovimientoInventarioInsumo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int idInsumo,  String? tipo,  int cantidad,  DateTime fecha,  int idDetalleCompra,  int idDetalleProduccion,  String? motivo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovimientoInventarioInsumo() when $default != null:
return $default(_that.id,_that.idInsumo,_that.tipo,_that.cantidad,_that.fecha,_that.idDetalleCompra,_that.idDetalleProduccion,_that.motivo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int idInsumo,  String? tipo,  int cantidad,  DateTime fecha,  int idDetalleCompra,  int idDetalleProduccion,  String? motivo)  $default,) {final _that = this;
switch (_that) {
case _MovimientoInventarioInsumo():
return $default(_that.id,_that.idInsumo,_that.tipo,_that.cantidad,_that.fecha,_that.idDetalleCompra,_that.idDetalleProduccion,_that.motivo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int idInsumo,  String? tipo,  int cantidad,  DateTime fecha,  int idDetalleCompra,  int idDetalleProduccion,  String? motivo)?  $default,) {final _that = this;
switch (_that) {
case _MovimientoInventarioInsumo() when $default != null:
return $default(_that.id,_that.idInsumo,_that.tipo,_that.cantidad,_that.fecha,_that.idDetalleCompra,_that.idDetalleProduccion,_that.motivo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovimientoInventarioInsumo implements MovimientoInventarioInsumo {
  const _MovimientoInventarioInsumo({this.id, required this.idInsumo, this.tipo, required this.cantidad, required this.fecha, required this.idDetalleCompra, required this.idDetalleProduccion, this.motivo});
  factory _MovimientoInventarioInsumo.fromJson(Map<String, dynamic> json) => _$MovimientoInventarioInsumoFromJson(json);

@override final  int? id;
@override final  int idInsumo;
@override final  String? tipo;
@override final  int cantidad;
@override final  DateTime fecha;
@override final  int idDetalleCompra;
@override final  int idDetalleProduccion;
@override final  String? motivo;

/// Create a copy of MovimientoInventarioInsumo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovimientoInventarioInsumoCopyWith<_MovimientoInventarioInsumo> get copyWith => __$MovimientoInventarioInsumoCopyWithImpl<_MovimientoInventarioInsumo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovimientoInventarioInsumoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovimientoInventarioInsumo&&(identical(other.id, id) || other.id == id)&&(identical(other.idInsumo, idInsumo) || other.idInsumo == idInsumo)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.idDetalleCompra, idDetalleCompra) || other.idDetalleCompra == idDetalleCompra)&&(identical(other.idDetalleProduccion, idDetalleProduccion) || other.idDetalleProduccion == idDetalleProduccion)&&(identical(other.motivo, motivo) || other.motivo == motivo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idInsumo,tipo,cantidad,fecha,idDetalleCompra,idDetalleProduccion,motivo);

@override
String toString() {
  return 'MovimientoInventarioInsumo(id: $id, idInsumo: $idInsumo, tipo: $tipo, cantidad: $cantidad, fecha: $fecha, idDetalleCompra: $idDetalleCompra, idDetalleProduccion: $idDetalleProduccion, motivo: $motivo)';
}


}

/// @nodoc
abstract mixin class _$MovimientoInventarioInsumoCopyWith<$Res> implements $MovimientoInventarioInsumoCopyWith<$Res> {
  factory _$MovimientoInventarioInsumoCopyWith(_MovimientoInventarioInsumo value, $Res Function(_MovimientoInventarioInsumo) _then) = __$MovimientoInventarioInsumoCopyWithImpl;
@override @useResult
$Res call({
 int? id, int idInsumo, String? tipo, int cantidad, DateTime fecha, int idDetalleCompra, int idDetalleProduccion, String? motivo
});




}
/// @nodoc
class __$MovimientoInventarioInsumoCopyWithImpl<$Res>
    implements _$MovimientoInventarioInsumoCopyWith<$Res> {
  __$MovimientoInventarioInsumoCopyWithImpl(this._self, this._then);

  final _MovimientoInventarioInsumo _self;
  final $Res Function(_MovimientoInventarioInsumo) _then;

/// Create a copy of MovimientoInventarioInsumo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? idInsumo = null,Object? tipo = freezed,Object? cantidad = null,Object? fecha = null,Object? idDetalleCompra = null,Object? idDetalleProduccion = null,Object? motivo = freezed,}) {
  return _then(_MovimientoInventarioInsumo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idInsumo: null == idInsumo ? _self.idInsumo : idInsumo // ignore: cast_nullable_to_non_nullable
as int,tipo: freezed == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as String?,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,idDetalleCompra: null == idDetalleCompra ? _self.idDetalleCompra : idDetalleCompra // ignore: cast_nullable_to_non_nullable
as int,idDetalleProduccion: null == idDetalleProduccion ? _self.idDetalleProduccion : idDetalleProduccion // ignore: cast_nullable_to_non_nullable
as int,motivo: freezed == motivo ? _self.motivo : motivo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
