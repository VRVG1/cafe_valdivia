// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movimiento_inventario_producto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovimientoInventarioProducto {

@JsonKey(name: 'id_movimiento_inventario_producto') int? get id; int get idProducto; String? get tipo; int get cantidad; DateTime get fecha; int get idDetalleVenta; int get idDetalleProduccion; String? get motivo;
/// Create a copy of MovimientoInventarioProducto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovimientoInventarioProductoCopyWith<MovimientoInventarioProducto> get copyWith => _$MovimientoInventarioProductoCopyWithImpl<MovimientoInventarioProducto>(this as MovimientoInventarioProducto, _$identity);

  /// Serializes this MovimientoInventarioProducto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovimientoInventarioProducto&&(identical(other.id, id) || other.id == id)&&(identical(other.idProducto, idProducto) || other.idProducto == idProducto)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.idDetalleVenta, idDetalleVenta) || other.idDetalleVenta == idDetalleVenta)&&(identical(other.idDetalleProduccion, idDetalleProduccion) || other.idDetalleProduccion == idDetalleProduccion)&&(identical(other.motivo, motivo) || other.motivo == motivo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idProducto,tipo,cantidad,fecha,idDetalleVenta,idDetalleProduccion,motivo);

@override
String toString() {
  return 'MovimientoInventarioProducto(id: $id, idProducto: $idProducto, tipo: $tipo, cantidad: $cantidad, fecha: $fecha, idDetalleVenta: $idDetalleVenta, idDetalleProduccion: $idDetalleProduccion, motivo: $motivo)';
}


}

