// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detalle_compra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetalleCompra {

 int? get id; int get idCompra; int get idInsumo; int get cantidad; String get precioUnitarioCompra;
/// Create a copy of DetalleCompra
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetalleCompraCopyWith<DetalleCompra> get copyWith => _$DetalleCompraCopyWithImpl<DetalleCompra>(this as DetalleCompra, _$identity);

  /// Serializes this DetalleCompra to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetalleCompra&&(identical(other.id, id) || other.id == id)&&(identical(other.idCompra, idCompra) || other.idCompra == idCompra)&&(identical(other.idInsumo, idInsumo) || other.idInsumo == idInsumo)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.precioUnitarioCompra, precioUnitarioCompra) || other.precioUnitarioCompra == precioUnitarioCompra));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idCompra,idInsumo,cantidad,precioUnitarioCompra);

@override
String toString() {
  return 'DetalleCompra(id: $id, idCompra: $idCompra, idInsumo: $idInsumo, cantidad: $cantidad, precioUnitarioCompra: $precioUnitarioCompra)';
}


}

/// @nodoc
abstract mixin class $DetalleCompraCopyWith<$Res>  {
  factory $DetalleCompraCopyWith(DetalleCompra value, $Res Function(DetalleCompra) _then) = _$DetalleCompraCopyWithImpl;
@useResult
$Res call({
 int? id, int idCompra, int idInsumo, int cantidad, String precioUnitarioCompra
});




}
/// @nodoc
class _$DetalleCompraCopyWithImpl<$Res>
    implements $DetalleCompraCopyWith<$Res> {
  _$DetalleCompraCopyWithImpl(this._self, this._then);

  final DetalleCompra _self;
  final $Res Function(DetalleCompra) _then;

/// Create a copy of DetalleCompra
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? idCompra = null,Object? idInsumo = null,Object? cantidad = null,Object? precioUnitarioCompra = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idCompra: null == idCompra ? _self.idCompra : idCompra // ignore: cast_nullable_to_non_nullable
as int,idInsumo: null == idInsumo ? _self.idInsumo : idInsumo // ignore: cast_nullable_to_non_nullable
as int,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,precioUnitarioCompra: null == precioUnitarioCompra ? _self.precioUnitarioCompra : precioUnitarioCompra // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DetalleCompra].
extension DetalleCompraPatterns on DetalleCompra {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetalleCompra value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetalleCompra() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetalleCompra value)  $default,){
final _that = this;
switch (_that) {
case _DetalleCompra():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetalleCompra value)?  $default,){
final _that = this;
switch (_that) {
case _DetalleCompra() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int idCompra,  int idInsumo,  int cantidad,  String precioUnitarioCompra)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetalleCompra() when $default != null:
return $default(_that.id,_that.idCompra,_that.idInsumo,_that.cantidad,_that.precioUnitarioCompra);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int idCompra,  int idInsumo,  int cantidad,  String precioUnitarioCompra)  $default,) {final _that = this;
switch (_that) {
case _DetalleCompra():
return $default(_that.id,_that.idCompra,_that.idInsumo,_that.cantidad,_that.precioUnitarioCompra);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int idCompra,  int idInsumo,  int cantidad,  String precioUnitarioCompra)?  $default,) {final _that = this;
switch (_that) {
case _DetalleCompra() when $default != null:
return $default(_that.id,_that.idCompra,_that.idInsumo,_that.cantidad,_that.precioUnitarioCompra);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetalleCompra implements DetalleCompra {
  const _DetalleCompra({this.id, required this.idCompra, required this.idInsumo, required this.cantidad, required this.precioUnitarioCompra});
  factory _DetalleCompra.fromJson(Map<String, dynamic> json) => _$DetalleCompraFromJson(json);

@override final  int? id;
@override final  int idCompra;
@override final  int idInsumo;
@override final  int cantidad;
@override final  String precioUnitarioCompra;

/// Create a copy of DetalleCompra
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetalleCompraCopyWith<_DetalleCompra> get copyWith => __$DetalleCompraCopyWithImpl<_DetalleCompra>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetalleCompraToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetalleCompra&&(identical(other.id, id) || other.id == id)&&(identical(other.idCompra, idCompra) || other.idCompra == idCompra)&&(identical(other.idInsumo, idInsumo) || other.idInsumo == idInsumo)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.precioUnitarioCompra, precioUnitarioCompra) || other.precioUnitarioCompra == precioUnitarioCompra));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idCompra,idInsumo,cantidad,precioUnitarioCompra);

@override
String toString() {
  return 'DetalleCompra(id: $id, idCompra: $idCompra, idInsumo: $idInsumo, cantidad: $cantidad, precioUnitarioCompra: $precioUnitarioCompra)';
}


}

/// @nodoc
abstract mixin class _$DetalleCompraCopyWith<$Res> implements $DetalleCompraCopyWith<$Res> {
  factory _$DetalleCompraCopyWith(_DetalleCompra value, $Res Function(_DetalleCompra) _then) = __$DetalleCompraCopyWithImpl;
@override @useResult
$Res call({
 int? id, int idCompra, int idInsumo, int cantidad, String precioUnitarioCompra
});




}
/// @nodoc
class __$DetalleCompraCopyWithImpl<$Res>
    implements _$DetalleCompraCopyWith<$Res> {
  __$DetalleCompraCopyWithImpl(this._self, this._then);

  final _DetalleCompra _self;
  final $Res Function(_DetalleCompra) _then;

/// Create a copy of DetalleCompra
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? idCompra = null,Object? idInsumo = null,Object? cantidad = null,Object? precioUnitarioCompra = null,}) {
  return _then(_DetalleCompra(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idCompra: null == idCompra ? _self.idCompra : idCompra // ignore: cast_nullable_to_non_nullable
as int,idInsumo: null == idInsumo ? _self.idInsumo : idInsumo // ignore: cast_nullable_to_non_nullable
as int,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,precioUnitarioCompra: null == precioUnitarioCompra ? _self.precioUnitarioCompra : precioUnitarioCompra // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
