import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:openmovieapp/features/movies/details/data/repositories/details_repository_impl.dart';
import 'package:openmovieapp/features/movies/details/domain/usecases/get_details_by_Id.dart';
import 'package:openmovieapp/features/movies/details/presenter/details_cubit.dart';
import 'package:openmovieapp/features/movies/external/data_sources/open_movie_data_source.dart';
import 'package:openmovieapp/features/movies/search/data/repositories/search_repository_impl.dart';
import 'package:openmovieapp/features/movies/search/domain/usecases/search_by_text.dart';
import 'package:openmovieapp/features/movies/search/presenter/search_cubit.dart';

import 'features/movies/details/data/data_source/details_data_source.dart';
import 'features/movies/details/domain/repositories/details_repository.dart';
import 'features/movies/search/data/data_source/search_data_source.dart';
import 'features/movies/search/domain/repositories/search_repository.dart';

final sl = GetIt.I;

startModule([Dio dio]) {
  sl.registerFactory<SearchByText>(
          () => SearchByTextImpl(sl<SearchRepository>()));
  sl.registerFactory<SearchRepository>(
          () => SearchRepositoryIpml(sl<SearchDataSource>()));
  sl.registerFactory<SearchDataSource>(() => OpenMovieDataSource(sl()));
  sl.registerFactory(() => dio ?? Dio());
  sl.registerLazySingleton(() => SearchCubit(sl<SearchByText>()));

  sl.registerFactory<GetDetailsById>(
          () => GetDetailsByIdImpl(sl<DetailsRepository>()));
  sl.registerFactory<DetailsRepository>(
          () => DetailsRepositoryIpml(sl<DetailsDataSource>()));
  sl.registerFactory<DetailsDataSource>(() => OpenMovieDataSource(sl()));
  sl.registerFactory(() => DetailsCubit(sl<GetDetailsById>()));

}
disposeModule() {
  sl.get<SearchCubit>().close();
  sl.unregister<SearchCubit>();
  sl.get<DetailsCubit>().close();
  sl.unregister<DetailsCubit>();
}