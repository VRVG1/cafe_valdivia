// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cliente.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cliente {

@JsonKey(name: 'id_cliente') int? get idCliente; String get nombre; String? get apellido; String? get telefono; String? get email;
/// Create a copy of Cliente
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClienteCopyWith<Cliente> get copyWith => _$ClienteCopyWithImpl<Cliente>(this as Cliente, _$identity);

  /// Serializes this Cliente to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cliente&&(identical(other.idCliente, idCliente) || other.idCliente == idCliente)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.apellido, apellido) || other.apellido == apellido)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idCliente,nombre,apellido,telefono,email);

@override
String toString() {
  return 'Cliente(idCliente: $idCliente, nombre: $nombre, apellido: $apellido, telefono: $telefono, email: $email)';
}


}

/// @nodoc
abstract mixin class $ClienteCopyWith<$Res>  {
  factory $ClienteCopyWith(Cliente value, $Res Function(Cliente) _then) = _$ClienteCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_cliente') int? idCliente, String nombre, String? apellido, String? telefono, String? email
});




}
/// @nodoc
class _$ClienteCopyWithImpl<$Res>
    implements $ClienteCopyWith<$Res> {
  _$ClienteCopyWithImpl(this._self, this._then);

  final Cliente _self;
  final $Res Function(Cliente) _then;

/// Create a copy of Cliente
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idCliente = freezed,Object? nombre = null,Object? apellido = freezed,Object? telefono = freezed,Object? email = freezed,}) {
  return _then(_self.copyWith(
idCliente: freezed == idCliente ? _self.idCliente : idCliente // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,apellido: freezed == apellido ? _self.apellido : apellido // ignore: cast_nullable_to_non_nullable
as String?,telefono: freezed == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Cliente].
extension ClientePatterns on Cliente {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cliente value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cliente() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cliente value)  $default,){
final _that = this;
switch (_that) {
case _Cliente():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cliente value)?  $default,){
final _that = this;
switch (_that) {
case _Cliente() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_cliente')  int? idCliente,  String nombre,  String? apellido,  String? telefono,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cliente() when $default != null:
return $default(_that.idCliente,_that.nombre,_that.apellido,_that.telefono,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_cliente')  int? idCliente,  String nombre,  String? apellido,  String? telefono,  String? email)  $default,) {final _that = this;
switch (_that) {
case _Cliente():
return $default(_that.idCliente,_that.nombre,_that.apellido,_that.telefono,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id_cliente')  int? idCliente,  String nombre,  String? apellido,  String? telefono,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _Cliente() when $default != null:
return $default(_that.idCliente,_that.nombre,_that.apellido,_that.telefono,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cliente implements Cliente {
  const _Cliente({@JsonKey(name: 'id_cliente') this.idCliente, required this.nombre, this.apellido, this.telefono, this.email});
  factory _Cliente.fromJson(Map<String, dynamic> json) => _$ClienteFromJson(json);

@override@JsonKey(name: 'id_cliente') final  int? idCliente;
@override final  String nombre;
@override final  String? apellido;
@override final  String? telefono;
@override final  String? email;

/// Create a copy of Cliente
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClienteCopyWith<_Cliente> get copyWith => __$ClienteCopyWithImpl<_Cliente>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClienteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cliente&&(identical(other.idCliente, idCliente) || other.idCliente == idCliente)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.apellido, apellido) || other.apellido == apellido)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idCliente,nombre,apellido,telefono,email);

@override
String toString() {
  return 'Cliente(idCliente: $idCliente, nombre: $nombre, apellido: $apellido, telefono: $telefono, email: $email)';
}


}

/// @nodoc
abstract mixin class _$ClienteCopyWith<$Res> implements $ClienteCopyWith<$Res> {
  factory _$ClienteCopyWith(_Cliente value, $Res Function(_Cliente) _then) = __$ClienteCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_cliente') int? idCliente, String nombre, String? apellido, String? telefono, String? email
});




}
/// @nodoc
class __$ClienteCopyWithImpl<$Res>
    implements _$ClienteCopyWith<$Res> {
  __$ClienteCopyWithImpl(this._self, this._then);

  final _Cliente _self;
  final $Res Function(_Cliente) _then;

/// Create a copy of Cliente
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idCliente = freezed,Object? nombre = null,Object? apellido = freezed,Object? telefono = freezed,Object? email = freezed,}) {
  return _then(_Cliente(
idCliente: freezed == idCliente ? _self.idCliente : idCliente // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,apellido: freezed == apellido ? _self.apellido : apellido // ignore: cast_nullable_to_non_nullable
as String?,telefono: freezed == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
