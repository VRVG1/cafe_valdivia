// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detalle_produccion_insumo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetalleProduccionInsumo {

@JsonKey(name: 'id_detalle_produccion_insumo') int? get idDetalleProduccionInsumo;@JsonKey(name: 'id_orden_produccion') int get idOrdenProduccion;@JsonKey(name: 'id_insumo') int get idInsumo;@JsonKey(name: 'costo_insumo_momento') String get costoInsumoMomento;
/// Create a copy of DetalleProduccionInsumo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetalleProduccionInsumoCopyWith<DetalleProduccionInsumo> get copyWith => _$DetalleProduccionInsumoCopyWithImpl<DetalleProduccionInsumo>(this as DetalleProduccionInsumo, _$identity);

  /// Serializes this DetalleProduccionInsumo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetalleProduccionInsumo&&(identical(other.idDetalleProduccionInsumo, idDetalleProduccionInsumo) || other.idDetalleProduccionInsumo == idDetalleProduccionInsumo)&&(identical(other.idOrdenProduccion, idOrdenProduccion) || other.idOrdenProduccion == idOrdenProduccion)&&(identical(other.idInsumo, idInsumo) || other.idInsumo == idInsumo)&&(identical(other.costoInsumoMomento, costoInsumoMomento) || other.costoInsumoMomento == costoInsumoMomento));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idDetalleProduccionInsumo,idOrdenProduccion,idInsumo,costoInsumoMomento);

@override
String toString() {
  return 'DetalleProduccionInsumo(idDetalleProduccionInsumo: $idDetalleProduccionInsumo, idOrdenProduccion: $idOrdenProduccion, idInsumo: $idInsumo, costoInsumoMomento: $costoInsumoMomento)';
}


}

