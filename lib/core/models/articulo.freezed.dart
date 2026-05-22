// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articulo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Articulo {

@JsonKey(name: 'id_articulo') int? get idArticulo; String get nombre; String? get descripcion; ArticuloTipo get tipo;@JsonKey(name: 'id_unidad') int get idUnidad;@JsonKey(name: 'costo_unitario') double get costoUnitario;@JsonKey(name: 'precio_venta') double get precioVenta; double get stock;
/// Create a copy of Articulo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticuloCopyWith<Articulo> get copyWith => _$ArticuloCopyWithImpl<Articulo>(this as Articulo, _$identity);

  /// Serializes this Articulo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Articulo&&(identical(other.idArticulo, idArticulo) || other.idArticulo == idArticulo)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.idUnidad, idUnidad) || other.idUnidad == idUnidad)&&(identical(other.costoUnitario, costoUnitario) || other.costoUnitario == costoUnitario)&&(identical(other.precioVenta, precioVenta) || other.precioVenta == precioVenta)&&(identical(other.stock, stock) || other.stock == stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idArticulo,nombre,descripcion,tipo,idUnidad,costoUnitario,precioVenta,stock);

@override
String toString() {
  return 'Articulo(idArticulo: $idArticulo, nombre: $nombre, descripcion: $descripcion, tipo: $tipo, idUnidad: $idUnidad, costoUnitario: $costoUnitario, precioVenta: $precioVenta, stock: $stock)';
}


}

