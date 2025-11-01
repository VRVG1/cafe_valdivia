// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Compra {

 int? get id; int get idProveedor; DateTime get fecha; String? get detalles; bool? get pagado;
/// Create a copy of Compra
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompraCopyWith<Compra> get copyWith => _$CompraCopyWithImpl<Compra>(this as Compra, _$identity);

  /// Serializes this Compra to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Compra&&(identical(other.id, id) || other.id == id)&&(identical(other.idProveedor, idProveedor) || other.idProveedor == idProveedor)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.detalles, detalles) || other.detalles == detalles)&&(identical(other.pagado, pagado) || other.pagado == pagado));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idProveedor,fecha,detalles,pagado);

@override
String toString() {
  return 'Compra(id: $id, idProveedor: $idProveedor, fecha: $fecha, detalles: $detalles, pagado: $pagado)';
}


}

/// @nodoc
abstract mixin class $CompraCopyWith<$Res>  {
  factory $CompraCopyWith(Compra value, $Res Function(Compra) _then) = _$CompraCopyWithImpl;
@useResult
$Res call({
 int? id, int idProveedor, DateTime fecha, String? detalles, bool? pagado
});




}
/// @nodoc
class _$CompraCopyWithImpl<$Res>
    implements $CompraCopyWith<$Res> {
  _$CompraCopyWithImpl(this._self, this._then);

  final Compra _self;
  final $Res Function(Compra) _then;

/// Create a copy of Compra
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? idProveedor = null,Object? fecha = null,Object? detalles = freezed,Object? pagado = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idProveedor: null == idProveedor ? _self.idProveedor : idProveedor // ignore: cast_nullable_to_non_nullable
as int,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,detalles: freezed == detalles ? _self.detalles : detalles // ignore: cast_nullable_to_non_nullable
as String?,pagado: freezed == pagado ? _self.pagado : pagado // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Compra].
extension CompraPatterns on Compra {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Compra value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Compra() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Compra value)  $default,){
final _that = this;
switch (_that) {
case _Compra():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Compra value)?  $default,){
final _that = this;
switch (_that) {
case _Compra() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int idProveedor,  DateTime fecha,  String? detalles,  bool? pagado)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Compra() when $default != null:
return $default(_that.id,_that.idProveedor,_that.fecha,_that.detalles,_that.pagado);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int idProveedor,  DateTime fecha,  String? detalles,  bool? pagado)  $default,) {final _that = this;
switch (_that) {
case _Compra():
return $default(_that.id,_that.idProveedor,_that.fecha,_that.detalles,_that.pagado);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int idProveedor,  DateTime fecha,  String? detalles,  bool? pagado)?  $default,) {final _that = this;
switch (_that) {
case _Compra() when $default != null:
return $default(_that.id,_that.idProveedor,_that.fecha,_that.detalles,_that.pagado);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Compra implements Compra {
  const _Compra({this.id, required this.idProveedor, required this.fecha, this.detalles, this.pagado});
  factory _Compra.fromJson(Map<String, dynamic> json) => _$CompraFromJson(json);

@override final  int? id;
@override final  int idProveedor;
@override final  DateTime fecha;
@override final  String? detalles;
@override final  bool? pagado;

/// Create a copy of Compra
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompraCopyWith<_Compra> get copyWith => __$CompraCopyWithImpl<_Compra>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompraToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Compra&&(identical(other.id, id) || other.id == id)&&(identical(other.idProveedor, idProveedor) || other.idProveedor == idProveedor)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.detalles, detalles) || other.detalles == detalles)&&(identical(other.pagado, pagado) || other.pagado == pagado));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idProveedor,fecha,detalles,pagado);

@override
String toString() {
  return 'Compra(id: $id, idProveedor: $idProveedor, fecha: $fecha, detalles: $detalles, pagado: $pagado)';
}


}

/// @nodoc
abstract mixin class _$CompraCopyWith<$Res> implements $CompraCopyWith<$Res> {
  factory _$CompraCopyWith(_Compra value, $Res Function(_Compra) _then) = __$CompraCopyWithImpl;
@override @useResult
$Res call({
 int? id, int idProveedor, DateTime fecha, String? detalles, bool? pagado
});




}
/// @nodoc
class __$CompraCopyWithImpl<$Res>
    implements _$CompraCopyWith<$Res> {
  __$CompraCopyWithImpl(this._self, this._then);

  final _Compra _self;
  final $Res Function(_Compra) _then;

/// Create a copy of Compra
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? idProveedor = null,Object? fecha = null,Object? detalles = freezed,Object? pagado = freezed,}) {
  return _then(_Compra(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idProveedor: null == idProveedor ? _self.idProveedor : idProveedor // ignore: cast_nullable_to_non_nullable
as int,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,detalles: freezed == detalles ? _self.detalles : detalles // ignore: cast_nullable_to_non_nullable
as String?,pagado: freezed == pagado ? _self.pagado : pagado // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
