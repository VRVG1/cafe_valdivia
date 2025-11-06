// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detalle_venta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetalleVenta {

@JsonKey(name: 'id_detalle_venta') int? get idDetalleVenta;@JsonKey(name: 'id_venta') int get idVenta;@JsonKey(name: 'id_producto') int get idProducto; int get cantidad;@JsonKey(name: 'precio_unitario_venta') String get precioUnitarioVenta;
/// Create a copy of DetalleVenta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetalleVentaCopyWith<DetalleVenta> get copyWith => _$DetalleVentaCopyWithImpl<DetalleVenta>(this as DetalleVenta, _$identity);

  /// Serializes this DetalleVenta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetalleVenta&&(identical(other.idDetalleVenta, idDetalleVenta) || other.idDetalleVenta == idDetalleVenta)&&(identical(other.idVenta, idVenta) || other.idVenta == idVenta)&&(identical(other.idProducto, idProducto) || other.idProducto == idProducto)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.precioUnitarioVenta, precioUnitarioVenta) || other.precioUnitarioVenta == precioUnitarioVenta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idDetalleVenta,idVenta,idProducto,cantidad,precioUnitarioVenta);

@override
String toString() {
  return 'DetalleVenta(idDetalleVenta: $idDetalleVenta, idVenta: $idVenta, idProducto: $idProducto, cantidad: $cantidad, precioUnitarioVenta: $precioUnitarioVenta)';
}


}