/// @nodoc
abstract mixin class $MovimientoInventarioProductoCopyWith<$Res>  {
  factory $MovimientoInventarioProductoCopyWith(MovimientoInventarioProducto value, $Res Function(MovimientoInventarioProducto) _then) = _$MovimientoInventarioProductoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_movimiento_inventario_producto') int? id, int idProducto, String? tipo, int cantidad, DateTime fecha, int idDetalleVenta, int idDetalleProduccion, String? motivo
});




}
/// @nodoc
class _$MovimientoInventarioProductoCopyWithImpl<$Res>
    implements $MovimientoInventarioProductoCopyWith<$Res> {
  _$MovimientoInventarioProductoCopyWithImpl(this._self, this._then);

  final MovimientoInventarioProducto _self;
  final $Res Function(MovimientoInventarioProducto) _then;

/// Create a copy of MovimientoInventarioProducto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? idProducto = null,Object? tipo = freezed,Object? cantidad = null,Object? fecha = null,Object? idDetalleVenta = null,Object? idDetalleProduccion = null,Object? motivo = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idProducto: null == idProducto ? _self.idProducto : idProducto // ignore: cast_nullable_to_non_nullable
as int,tipo: freezed == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as String?,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,idDetalleVenta: null == idDetalleVenta ? _self.idDetalleVenta : idDetalleVenta // ignore: cast_nullable_to_non_nullable
as int,idDetalleProduccion: null == idDetalleProduccion ? _self.idDetalleProduccion : idDetalleProduccion // ignore: cast_nullable_to_non_nullable
as int,motivo: freezed == motivo ? _self.motivo : motivo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MovimientoInventarioProducto].
extension MovimientoInventarioProductoPatterns on MovimientoInventarioProducto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovimientoInventarioProducto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovimientoInventarioProducto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovimientoInventarioProducto value)  $default,){
final _that = this;
switch (_that) {
case _MovimientoInventarioProducto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovimientoInventarioProducto value)?  $default,){
final _that = this;
switch (_that) {
case _MovimientoInventarioProducto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_movimiento_inventario_producto')  int? id,  int idProducto,  String? tipo,  int cantidad,  DateTime fecha,  int idDetalleVenta,  int idDetalleProduccion,  String? motivo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovimientoInventarioProducto() when $default != null:
return $default(_that.id,_that.idProducto,_that.tipo,_that.cantidad,_that.fecha,_that.idDetalleVenta,_that.idDetalleProduccion,_that.motivo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_movimiento_inventario_producto')  int? id,  int idProducto,  String? tipo,  int cantidad,  DateTime fecha,  int idDetalleVenta,  int idDetalleProduccion,  String? motivo)  $default,) {final _that = this;
switch (_that) {
case _MovimientoInventarioProducto():
return $default(_that.id,_that.idProducto,_that.tipo,_that.cantidad,_that.fecha,_that.idDetalleVenta,_that.idDetalleProduccion,_that.motivo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id_movimiento_inventario_producto')  int? id,  int idProducto,  String? tipo,  int cantidad,  DateTime fecha,  int idDetalleVenta,  int idDetalleProduccion,  String? motivo)?  $default,) {final _that = this;
switch (_that) {
case _MovimientoInventarioProducto() when $default != null:
return $default(_that.id,_that.idProducto,_that.tipo,_that.cantidad,_that.fecha,_that.idDetalleVenta,_that.idDetalleProduccion,_that.motivo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovimientoInventarioProducto implements MovimientoInventarioProducto {
  const _MovimientoInventarioProducto({@JsonKey(name: 'id_movimiento_inventario_producto') this.id, required this.idProducto, this.tipo, required this.cantidad, required this.fecha, required this.idDetalleVenta, required this.idDetalleProduccion, this.motivo});
  factory _MovimientoInventarioProducto.fromJson(Map<String, dynamic> json) => _$MovimientoInventarioProductoFromJson(json);

@override@JsonKey(name: 'id_movimiento_inventario_producto') final  int? id;
@override final  int idProducto;
@override final  String? tipo;
@override final  int cantidad;
@override final  DateTime fecha;
@override final  int idDetalleVenta;
@override final  int idDetalleProduccion;
@override final  String? motivo;

/// Create a copy of MovimientoInventarioProducto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovimientoInventarioProductoCopyWith<_MovimientoInventarioProducto> get copyWith => __$MovimientoInventarioProductoCopyWithImpl<_MovimientoInventarioProducto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovimientoInventarioProductoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovimientoInventarioProducto&&(identical(other.id, id) || other.id == id)&&(identical(other.idProducto, idProducto) || other.idProducto == idProducto)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.idDetalleVenta, idDetalleVenta) || other.idDetalleVenta == idDetalleVenta)&&(identical(other.idDetalleProduccion, idDetalleProduccion) || other.idDetalleProduccion == idDetalleProduccion)&&(identical(other.motivo, motivo) || other.motivo == motivo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idProducto,tipo,cantidad,fecha,idDetalleVenta,idDetalleProduccion,motivo);

@override
String toString() {
  return 'MovimientoInventarioProducto(id: $id, idProducto: $idProducto, tipo: $tipo, cantidad: $cantidad, fecha: $fecha, idDetalleVenta: $idDetalleVenta, idDetalleProduccion: $idDetalleProduccion, motivo: $motivo)';
}


}

/// @nodoc
abstract mixin class _$MovimientoInventarioProductoCopyWith<$Res> implements $MovimientoInventarioProductoCopyWith<$Res> {
  factory _$MovimientoInventarioProductoCopyWith(_MovimientoInventarioProducto value, $Res Function(_MovimientoInventarioProducto) _then) = __$MovimientoInventarioProductoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_movimiento_inventario_producto') int? id, int idProducto, String? tipo, int cantidad, DateTime fecha, int idDetalleVenta, int idDetalleProduccion, String? motivo
});




}
/// @nodoc
class __$MovimientoInventarioProductoCopyWithImpl<$Res>
    implements _$MovimientoInventarioProductoCopyWith<$Res> {
  __$MovimientoInventarioProductoCopyWithImpl(this._self, this._then);

  final _MovimientoInventarioProducto _self;
  final $Res Function(_MovimientoInventarioProducto) _then;

/// Create a copy of MovimientoInventarioProducto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? idProducto = null,Object? tipo = freezed,Object? cantidad = null,Object? fecha = null,Object? idDetalleVenta = null,Object? idDetalleProduccion = null,Object? motivo = freezed,}) {
  return _then(_MovimientoInventarioProducto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idProducto: null == idProducto ? _self.idProducto : idProducto // ignore: cast_nullable_to_non_nullable
as int,tipo: freezed == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as String?,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,idDetalleVenta: null == idDetalleVenta ? _self.idDetalleVenta : idDetalleVenta // ignore: cast_nullable_to_non_nullable
as int,idDetalleProduccion: null == idDetalleProduccion ? _self.idDetalleProduccion : idDetalleProduccion // ignore: cast_nullable_to_non_nullable
as int,motivo: freezed == motivo ? _self.motivo : motivo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
