// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receta_detalle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecetaDetalle {

@JsonKey(name: 'id_receta_detalle') int? get idRecetaDetalle;@JsonKey(name: 'id_receta') int get idReceta;@JsonKey(name: 'id_articulo') int get idArticulo; double get cantidad;@JsonKey(name: 'id_unidad') int get idUnidad;
/// Create a copy of RecetaDetalle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecetaDetalleCopyWith<RecetaDetalle> get copyWith => _$RecetaDetalleCopyWithImpl<RecetaDetalle>(this as RecetaDetalle, _$identity);

  /// Serializes this RecetaDetalle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecetaDetalle&&(identical(other.idRecetaDetalle, idRecetaDetalle) || other.idRecetaDetalle == idRecetaDetalle)&&(identical(other.idReceta, idReceta) || other.idReceta == idReceta)&&(identical(other.idArticulo, idArticulo) || other.idArticulo == idArticulo)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.idUnidad, idUnidad) || other.idUnidad == idUnidad));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idRecetaDetalle,idReceta,idArticulo,cantidad,idUnidad);

@override
String toString() {
  return 'RecetaDetalle(idRecetaDetalle: $idRecetaDetalle, idReceta: $idReceta, idArticulo: $idArticulo, cantidad: $cantidad, idUnidad: $idUnidad)';
}


}