/// @nodoc
abstract mixin class $DetalleVentaCopyWith<$Res>  {
  factory $DetalleVentaCopyWith(DetalleVenta value, $Res Function(DetalleVenta) _then) = _$DetalleVentaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_detalle_venta') int? idDetalleVenta,@JsonKey(name: 'id_venta') int idVenta,@JsonKey(name: 'id_producto') int idProducto, int cantidad,@JsonKey(name: 'precio_unitario_venta') String precioUnitarioVenta
});




}
/// @nodoc
class _$DetalleVentaCopyWithImpl<$Res>
    implements $DetalleVentaCopyWith<$Res> {
  _$DetalleVentaCopyWithImpl(this._self, this._then);

  final DetalleVenta _self;
  final $Res Function(DetalleVenta) _then;

/// Create a copy of DetalleVenta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idDetalleVenta = freezed,Object? idVenta = null,Object? idProducto = null,Object? cantidad = null,Object? precioUnitarioVenta = null,}) {
  return _then(_self.copyWith(
idDetalleVenta: freezed == idDetalleVenta ? _self.idDetalleVenta : idDetalleVenta // ignore: cast_nullable_to_non_nullable
as int?,idVenta: null == idVenta ? _self.idVenta : idVenta // ignore: cast_nullable_to_non_nullable
as int,idProducto: null == idProducto ? _self.idProducto : idProducto // ignore: cast_nullable_to_non_nullable
as int,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,precioUnitarioVenta: null == precioUnitarioVenta ? _self.precioUnitarioVenta : precioUnitarioVenta // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DetalleVenta].
extension DetalleVentaPatterns on DetalleVenta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetalleVenta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetalleVenta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetalleVenta value)  $default,){
final _that = this;
switch (_that) {
case _DetalleVenta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetalleVenta value)?  $default,){
final _that = this;
switch (_that) {
case _DetalleVenta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_detalle_venta')  int? idDetalleVenta, @JsonKey(name: 'id_venta')  int idVenta, @JsonKey(name: 'id_producto')  int idProducto,  int cantidad, @JsonKey(name: 'precio_unitario_venta')  String precioUnitarioVenta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetalleVenta() when $default != null:
return $default(_that.idDetalleVenta,_that.idVenta,_that.idProducto,_that.cantidad,_that.precioUnitarioVenta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_detalle_venta')  int? idDetalleVenta, @JsonKey(name: 'id_venta')  int idVenta, @JsonKey(name: 'id_producto')  int idProducto,  int cantidad, @JsonKey(name: 'precio_unitario_venta')  String precioUnitarioVenta)  $default,) {final _that = this;
switch (_that) {
case _DetalleVenta():
return $default(_that.idDetalleVenta,_that.idVenta,_that.idProducto,_that.cantidad,_that.precioUnitarioVenta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id_detalle_venta')  int? idDetalleVenta, @JsonKey(name: 'id_venta')  int idVenta, @JsonKey(name: 'id_producto')  int idProducto,  int cantidad, @JsonKey(name: 'precio_unitario_venta')  String precioUnitarioVenta)?  $default,) {final _that = this;
switch (_that) {
case _DetalleVenta() when $default != null:
return $default(_that.idDetalleVenta,_that.idVenta,_that.idProducto,_that.cantidad,_that.precioUnitarioVenta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetalleVenta implements DetalleVenta {
  const _DetalleVenta({@JsonKey(name: 'id_detalle_venta') this.idDetalleVenta, @JsonKey(name: 'id_venta') required this.idVenta, @JsonKey(name: 'id_producto') required this.idProducto, required this.cantidad, @JsonKey(name: 'precio_unitario_venta') required this.precioUnitarioVenta});
  factory _DetalleVenta.fromJson(Map<String, dynamic> json) => _$DetalleVentaFromJson(json);

@override@JsonKey(name: 'id_detalle_venta') final  int? idDetalleVenta;
@override@JsonKey(name: 'id_venta') final  int idVenta;
@override@JsonKey(name: 'id_producto') final  int idProducto;
@override final  int cantidad;
@override@JsonKey(name: 'precio_unitario_venta') final  String precioUnitarioVenta;

/// Create a copy of DetalleVenta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetalleVentaCopyWith<_DetalleVenta> get copyWith => __$DetalleVentaCopyWithImpl<_DetalleVenta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetalleVentaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetalleVenta&&(identical(other.idDetalleVenta, idDetalleVenta) || other.idDetalleVenta == idDetalleVenta)&&(identical(other.idVenta, idVenta) || other.idVenta == idVenta)&&(identical(other.idProducto, idProducto) || other.idProducto == idProducto)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.precioUnitarioVenta, precioUnitarioVenta) || other.precioUnitarioVenta == precioUnitarioVenta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idDetalleVenta,idVenta,idProducto,cantidad,precioUnitarioVenta);

@override
String toString() {
  return 'DetalleVenta(idDetalleVenta: $idDetalleVenta, idVenta: $idVenta, idProducto: $idProducto, cantidad: $cantidad, precioUnitarioVenta: $precioUnitarioVenta)';
}


}

/// @nodoc
abstract mixin class _$DetalleVentaCopyWith<$Res> implements $DetalleVentaCopyWith<$Res> {
  factory _$DetalleVentaCopyWith(_DetalleVenta value, $Res Function(_DetalleVenta) _then) = __$DetalleVentaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_detalle_venta') int? idDetalleVenta,@JsonKey(name: 'id_venta') int idVenta,@JsonKey(name: 'id_producto') int idProducto, int cantidad,@JsonKey(name: 'precio_unitario_venta') String precioUnitarioVenta
});




}
/// @nodoc
class __$DetalleVentaCopyWithImpl<$Res>
    implements _$DetalleVentaCopyWith<$Res> {
  __$DetalleVentaCopyWithImpl(this._self, this._then);

  final _DetalleVenta _self;
  final $Res Function(_DetalleVenta) _then;

/// Create a copy of DetalleVenta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idDetalleVenta = freezed,Object? idVenta = null,Object? idProducto = null,Object? cantidad = null,Object? precioUnitarioVenta = null,}) {
  return _then(_DetalleVenta(
idDetalleVenta: freezed == idDetalleVenta ? _self.idDetalleVenta : idDetalleVenta // ignore: cast_nullable_to_non_nullable
as int?,idVenta: null == idVenta ? _self.idVenta : idVenta // ignore: cast_nullable_to_non_nullable
as int,idProducto: null == idProducto ? _self.idProducto : idProducto // ignore: cast_nullable_to_non_nullable
as int,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,precioUnitarioVenta: null == precioUnitarioVenta ? _self.precioUnitarioVenta : precioUnitarioVenta // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
