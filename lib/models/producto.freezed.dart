// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'producto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Producto {

@JsonKey(name: 'id_producto') int? get id; String get nombre; String? get descripcion; String get precioVenta;
/// Create a copy of Producto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductoCopyWith<Producto> get copyWith => _$ProductoCopyWithImpl<Producto>(this as Producto, _$identity);

  /// Serializes this Producto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Producto&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.precioVenta, precioVenta) || other.precioVenta == precioVenta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,precioVenta);

@override
String toString() {
  return 'Producto(id: $id, nombre: $nombre, descripcion: $descripcion, precioVenta: $precioVenta)';
}


}

/// @nodoc
abstract mixin class $ProductoCopyWith<$Res>  {
  factory $ProductoCopyWith(Producto value, $Res Function(Producto) _then) = _$ProductoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_producto') int? id, String nombre, String? descripcion, String precioVenta
});




}
/// @nodoc
class _$ProductoCopyWithImpl<$Res>
    implements $ProductoCopyWith<$Res> {
  _$ProductoCopyWithImpl(this._self, this._then);

  final Producto _self;
  final $Res Function(Producto) _then;

/// Create a copy of Producto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nombre = null,Object? descripcion = freezed,Object? precioVenta = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,precioVenta: null == precioVenta ? _self.precioVenta : precioVenta // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Producto].
extension ProductoPatterns on Producto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Producto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Producto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Producto value)  $default,){
final _that = this;
switch (_that) {
case _Producto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Producto value)?  $default,){
final _that = this;
switch (_that) {
case _Producto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_producto')  int? id,  String nombre,  String? descripcion,  String precioVenta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Producto() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.precioVenta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_producto')  int? id,  String nombre,  String? descripcion,  String precioVenta)  $default,) {final _that = this;
switch (_that) {
case _Producto():
return $default(_that.id,_that.nombre,_that.descripcion,_that.precioVenta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id_producto')  int? id,  String nombre,  String? descripcion,  String precioVenta)?  $default,) {final _that = this;
switch (_that) {
case _Producto() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.precioVenta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Producto implements Producto {
  const _Producto({@JsonKey(name: 'id_producto') this.id, required this.nombre, this.descripcion, required this.precioVenta});
  factory _Producto.fromJson(Map<String, dynamic> json) => _$ProductoFromJson(json);

@override@JsonKey(name: 'id_producto') final  int? id;
@override final  String nombre;
@override final  String? descripcion;
@override final  String precioVenta;

/// Create a copy of Producto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductoCopyWith<_Producto> get copyWith => __$ProductoCopyWithImpl<_Producto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Producto&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.precioVenta, precioVenta) || other.precioVenta == precioVenta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,precioVenta);

@override
String toString() {
  return 'Producto(id: $id, nombre: $nombre, descripcion: $descripcion, precioVenta: $precioVenta)';
}


}

/// @nodoc
abstract mixin class _$ProductoCopyWith<$Res> implements $ProductoCopyWith<$Res> {
  factory _$ProductoCopyWith(_Producto value, $Res Function(_Producto) _then) = __$ProductoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_producto') int? id, String nombre, String? descripcion, String precioVenta
});




}
/// @nodoc
class __$ProductoCopyWithImpl<$Res>
    implements _$ProductoCopyWith<$Res> {
  __$ProductoCopyWithImpl(this._self, this._then);

  final _Producto _self;
  final $Res Function(_Producto) _then;

/// Create a copy of Producto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nombre = null,Object? descripcion = freezed,Object? precioVenta = null,}) {
  return _then(_Producto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,precioVenta: null == precioVenta ? _self.precioVenta : precioVenta // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
