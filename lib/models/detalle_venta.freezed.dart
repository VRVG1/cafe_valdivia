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

@JsonKey(name: 'id_detalle_venta') int? get id; int get idVenta; int get idProducto; int get cantidad; String get precioUnitario;
/// Create a copy of DetalleVenta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetalleVentaCopyWith<DetalleVenta> get copyWith => _$DetalleVentaCopyWithImpl<DetalleVenta>(this as DetalleVenta, _$identity);

  /// Serializes this DetalleVenta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetalleVenta&&(identical(other.id, id) || other.id == id)&&(identical(other.idVenta, idVenta) || other.idVenta == idVenta)&&(identical(other.idProducto, idProducto) || other.idProducto == idProducto)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.precioUnitario, precioUnitario) || other.precioUnitario == precioUnitario));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idVenta,idProducto,cantidad,precioUnitario);

@override
String toString() {
  return 'DetalleVenta(id: $id, idVenta: $idVenta, idProducto: $idProducto, cantidad: $cantidad, precioUnitario: $precioUnitario)';
}


}

/// @nodoc
abstract mixin class $DetalleVentaCopyWith<$Res>  {
  factory $DetalleVentaCopyWith(DetalleVenta value, $Res Function(DetalleVenta) _then) = _$DetalleVentaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_detalle_venta') int? id, int idVenta, int idProducto, int cantidad, String precioUnitario
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? idVenta = null,Object? idProducto = null,Object? cantidad = null,Object? precioUnitario = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idVenta: null == idVenta ? _self.idVenta : idVenta // ignore: cast_nullable_to_non_nullable
as int,idProducto: null == idProducto ? _self.idProducto : idProducto // ignore: cast_nullable_to_non_nullable
as int,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,precioUnitario: null == precioUnitario ? _self.precioUnitario : precioUnitario // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_detalle_venta')  int? id,  int idVenta,  int idProducto,  int cantidad,  String precioUnitario)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetalleVenta() when $default != null:
return $default(_that.id,_that.idVenta,_that.idProducto,_that.cantidad,_that.precioUnitario);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_detalle_venta')  int? id,  int idVenta,  int idProducto,  int cantidad,  String precioUnitario)  $default,) {final _that = this;
switch (_that) {
case _DetalleVenta():
return $default(_that.id,_that.idVenta,_that.idProducto,_that.cantidad,_that.precioUnitario);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id_detalle_venta')  int? id,  int idVenta,  int idProducto,  int cantidad,  String precioUnitario)?  $default,) {final _that = this;
switch (_that) {
case _DetalleVenta() when $default != null:
return $default(_that.id,_that.idVenta,_that.idProducto,_that.cantidad,_that.precioUnitario);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetalleVenta implements DetalleVenta {
  const _DetalleVenta({@JsonKey(name: 'id_detalle_venta') this.id, required this.idVenta, required this.idProducto, required this.cantidad, required this.precioUnitario});
  factory _DetalleVenta.fromJson(Map<String, dynamic> json) => _$DetalleVentaFromJson(json);

@override@JsonKey(name: 'id_detalle_venta') final  int? id;
@override final  int idVenta;
@override final  int idProducto;
@override final  int cantidad;
@override final  String precioUnitario;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetalleVenta&&(identical(other.id, id) || other.id == id)&&(identical(other.idVenta, idVenta) || other.idVenta == idVenta)&&(identical(other.idProducto, idProducto) || other.idProducto == idProducto)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.precioUnitario, precioUnitario) || other.precioUnitario == precioUnitario));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idVenta,idProducto,cantidad,precioUnitario);

@override
String toString() {
  return 'DetalleVenta(id: $id, idVenta: $idVenta, idProducto: $idProducto, cantidad: $cantidad, precioUnitario: $precioUnitario)';
}


}

/// @nodoc
abstract mixin class _$DetalleVentaCopyWith<$Res> implements $DetalleVentaCopyWith<$Res> {
  factory _$DetalleVentaCopyWith(_DetalleVenta value, $Res Function(_DetalleVenta) _then) = __$DetalleVentaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_detalle_venta') int? id, int idVenta, int idProducto, int cantidad, String precioUnitario
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? idVenta = null,Object? idProducto = null,Object? cantidad = null,Object? precioUnitario = null,}) {
  return _then(_DetalleVenta(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idVenta: null == idVenta ? _self.idVenta : idVenta // ignore: cast_nullable_to_non_nullable
as int,idProducto: null == idProducto ? _self.idProducto : idProducto // ignore: cast_nullable_to_non_nullable
as int,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,precioUnitario: null == precioUnitario ? _self.precioUnitario : precioUnitario // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
