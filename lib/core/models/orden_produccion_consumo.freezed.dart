// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orden_produccion_consumo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrdenProduccionConsumo {

@JsonKey(name: 'id_consumo') int? get idConsumo;@JsonKey(name: 'id_orden_produccion ') int get idOrdenProduccion;@JsonKey(name: 'id_articulo') int get idArticulo;@JsonKey(name: 'cantidad_usada') String get cantidadUsada;@JsonKey(name: 'costo_articulo_momento') double get costoArticuloMomento; String? get notas;
/// Create a copy of OrdenProduccionConsumo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdenProduccionConsumoCopyWith<OrdenProduccionConsumo> get copyWith => _$OrdenProduccionConsumoCopyWithImpl<OrdenProduccionConsumo>(this as OrdenProduccionConsumo, _$identity);

  /// Serializes this OrdenProduccionConsumo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdenProduccionConsumo&&(identical(other.idConsumo, idConsumo) || other.idConsumo == idConsumo)&&(identical(other.idOrdenProduccion, idOrdenProduccion) || other.idOrdenProduccion == idOrdenProduccion)&&(identical(other.idArticulo, idArticulo) || other.idArticulo == idArticulo)&&(identical(other.cantidadUsada, cantidadUsada) || other.cantidadUsada == cantidadUsada)&&(identical(other.costoArticuloMomento, costoArticuloMomento) || other.costoArticuloMomento == costoArticuloMomento)&&(identical(other.notas, notas) || other.notas == notas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idConsumo,idOrdenProduccion,idArticulo,cantidadUsada,costoArticuloMomento,notas);

@override
String toString() {
  return 'OrdenProduccionConsumo(idConsumo: $idConsumo, idOrdenProduccion: $idOrdenProduccion, idArticulo: $idArticulo, cantidadUsada: $cantidadUsada, costoArticuloMomento: $costoArticuloMomento, notas: $notas)';
}


}

/// @nodoc
abstract mixin class $OrdenProduccionConsumoCopyWith<$Res> implements $OrdenProduccionConsumoCopyWith<$Res> {
  factory $OrdenProduccionConsumoCopyWith(OrdenProduccionConsumo value, $Res Function(OrdenProduccionConsumo) _then) = _$OrdenProduccionConsumoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_consumo') int? idConsumo,@JsonKey(name: 'id_orden_produccion ') int idOrdenProduccion,@JsonKey(name: 'id_articulo') int idArticulo,@JsonKey(name: 'cantidad_usada') String cantidadUsada,@JsonKey(name: 'costo_articulo_momento') double costoArticuloMomento, String? notas
});




}
/// @nodoc
class _$OrdenProduccionConsumoCopyWithImpl<$Res>
    implements $OrdenProduccionConsumoCopyWith<$Res> {
  _$OrdenProduccionConsumoCopyWithImpl(this._self, this._then);

  final OrdenProduccionConsumo _self;
  final $Res Function(OrdenProduccionConsumo) _then;

/// Create a copy of OrdenProduccionConsumo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idConsumo = freezed,Object? idOrdenProduccion = null,Object? idArticulo = null,Object? cantidadUsada = null,Object? costoArticuloMomento = null,Object? notas = freezed,}) {
  return _then(_self.copyWith(
idConsumo: freezed == idConsumo ? _self.idConsumo : idConsumo // ignore: cast_nullable_to_non_nullable
as int?,idOrdenProduccion: null == idOrdenProduccion ? _self.idOrdenProduccion : idOrdenProduccion // ignore: cast_nullable_to_non_nullable
as int,idArticulo: null == idArticulo ? _self.idArticulo : idArticulo // ignore: cast_nullable_to_non_nullable
as int,cantidadUsada: null == cantidadUsada ? _self.cantidadUsada : cantidadUsada // ignore: cast_nullable_to_non_nullable
as String,costoArticuloMomento: null == costoArticuloMomento ? _self.costoArticuloMomento : costoArticuloMomento // ignore: cast_nullable_to_non_nullable
as double,notas: freezed == notas ? _self.notas : notas // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrdenProduccionConsumo].
extension OrdenProduccionConsumoPatterns on OrdenProduccionConsumo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( OrdenProduccionConsumo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case OrdenProduccionConsumo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( OrdenProduccionConsumo value)  $default,){
final _that = this;
switch (_that) {
case OrdenProduccionConsumo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( OrdenProduccionConsumo value)?  $default,){
final _that = this;
switch (_that) {
case OrdenProduccionConsumo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_consumo')  int? idConsumo, @JsonKey(name: 'id_orden_produccion ')  int idOrdenProduccion, @JsonKey(name: 'id_articulo')  int idArticulo, @JsonKey(name: 'cantidad_usada')  String cantidadUsada, @JsonKey(name: 'costo_articulo_momento')  double costoArticuloMomento,  String? notas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case OrdenProduccionConsumo() when $default != null:
return $default(_that.idConsumo,_that.idOrdenProduccion,_that.idArticulo,_that.cantidadUsada,_that.costoArticuloMomento,_that.notas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_consumo')  int? idConsumo, @JsonKey(name: 'id_orden_produccion ')  int idOrdenProduccion, @JsonKey(name: 'id_articulo')  int idArticulo, @JsonKey(name: 'cantidad_usada')  String cantidadUsada, @JsonKey(name: 'costo_articulo_momento')  double costoArticuloMomento,  String? notas)  $default,) {final _that = this;
switch (_that) {
case OrdenProduccionConsumo():
return $default(_that.idConsumo,_that.idOrdenProduccion,_that.idArticulo,_that.cantidadUsada,_that.costoArticuloMomento,_that.notas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id_consumo')  int? idConsumo, @JsonKey(name: 'id_orden_produccion ')  int idOrdenProduccion, @JsonKey(name: 'id_articulo')  int idArticulo, @JsonKey(name: 'cantidad_usada')  String cantidadUsada, @JsonKey(name: 'costo_articulo_momento')  double costoArticuloMomento,  String? notas)?  $default,) {final _that = this;
switch (_that) {
case OrdenProduccionConsumo() when $default != null:
return $default(_that.idConsumo,_that.idOrdenProduccion,_that.idArticulo,_that.cantidadUsada,_that.costoArticuloMomento,_that.notas);case _:
  return null;

}
}

}


// dart format on
