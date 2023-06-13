import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:catbreeds_riverpod/infraestructure/datasources/breed_cat_api_datasource.dart';
import 'package:catbreeds_riverpod/infraestructure/repositories/breeds_repository_impl.dart';



final breedsRepositoryProvider = Provider((ref) {
  return BreedsRepositoryImpl(BreedCatApiDataSource());
});