/// @nodoc
abstract mixin class $RecetaDetalleCopyWith<$Res>  {
  factory $RecetaDetalleCopyWith(RecetaDetalle value, $Res Function(RecetaDetalle) _then) = _$RecetaDetalleCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_receta_detalle') int? idRecetaDetalle,@JsonKey(name: 'id_receta') int idReceta,@JsonKey(name: 'id_articulo') int idArticulo, double cantidad,@JsonKey(name: 'id_unidad') int idUnidad
});




}
/// @nodoc
class _$RecetaDetalleCopyWithImpl<$Res>
    implements $RecetaDetalleCopyWith<$Res> {
  _$RecetaDetalleCopyWithImpl(this._self, this._then);

  final RecetaDetalle _self;
  final $Res Function(RecetaDetalle) _then;

/// Create a copy of RecetaDetalle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idRecetaDetalle = freezed,Object? idReceta = null,Object? idArticulo = null,Object? cantidad = null,Object? idUnidad = null,}) {
  return _then(_self.copyWith(
idRecetaDetalle: freezed == idRecetaDetalle ? _self.idRecetaDetalle : idRecetaDetalle // ignore: cast_nullable_to_non_nullable
as int?,idReceta: null == idReceta ? _self.idReceta : idReceta // ignore: cast_nullable_to_non_nullable
as int,idArticulo: null == idArticulo ? _self.idArticulo : idArticulo // ignore: cast_nullable_to_non_nullable
as int,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as double,idUnidad: null == idUnidad ? _self.idUnidad : idUnidad // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RecetaDetalle].
extension RecetaDetallePatterns on RecetaDetalle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecetaDetalle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecetaDetalle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecetaDetalle value)  $default,){
final _that = this;
switch (_that) {
case _RecetaDetalle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecetaDetalle value)?  $default,){
final _that = this;
switch (_that) {
case _RecetaDetalle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_receta_detalle')  int? idRecetaDetalle, @JsonKey(name: 'id_receta')  int idReceta, @JsonKey(name: 'id_articulo')  int idArticulo,  double cantidad, @JsonKey(name: 'id_unidad')  int idUnidad)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecetaDetalle() when $default != null:
return $default(_that.idRecetaDetalle,_that.idReceta,_that.idArticulo,_that.cantidad,_that.idUnidad);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_receta_detalle')  int? idRecetaDetalle, @JsonKey(name: 'id_receta')  int idReceta, @JsonKey(name: 'id_articulo')  int idArticulo,  double cantidad, @JsonKey(name: 'id_unidad')  int idUnidad)  $default,) {final _that = this;
switch (_that) {
case _RecetaDetalle():
return $default(_that.idRecetaDetalle,_that.idReceta,_that.idArticulo,_that.cantidad,_that.idUnidad);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id_receta_detalle')  int? idRecetaDetalle, @JsonKey(name: 'id_receta')  int idReceta, @JsonKey(name: 'id_articulo')  int idArticulo,  double cantidad, @JsonKey(name: 'id_unidad')  int idUnidad)?  $default,) {final _that = this;
switch (_that) {
case _RecetaDetalle() when $default != null:
return $default(_that.idRecetaDetalle,_that.idReceta,_that.idArticulo,_that.cantidad,_that.idUnidad);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecetaDetalle implements RecetaDetalle {
  const _RecetaDetalle({@JsonKey(name: 'id_receta_detalle') this.idRecetaDetalle, @JsonKey(name: 'id_receta') required this.idReceta, @JsonKey(name: 'id_articulo') required this.idArticulo, required this.cantidad, @JsonKey(name: 'id_unidad') required this.idUnidad});
  factory _RecetaDetalle.fromJson(Map<String, dynamic> json) => _$RecetaDetalleFromJson(json);

@override@JsonKey(name: 'id_receta_detalle') final  int? idRecetaDetalle;
@override@JsonKey(name: 'id_receta') final  int idReceta;
@override@JsonKey(name: 'id_articulo') final  int idArticulo;
@override final  double cantidad;
@override@JsonKey(name: 'id_unidad') final  int idUnidad;

/// Create a copy of RecetaDetalle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecetaDetalleCopyWith<_RecetaDetalle> get copyWith => __$RecetaDetalleCopyWithImpl<_RecetaDetalle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecetaDetalleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecetaDetalle&&(identical(other.idRecetaDetalle, idRecetaDetalle) || other.idRecetaDetalle == idRecetaDetalle)&&(identical(other.idReceta, idReceta) || other.idReceta == idReceta)&&(identical(other.idArticulo, idArticulo) || other.idArticulo == idArticulo)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.idUnidad, idUnidad) || other.idUnidad == idUnidad));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idRecetaDetalle,idReceta,idArticulo,cantidad,idUnidad);

@override
String toString() {
  return 'RecetaDetalle(idRecetaDetalle: $idRecetaDetalle, idReceta: $idReceta, idArticulo: $idArticulo, cantidad: $cantidad, idUnidad: $idUnidad)';
}


}

/// @nodoc
abstract mixin class _$RecetaDetalleCopyWith<$Res> implements $RecetaDetalleCopyWith<$Res> {
  factory _$RecetaDetalleCopyWith(_RecetaDetalle value, $Res Function(_RecetaDetalle) _then) = __$RecetaDetalleCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_receta_detalle') int? idRecetaDetalle,@JsonKey(name: 'id_receta') int idReceta,@JsonKey(name: 'id_articulo') int idArticulo, double cantidad,@JsonKey(name: 'id_unidad') int idUnidad
});




}
/// @nodoc
class __$RecetaDetalleCopyWithImpl<$Res>
    implements _$RecetaDetalleCopyWith<$Res> {
  __$RecetaDetalleCopyWithImpl(this._self, this._then);

  final _RecetaDetalle _self;
  final $Res Function(_RecetaDetalle) _then;

/// Create a copy of RecetaDetalle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idRecetaDetalle = freezed,Object? idReceta = null,Object? idArticulo = null,Object? cantidad = null,Object? idUnidad = null,}) {
  return _then(_RecetaDetalle(
idRecetaDetalle: freezed == idRecetaDetalle ? _self.idRecetaDetalle : idRecetaDetalle // ignore: cast_nullable_to_non_nullable
as int?,idReceta: null == idReceta ? _self.idReceta : idReceta // ignore: cast_nullable_to_non_nullable
as int,idArticulo: null == idArticulo ? _self.idArticulo : idArticulo // ignore: cast_nullable_to_non_nullable
as int,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as double,idUnidad: null == idUnidad ? _self.idUnidad : idUnidad // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
