import 'package:dot_mobile_test/architectures/data/repositories/DataAuthRepository.dart';
import 'package:dot_mobile_test/architectures/data/repositories/DataGalleryRepository.dart';
import 'package:dot_mobile_test/architectures/data/repositories/DataPlaceRepository.dart';
import 'package:dot_mobile_test/architectures/data/repositories/DataProfileRepository.dart';
import 'package:dot_mobile_test/architectures/domain/repositories/AuthRepository.dart';
import 'package:dot_mobile_test/architectures/domain/repositories/GalleryRepository.dart';
import 'package:dot_mobile_test/architectures/domain/repositories/PlaceRepository.dart';
import 'package:dot_mobile_test/architectures/domain/repositories/ProfileRepository.dart';
import 'package:dot_mobile_test/architectures/domain/usecases/GalleryListUseCase.dart';
import 'package:dot_mobile_test/architectures/domain/usecases/PlaceListUseCase.dart';
import 'package:dot_mobile_test/architectures/domain/usecases/UserLoginUseCase.dart';
import 'package:dot_mobile_test/architectures/domain/usecases/UserProfileUseCase.dart';
import 'package:dot_mobile_test/bloc/gallery_list/gallery_list_bloc.dart';
import 'package:dot_mobile_test/bloc/place_list/place_list_bloc.dart';
import 'package:dot_mobile_test/bloc/user_login/user_login_bloc.dart';
import 'package:dot_mobile_test/bloc/user_profile/user_profile_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use cases
  sl.registerLazySingleton(() => UserLoginUseCase(sl()));
  sl.registerLazySingleton(() => PlaceListUseCase(sl()));
  sl.registerLazySingleton(() => GalleryListUseCase(sl()));
  sl.registerLazySingleton(() => UserProfileUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => DataAuthRepository(),
  );
  sl.registerLazySingleton<PlaceRepository>(
    () => DataPlaceRepository(),
  );
  sl.registerLazySingleton<GalleryRepository>(
    () => DataGalleryRepository(),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => DataProfileRepository(),
  );

  sl.registerFactory(
    () => UserLoginBloc(
      userLoginUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => PlaceListBloc(
      placeListUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => GalleryListBloc(
      galleryListUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => UserProfileBloc(
      userProfileUseCase: sl(),
    ),
  );
}
