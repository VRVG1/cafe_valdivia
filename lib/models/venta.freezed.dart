// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'venta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Venta {

@JsonKey(name: 'id_venta') int? get id; int get idCliente; DateTime get fecha; String? get detalles; bool? get pagado; String? get estado;
/// Create a copy of Venta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentaCopyWith<Venta> get copyWith => _$VentaCopyWithImpl<Venta>(this as Venta, _$identity);

  /// Serializes this Venta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Venta&&(identical(other.id, id) || other.id == id)&&(identical(other.idCliente, idCliente) || other.idCliente == idCliente)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.detalles, detalles) || other.detalles == detalles)&&(identical(other.pagado, pagado) || other.pagado == pagado)&&(identical(other.estado, estado) || other.estado == estado));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idCliente,fecha,detalles,pagado,estado);

@override
String toString() {
  return 'Venta(id: $id, idCliente: $idCliente, fecha: $fecha, detalles: $detalles, pagado: $pagado, estado: $estado)';
}


}

/// @nodoc
abstract mixin class $VentaCopyWith<$Res>  {
  factory $VentaCopyWith(Venta value, $Res Function(Venta) _then) = _$VentaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_venta') int? id, int idCliente, DateTime fecha, String? detalles, bool? pagado, String? estado
});




}
/// @nodoc
class _$VentaCopyWithImpl<$Res>
    implements $VentaCopyWith<$Res> {
  _$VentaCopyWithImpl(this._self, this._then);

  final Venta _self;
  final $Res Function(Venta) _then;

/// Create a copy of Venta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? idCliente = null,Object? fecha = null,Object? detalles = freezed,Object? pagado = freezed,Object? estado = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idCliente: null == idCliente ? _self.idCliente : idCliente // ignore: cast_nullable_to_non_nullable
as int,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,detalles: freezed == detalles ? _self.detalles : detalles // ignore: cast_nullable_to_non_nullable
as String?,pagado: freezed == pagado ? _self.pagado : pagado // ignore: cast_nullable_to_non_nullable
as bool?,estado: freezed == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Venta].
extension VentaPatterns on Venta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Venta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Venta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Venta value)  $default,){
final _that = this;
switch (_that) {
case _Venta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Venta value)?  $default,){
final _that = this;
switch (_that) {
case _Venta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_venta')  int? id,  int idCliente,  DateTime fecha,  String? detalles,  bool? pagado,  String? estado)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Venta() when $default != null:
return $default(_that.id,_that.idCliente,_that.fecha,_that.detalles,_that.pagado,_that.estado);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_venta')  int? id,  int idCliente,  DateTime fecha,  String? detalles,  bool? pagado,  String? estado)  $default,) {final _that = this;
switch (_that) {
case _Venta():
return $default(_that.id,_that.idCliente,_that.fecha,_that.detalles,_that.pagado,_that.estado);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id_venta')  int? id,  int idCliente,  DateTime fecha,  String? detalles,  bool? pagado,  String? estado)?  $default,) {final _that = this;
switch (_that) {
case _Venta() when $default != null:
return $default(_that.id,_that.idCliente,_that.fecha,_that.detalles,_that.pagado,_that.estado);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Venta implements Venta {
  const _Venta({@JsonKey(name: 'id_venta') this.id, required this.idCliente, required this.fecha, this.detalles, this.pagado, this.estado});
  factory _Venta.fromJson(Map<String, dynamic> json) => _$VentaFromJson(json);

@override@JsonKey(name: 'id_venta') final  int? id;
@override final  int idCliente;
@override final  DateTime fecha;
@override final  String? detalles;
@override final  bool? pagado;
@override final  String? estado;

/// Create a copy of Venta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentaCopyWith<_Venta> get copyWith => __$VentaCopyWithImpl<_Venta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Venta&&(identical(other.id, id) || other.id == id)&&(identical(other.idCliente, idCliente) || other.idCliente == idCliente)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.detalles, detalles) || other.detalles == detalles)&&(identical(other.pagado, pagado) || other.pagado == pagado)&&(identical(other.estado, estado) || other.estado == estado));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idCliente,fecha,detalles,pagado,estado);

@override
String toString() {
  return 'Venta(id: $id, idCliente: $idCliente, fecha: $fecha, detalles: $detalles, pagado: $pagado, estado: $estado)';
}


}

/// @nodoc
abstract mixin class _$VentaCopyWith<$Res> implements $VentaCopyWith<$Res> {
  factory _$VentaCopyWith(_Venta value, $Res Function(_Venta) _then) = __$VentaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_venta') int? id, int idCliente, DateTime fecha, String? detalles, bool? pagado, String? estado
});




}
/// @nodoc
class __$VentaCopyWithImpl<$Res>
    implements _$VentaCopyWith<$Res> {
  __$VentaCopyWithImpl(this._self, this._then);

  final _Venta _self;
  final $Res Function(_Venta) _then;

/// Create a copy of Venta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? idCliente = null,Object? fecha = null,Object? detalles = freezed,Object? pagado = freezed,Object? estado = freezed,}) {
  return _then(_Venta(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idCliente: null == idCliente ? _self.idCliente : idCliente // ignore: cast_nullable_to_non_nullable
as int,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,detalles: freezed == detalles ? _self.detalles : detalles // ignore: cast_nullable_to_non_nullable
as String?,pagado: freezed == pagado ? _self.pagado : pagado // ignore: cast_nullable_to_non_nullable
as bool?,estado: freezed == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
