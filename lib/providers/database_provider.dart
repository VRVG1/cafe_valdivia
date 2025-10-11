import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
DatabaseHelper databaseHelper(DatabaseHelperRef ref) {
  return DatabaseHelper();
}