/// @nodoc
abstract mixin class $ArticuloCopyWith<$Res>  {
  factory $ArticuloCopyWith(Articulo value, $Res Function(Articulo) _then) = _$ArticuloCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_articulo') int? idArticulo, String nombre, String? descripcion, ArticuloTipo tipo,@JsonKey(name: 'id_unidad') int idUnidad,@JsonKey(name: 'costo_unitario') double costoUnitario,@JsonKey(name: 'precio_venta') double precioVenta, double stock
});




}
/// @nodoc
class _$ArticuloCopyWithImpl<$Res>
    implements $ArticuloCopyWith<$Res> {
  _$ArticuloCopyWithImpl(this._self, this._then);

  final Articulo _self;
  final $Res Function(Articulo) _then;

/// Create a copy of Articulo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idArticulo = freezed,Object? nombre = null,Object? descripcion = freezed,Object? tipo = null,Object? idUnidad = null,Object? costoUnitario = null,Object? precioVenta = null,Object? stock = null,}) {
  return _then(_self.copyWith(
idArticulo: freezed == idArticulo ? _self.idArticulo : idArticulo // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as ArticuloTipo,idUnidad: null == idUnidad ? _self.idUnidad : idUnidad // ignore: cast_nullable_to_non_nullable
as int,costoUnitario: null == costoUnitario ? _self.costoUnitario : costoUnitario // ignore: cast_nullable_to_non_nullable
as double,precioVenta: null == precioVenta ? _self.precioVenta : precioVenta // ignore: cast_nullable_to_non_nullable
as double,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Articulo].
extension ArticuloPatterns on Articulo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Articulo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Articulo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Articulo value)  $default,){
final _that = this;
switch (_that) {
case _Articulo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Articulo value)?  $default,){
final _that = this;
switch (_that) {
case _Articulo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_articulo')  int? idArticulo,  String nombre,  String? descripcion,  ArticuloTipo tipo, @JsonKey(name: 'id_unidad')  int idUnidad, @JsonKey(name: 'costo_unitario')  double costoUnitario, @JsonKey(name: 'precio_venta')  double precioVenta,  double stock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Articulo() when $default != null:
return $default(_that.idArticulo,_that.nombre,_that.descripcion,_that.tipo,_that.idUnidad,_that.costoUnitario,_that.precioVenta,_that.stock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_articulo')  int? idArticulo,  String nombre,  String? descripcion,  ArticuloTipo tipo, @JsonKey(name: 'id_unidad')  int idUnidad, @JsonKey(name: 'costo_unitario')  double costoUnitario, @JsonKey(name: 'precio_venta')  double precioVenta,  double stock)  $default,) {final _that = this;
switch (_that) {
case _Articulo():
return $default(_that.idArticulo,_that.nombre,_that.descripcion,_that.tipo,_that.idUnidad,_that.costoUnitario,_that.precioVenta,_that.stock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id_articulo')  int? idArticulo,  String nombre,  String? descripcion,  ArticuloTipo tipo, @JsonKey(name: 'id_unidad')  int idUnidad, @JsonKey(name: 'costo_unitario')  double costoUnitario, @JsonKey(name: 'precio_venta')  double precioVenta,  double stock)?  $default,) {final _that = this;
switch (_that) {
case _Articulo() when $default != null:
return $default(_that.idArticulo,_that.nombre,_that.descripcion,_that.tipo,_that.idUnidad,_that.costoUnitario,_that.precioVenta,_that.stock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Articulo implements Articulo {
  const _Articulo({@JsonKey(name: 'id_articulo') this.idArticulo, required this.nombre, this.descripcion, required this.tipo, @JsonKey(name: 'id_unidad') required this.idUnidad, @JsonKey(name: 'costo_unitario') required this.costoUnitario, @JsonKey(name: 'precio_venta') required this.precioVenta, required this.stock});
  factory _Articulo.fromJson(Map<String, dynamic> json) => _$ArticuloFromJson(json);

@override@JsonKey(name: 'id_articulo') final  int? idArticulo;
@override final  String nombre;
@override final  String? descripcion;
@override final  ArticuloTipo tipo;
@override@JsonKey(name: 'id_unidad') final  int idUnidad;
@override@JsonKey(name: 'costo_unitario') final  double costoUnitario;
@override@JsonKey(name: 'precio_venta') final  double precioVenta;
@override final  double stock;

/// Create a copy of Articulo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticuloCopyWith<_Articulo> get copyWith => __$ArticuloCopyWithImpl<_Articulo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticuloToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Articulo&&(identical(other.idArticulo, idArticulo) || other.idArticulo == idArticulo)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.idUnidad, idUnidad) || other.idUnidad == idUnidad)&&(identical(other.costoUnitario, costoUnitario) || other.costoUnitario == costoUnitario)&&(identical(other.precioVenta, precioVenta) || other.precioVenta == precioVenta)&&(identical(other.stock, stock) || other.stock == stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idArticulo,nombre,descripcion,tipo,idUnidad,costoUnitario,precioVenta,stock);

@override
String toString() {
  return 'Articulo(idArticulo: $idArticulo, nombre: $nombre, descripcion: $descripcion, tipo: $tipo, idUnidad: $idUnidad, costoUnitario: $costoUnitario, precioVenta: $precioVenta, stock: $stock)';
}


}

/// @nodoc
abstract mixin class _$ArticuloCopyWith<$Res> implements $ArticuloCopyWith<$Res> {
  factory _$ArticuloCopyWith(_Articulo value, $Res Function(_Articulo) _then) = __$ArticuloCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_articulo') int? idArticulo, String nombre, String? descripcion, ArticuloTipo tipo,@JsonKey(name: 'id_unidad') int idUnidad,@JsonKey(name: 'costo_unitario') double costoUnitario,@JsonKey(name: 'precio_venta') double precioVenta, double stock
});




}
/// @nodoc
class __$ArticuloCopyWithImpl<$Res>
    implements _$ArticuloCopyWith<$Res> {
  __$ArticuloCopyWithImpl(this._self, this._then);

  final _Articulo _self;
  final $Res Function(_Articulo) _then;

/// Create a copy of Articulo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idArticulo = freezed,Object? nombre = null,Object? descripcion = freezed,Object? tipo = null,Object? idUnidad = null,Object? costoUnitario = null,Object? precioVenta = null,Object? stock = null,}) {
  return _then(_Articulo(
idArticulo: freezed == idArticulo ? _self.idArticulo : idArticulo // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as ArticuloTipo,idUnidad: null == idUnidad ? _self.idUnidad : idUnidad // ignore: cast_nullable_to_non_nullable
as int,costoUnitario: null == costoUnitario ? _self.costoUnitario : costoUnitario // ignore: cast_nullable_to_non_nullable
as double,precioVenta: null == precioVenta ? _self.precioVenta : precioVenta // ignore: cast_nullable_to_non_nullable
as double,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