/// @nodoc
abstract mixin class $DetalleProduccionInsumoCopyWith<$Res>  {
  factory $DetalleProduccionInsumoCopyWith(DetalleProduccionInsumo value, $Res Function(DetalleProduccionInsumo) _then) = _$DetalleProduccionInsumoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_detalle_produccion_insumo') int? idDetalleProduccionInsumo,@JsonKey(name: 'id_orden_produccion') int idOrdenProduccion,@JsonKey(name: 'id_insumo') int idInsumo,@JsonKey(name: 'costo_insumo_momento') String costoInsumoMomento
});




}
/// @nodoc
class _$DetalleProduccionInsumoCopyWithImpl<$Res>
    implements $DetalleProduccionInsumoCopyWith<$Res> {
  _$DetalleProduccionInsumoCopyWithImpl(this._self, this._then);

  final DetalleProduccionInsumo _self;
  final $Res Function(DetalleProduccionInsumo) _then;

/// Create a copy of DetalleProduccionInsumo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idDetalleProduccionInsumo = freezed,Object? idOrdenProduccion = null,Object? idInsumo = null,Object? costoInsumoMomento = null,}) {
  return _then(_self.copyWith(
idDetalleProduccionInsumo: freezed == idDetalleProduccionInsumo ? _self.idDetalleProduccionInsumo : idDetalleProduccionInsumo // ignore: cast_nullable_to_non_nullable
as int?,idOrdenProduccion: null == idOrdenProduccion ? _self.idOrdenProduccion : idOrdenProduccion // ignore: cast_nullable_to_non_nullable
as int,idInsumo: null == idInsumo ? _self.idInsumo : idInsumo // ignore: cast_nullable_to_non_nullable
as int,costoInsumoMomento: null == costoInsumoMomento ? _self.costoInsumoMomento : costoInsumoMomento // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DetalleProduccionInsumo].
extension DetalleProduccionInsumoPatterns on DetalleProduccionInsumo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetalleProduccionInsumo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetalleProduccionInsumo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetalleProduccionInsumo value)  $default,){
final _that = this;
switch (_that) {
case _DetalleProduccionInsumo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetalleProduccionInsumo value)?  $default,){
final _that = this;
switch (_that) {
case _DetalleProduccionInsumo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_detalle_produccion_insumo')  int? idDetalleProduccionInsumo, @JsonKey(name: 'id_orden_produccion')  int idOrdenProduccion, @JsonKey(name: 'id_insumo')  int idInsumo, @JsonKey(name: 'costo_insumo_momento')  String costoInsumoMomento)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetalleProduccionInsumo() when $default != null:
return $default(_that.idDetalleProduccionInsumo,_that.idOrdenProduccion,_that.idInsumo,_that.costoInsumoMomento);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_detalle_produccion_insumo')  int? idDetalleProduccionInsumo, @JsonKey(name: 'id_orden_produccion')  int idOrdenProduccion, @JsonKey(name: 'id_insumo')  int idInsumo, @JsonKey(name: 'costo_insumo_momento')  String costoInsumoMomento)  $default,) {final _that = this;
switch (_that) {
case _DetalleProduccionInsumo():
return $default(_that.idDetalleProduccionInsumo,_that.idOrdenProduccion,_that.idInsumo,_that.costoInsumoMomento);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id_detalle_produccion_insumo')  int? idDetalleProduccionInsumo, @JsonKey(name: 'id_orden_produccion')  int idOrdenProduccion, @JsonKey(name: 'id_insumo')  int idInsumo, @JsonKey(name: 'costo_insumo_momento')  String costoInsumoMomento)?  $default,) {final _that = this;
switch (_that) {
case _DetalleProduccionInsumo() when $default != null:
return $default(_that.idDetalleProduccionInsumo,_that.idOrdenProduccion,_that.idInsumo,_that.costoInsumoMomento);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetalleProduccionInsumo implements DetalleProduccionInsumo {
  const _DetalleProduccionInsumo({@JsonKey(name: 'id_detalle_produccion_insumo') this.idDetalleProduccionInsumo, @JsonKey(name: 'id_orden_produccion') required this.idOrdenProduccion, @JsonKey(name: 'id_insumo') required this.idInsumo, @JsonKey(name: 'costo_insumo_momento') required this.costoInsumoMomento});
  factory _DetalleProduccionInsumo.fromJson(Map<String, dynamic> json) => _$DetalleProduccionInsumoFromJson(json);

@override@JsonKey(name: 'id_detalle_produccion_insumo') final  int? idDetalleProduccionInsumo;
@override@JsonKey(name: 'id_orden_produccion') final  int idOrdenProduccion;
@override@JsonKey(name: 'id_insumo') final  int idInsumo;
@override@JsonKey(name: 'costo_insumo_momento') final  String costoInsumoMomento;

/// Create a copy of DetalleProduccionInsumo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetalleProduccionInsumoCopyWith<_DetalleProduccionInsumo> get copyWith => __$DetalleProduccionInsumoCopyWithImpl<_DetalleProduccionInsumo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetalleProduccionInsumoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetalleProduccionInsumo&&(identical(other.idDetalleProduccionInsumo, idDetalleProduccionInsumo) || other.idDetalleProduccionInsumo == idDetalleProduccionInsumo)&&(identical(other.idOrdenProduccion, idOrdenProduccion) || other.idOrdenProduccion == idOrdenProduccion)&&(identical(other.idInsumo, idInsumo) || other.idInsumo == idInsumo)&&(identical(other.costoInsumoMomento, costoInsumoMomento) || other.costoInsumoMomento == costoInsumoMomento));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idDetalleProduccionInsumo,idOrdenProduccion,idInsumo,costoInsumoMomento);

@override
String toString() {
  return 'DetalleProduccionInsumo(idDetalleProduccionInsumo: $idDetalleProduccionInsumo, idOrdenProduccion: $idOrdenProduccion, idInsumo: $idInsumo, costoInsumoMomento: $costoInsumoMomento)';
}


}

/// @nodoc
abstract mixin class _$DetalleProduccionInsumoCopyWith<$Res> implements $DetalleProduccionInsumoCopyWith<$Res> {
  factory _$DetalleProduccionInsumoCopyWith(_DetalleProduccionInsumo value, $Res Function(_DetalleProduccionInsumo) _then) = __$DetalleProduccionInsumoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_detalle_produccion_insumo') int? idDetalleProduccionInsumo,@JsonKey(name: 'id_orden_produccion') int idOrdenProduccion,@JsonKey(name: 'id_insumo') int idInsumo,@JsonKey(name: 'costo_insumo_momento') String costoInsumoMomento
});




}
/// @nodoc
class __$DetalleProduccionInsumoCopyWithImpl<$Res>
    implements _$DetalleProduccionInsumoCopyWith<$Res> {
  __$DetalleProduccionInsumoCopyWithImpl(this._self, this._then);

  final _DetalleProduccionInsumo _self;
  final $Res Function(_DetalleProduccionInsumo) _then;

/// Create a copy of DetalleProduccionInsumo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idDetalleProduccionInsumo = freezed,Object? idOrdenProduccion = null,Object? idInsumo = null,Object? costoInsumoMomento = null,}) {
  return _then(_DetalleProduccionInsumo(
idDetalleProduccionInsumo: freezed == idDetalleProduccionInsumo ? _self.idDetalleProduccionInsumo : idDetalleProduccionInsumo // ignore: cast_nullable_to_non_nullable
as int?,idOrdenProduccion: null == idOrdenProduccion ? _self.idOrdenProduccion : idOrdenProduccion // ignore: cast_nullable_to_non_nullable
as int,idInsumo: null == idInsumo ? _self.idInsumo : idInsumo // ignore: cast_nullable_to_non_nullable
as int,costoInsumoMomento: null == costoInsumoMomento ? _self.costoInsumoMomento : costoInsumoMomento // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
