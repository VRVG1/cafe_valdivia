// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orden_produccion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrdenProduccion {

@JsonKey(name: 'id_orden_produccion') int? get id; int get idProducto; int get cantidad_producida; DateTime get fecha; String get costo_total_produccion; String? get notas;
/// Create a copy of OrdenProduccion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdenProduccionCopyWith<OrdenProduccion> get copyWith => _$OrdenProduccionCopyWithImpl<OrdenProduccion>(this as OrdenProduccion, _$identity);

  /// Serializes this OrdenProduccion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdenProduccion&&(identical(other.id, id) || other.id == id)&&(identical(other.idProducto, idProducto) || other.idProducto == idProducto)&&(identical(other.cantidad_producida, cantidad_producida) || other.cantidad_producida == cantidad_producida)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.costo_total_produccion, costo_total_produccion) || other.costo_total_produccion == costo_total_produccion)&&(identical(other.notas, notas) || other.notas == notas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idProducto,cantidad_producida,fecha,costo_total_produccion,notas);

@override
String toString() {
  return 'OrdenProduccion(id: $id, idProducto: $idProducto, cantidad_producida: $cantidad_producida, fecha: $fecha, costo_total_produccion: $costo_total_produccion, notas: $notas)';
}


}

/// @nodoc
abstract mixin class $OrdenProduccionCopyWith<$Res>  {
  factory $OrdenProduccionCopyWith(OrdenProduccion value, $Res Function(OrdenProduccion) _then) = _$OrdenProduccionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_orden_produccion') int? id, int idProducto, int cantidad_producida, DateTime fecha, String costo_total_produccion, String? notas
});




}
/// @nodoc
class _$OrdenProduccionCopyWithImpl<$Res>
    implements $OrdenProduccionCopyWith<$Res> {
  _$OrdenProduccionCopyWithImpl(this._self, this._then);

  final OrdenProduccion _self;
  final $Res Function(OrdenProduccion) _then;

/// Create a copy of OrdenProduccion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? idProducto = null,Object? cantidad_producida = null,Object? fecha = null,Object? costo_total_produccion = null,Object? notas = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idProducto: null == idProducto ? _self.idProducto : idProducto // ignore: cast_nullable_to_non_nullable
as int,cantidad_producida: null == cantidad_producida ? _self.cantidad_producida : cantidad_producida // ignore: cast_nullable_to_non_nullable
as int,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,costo_total_produccion: null == costo_total_produccion ? _self.costo_total_produccion : costo_total_produccion // ignore: cast_nullable_to_non_nullable
as String,notas: freezed == notas ? _self.notas : notas // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrdenProduccion].
extension OrdenProduccionPatterns on OrdenProduccion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrdenProduccion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrdenProduccion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrdenProduccion value)  $default,){
final _that = this;
switch (_that) {
case _OrdenProduccion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrdenProduccion value)?  $default,){
final _that = this;
switch (_that) {
case _OrdenProduccion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_orden_produccion')  int? id,  int idProducto,  int cantidad_producida,  DateTime fecha,  String costo_total_produccion,  String? notas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrdenProduccion() when $default != null:
return $default(_that.id,_that.idProducto,_that.cantidad_producida,_that.fecha,_that.costo_total_produccion,_that.notas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_orden_produccion')  int? id,  int idProducto,  int cantidad_producida,  DateTime fecha,  String costo_total_produccion,  String? notas)  $default,) {final _that = this;
switch (_that) {
case _OrdenProduccion():
return $default(_that.id,_that.idProducto,_that.cantidad_producida,_that.fecha,_that.costo_total_produccion,_that.notas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id_orden_produccion')  int? id,  int idProducto,  int cantidad_producida,  DateTime fecha,  String costo_total_produccion,  String? notas)?  $default,) {final _that = this;
switch (_that) {
case _OrdenProduccion() when $default != null:
return $default(_that.id,_that.idProducto,_that.cantidad_producida,_that.fecha,_that.costo_total_produccion,_that.notas);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrdenProduccion implements OrdenProduccion {
  const _OrdenProduccion({@JsonKey(name: 'id_orden_produccion') this.id, required this.idProducto, required this.cantidad_producida, required this.fecha, required this.costo_total_produccion, this.notas});
  factory _OrdenProduccion.fromJson(Map<String, dynamic> json) => _$OrdenProduccionFromJson(json);

@override@JsonKey(name: 'id_orden_produccion') final  int? id;
@override final  int idProducto;
@override final  int cantidad_producida;
@override final  DateTime fecha;
@override final  String costo_total_produccion;
@override final  String? notas;

/// Create a copy of OrdenProduccion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrdenProduccionCopyWith<_OrdenProduccion> get copyWith => __$OrdenProduccionCopyWithImpl<_OrdenProduccion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrdenProduccionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdenProduccion&&(identical(other.id, id) || other.id == id)&&(identical(other.idProducto, idProducto) || other.idProducto == idProducto)&&(identical(other.cantidad_producida, cantidad_producida) || other.cantidad_producida == cantidad_producida)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.costo_total_produccion, costo_total_produccion) || other.costo_total_produccion == costo_total_produccion)&&(identical(other.notas, notas) || other.notas == notas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idProducto,cantidad_producida,fecha,costo_total_produccion,notas);

@override
String toString() {
  return 'OrdenProduccion(id: $id, idProducto: $idProducto, cantidad_producida: $cantidad_producida, fecha: $fecha, costo_total_produccion: $costo_total_produccion, notas: $notas)';
}


}

/// @nodoc
abstract mixin class _$OrdenProduccionCopyWith<$Res> implements $OrdenProduccionCopyWith<$Res> {
  factory _$OrdenProduccionCopyWith(_OrdenProduccion value, $Res Function(_OrdenProduccion) _then) = __$OrdenProduccionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_orden_produccion') int? id, int idProducto, int cantidad_producida, DateTime fecha, String costo_total_produccion, String? notas
});




}
/// @nodoc
class __$OrdenProduccionCopyWithImpl<$Res>
    implements _$OrdenProduccionCopyWith<$Res> {
  __$OrdenProduccionCopyWithImpl(this._self, this._then);

  final _OrdenProduccion _self;
  final $Res Function(_OrdenProduccion) _then;

/// Create a copy of OrdenProduccion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? idProducto = null,Object? cantidad_producida = null,Object? fecha = null,Object? costo_total_produccion = null,Object? notas = freezed,}) {
  return _then(_OrdenProduccion(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idProducto: null == idProducto ? _self.idProducto : idProducto // ignore: cast_nullable_to_non_nullable
as int,cantidad_producida: null == cantidad_producida ? _self.cantidad_producida : cantidad_producida // ignore: cast_nullable_to_non_nullable
as int,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,costo_total_produccion: null == costo_total_produccion ? _self.costo_total_produccion : costo_total_produccion // ignore: cast_nullable_to_non_nullable
as String,notas: freezed == notas ? _self.notas : notas // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
