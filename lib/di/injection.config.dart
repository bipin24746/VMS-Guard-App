// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dayonecontacts/di/injection.dart' as _i142;
import 'package:dayonecontacts/features/all_notices/data/data_source/all_notices_remote_datasource.dart'
    as _i534;
import 'package:dayonecontacts/features/all_notices/data/repositories/all_notices_repository_implementation.dart'
    as _i908;
import 'package:dayonecontacts/features/all_notices/domain/repositories/all_notice_repositories.dart'
    as _i911;
import 'package:dayonecontacts/features/all_notices/domain/usecase/get_all_notices_usecases.dart'
    as _i462;
import 'package:dayonecontacts/features/all_notices/presentation/bloc/all_notices_bloc.dart'
    as _i353;
import 'package:dayonecontacts/features/house_hold/data/data_source/pet_remote_data_source.dart'
    as _i696;
import 'package:dayonecontacts/features/house_hold/data/data_source/vehicle_remote_data_source.dart'
    as _i330;
import 'package:dayonecontacts/features/house_hold/data/repository/pet_repository_impl.dart'
    as _i1;
import 'package:dayonecontacts/features/house_hold/data/repository/vehicle_repository_impl.dart'
    as _i76;
import 'package:dayonecontacts/features/house_hold/domain/repository/pet_repository.dart'
    as _i248;
import 'package:dayonecontacts/features/house_hold/domain/repository/vehicle_repository.dart'
    as _i641;
import 'package:dayonecontacts/features/house_hold/domain/use_case/add_pet_usecase.dart'
    as _i1061;
import 'package:dayonecontacts/features/house_hold/domain/use_case/add_vehicle_usecase.dart'
    as _i42;
import 'package:dayonecontacts/features/house_hold/domain/use_case/delete_pet_usecase.dart'
    as _i82;
import 'package:dayonecontacts/features/house_hold/domain/use_case/delete_vehicle_usecase.dart'
    as _i193;
import 'package:dayonecontacts/features/house_hold/domain/use_case/edit_pet_usecase.dart'
    as _i295;
import 'package:dayonecontacts/features/house_hold/domain/use_case/edit_vehicle_usecase.dart'
    as _i40;
import 'package:dayonecontacts/features/house_hold/domain/use_case/fetch_pet_usecase.dart'
    as _i843;
import 'package:dayonecontacts/features/house_hold/domain/use_case/get_vehicle_usecase.dart'
    as _i891;
import 'package:dayonecontacts/features/house_hold/presentation/bloc/pet_bloc/pet_bloc.dart'
    as _i1006;
import 'package:dayonecontacts/features/house_hold/presentation/bloc/vehicle_bloc/vehicle_bloc.dart'
    as _i261;
import 'package:dayonecontacts/features/login_pages/clean_code/data/data_sources/auth_data_sources.dart'
    as _i705;
import 'package:dayonecontacts/features/login_pages/clean_code/data/data_sources/verify_otp_data_source.dart'
    as _i206;
import 'package:dayonecontacts/features/login_pages/clean_code/data/repositories/auth_repo_impl.dart'
    as _i757;
import 'package:dayonecontacts/features/login_pages/clean_code/data/repositories/verify_otp_repo_impl.dart'
    as _i693;
import 'package:dayonecontacts/features/login_pages/clean_code/domain/repositories/auth_repository.dart'
    as _i1063;
import 'package:dayonecontacts/features/login_pages/clean_code/domain/repositories/otp_reponse_repo.dart'
    as _i4;
import 'package:dayonecontacts/features/login_pages/clean_code/domain/usecases/auth_usecase.dart'
    as _i399;
import 'package:dayonecontacts/features/login_pages/clean_code/domain/usecases/otp_use_case.dart'
    as _i1046;
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/bloc/localization_bloc/localization_bloc.dart'
    as _i989;
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/bloc/login_bloc/auth_bloc.dart'
    as _i358;
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/bloc/otp_bloc/otp_verification_bloc.dart'
    as _i605;
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/data/data_source/current_flat_remote_datasource.dart'
    as _i897;
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/data/repositories/curent_flat_repo_impl.dart'
    as _i1018;
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/domain/repositories/current_flat_repositories.dart'
    as _i838;
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/domain/usecases/get_current_flat.dart'
    as _i284;
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/presentation/bloc/current_flat_bloc.dart'
    as _i364;
import 'package:dayonecontacts/features/main_home_screen/widgets/current_notices/data/data_sources/notice_remote_datasource.dart'
    as _i38;
import 'package:dayonecontacts/features/main_home_screen/widgets/current_notices/data/repositories/notice_repository_impl.dart'
    as _i778;
import 'package:dayonecontacts/features/main_home_screen/widgets/current_notices/domain/repositories/notice_repository.dart'
    as _i934;
import 'package:dayonecontacts/features/main_home_screen/widgets/current_notices/domain/use_case/get_notices_usecase.dart'
    as _i20;
import 'package:dayonecontacts/features/main_home_screen/widgets/current_notices/presentation/bloc/notice_bloc.dart'
    as _i908;
import 'package:dayonecontacts/features/personal%20_staff/data/data_source/staff_remote_data_source.dart'
    as _i676;
import 'package:dayonecontacts/features/personal%20_staff/data/data_source/staff_roles_remote_data_source.dart'
    as _i433;
import 'package:dayonecontacts/features/personal%20_staff/data/repository_impl/personal_staff_repository_impl.dart'
    as _i117;
import 'package:dayonecontacts/features/personal%20_staff/data/repository_impl/personal_staff_roles_repository_impl.dart'
    as _i69;
import 'package:dayonecontacts/features/personal%20_staff/domain/repository/personal_staff_repository.dart'
    as _i960;
import 'package:dayonecontacts/features/personal%20_staff/domain/repository/personal_staff_roles_repository.dart'
    as _i874;
import 'package:dayonecontacts/features/personal%20_staff/domain/use_case/pending_staff_use_case.dart'
    as _i383;
import 'package:dayonecontacts/features/personal%20_staff/domain/use_case/personal_staff_roles_use_case.dart'
    as _i531;
import 'package:dayonecontacts/features/personal%20_staff/domain/use_case/personal_staff_use_case.dart'
    as _i55;
import 'package:dayonecontacts/features/personal%20_staff/presentation/bloc/personal_staff_bloc/personal_staff_bloc.dart'
    as _i1009;
import 'package:dayonecontacts/features/personal%20_staff/presentation/bloc/personal_staff_roles_bloc/personal_staff_roles_bloc.dart'
    as _i377;
import 'package:dayonecontacts/features/profile_page/data/data_source/user_profile_remote_data_source.dart'
    as _i141;
import 'package:dayonecontacts/features/profile_page/data/repositories/user_profile_repository_impl.dart'
    as _i25;
import 'package:dayonecontacts/features/profile_page/domain/user_profile_repository/user_profile_repository.dart'
    as _i530;
import 'package:dayonecontacts/features/profile_page/domain/user_profile_usecase/community_connect_usecase.dart'
    as _i744;
import 'package:dayonecontacts/features/profile_page/domain/user_profile_usecase/edit_user_profile_usecase.dart'
    as _i28;
import 'package:dayonecontacts/features/profile_page/domain/user_profile_usecase/user_profile_usecase.dart'
    as _i318;
import 'package:dayonecontacts/features/profile_page/presentation/bloc/user_profile_bloc.dart'
    as _i556;
import 'package:dayonecontacts/features/sqf_lite/data/data_source/sqf_lite_remote_data_source.dart'
    as _i189;
import 'package:dayonecontacts/features/sqf_lite/data/repository_impl/sqf_lite_repo_impl.dart'
    as _i1009;
import 'package:dayonecontacts/features/sqf_lite/domain/repository/sqf_lite_repository.dart'
    as _i753;
import 'package:dayonecontacts/features/sqf_lite/domain/use_case/delete_data_use_case.dart'
    as _i383;
import 'package:dayonecontacts/features/sqf_lite/domain/use_case/insert_data_use_case.dart'
    as _i426;
import 'package:dayonecontacts/features/sqf_lite/domain/use_case/read_data_use_case.dart'
    as _i75;
import 'package:dayonecontacts/features/sqf_lite/domain/use_case/update_data_use_case.dart'
    as _i920;
import 'package:dayonecontacts/features/sqf_lite/presentation/bloc/sqf_lite_bloc.dart'
    as _i1065;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i989.LocalizationBloc>(() => _i989.LocalizationBloc());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i534.AllNoticeRemoteDataSource>(
        () => _i534.AllNoticeRemoteDataSourceimpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i38.NoticeRemoteDataSource>(
        () => _i38.NoticeRemoteDataSourceimpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i189.DBHandler>(() => _i189.DBHandlerImpl());
    gh.lazySingleton<_i676.PersonalStaffRemoteDataSource>(
        () => _i676.PersonalStaffRemoteDataSourceImpl());
    gh.lazySingleton<_i897.CurrentFlatRemoteDataSource>(
        () => _i897.CurrentFlatRemoteDataSourceimpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i911.AllNoticeRepositories>(() =>
        _i908.AllNoticesRepositoryImplementation(
            gh<_i534.AllNoticeRemoteDataSource>()));
    gh.lazySingleton<_i141.UserProfileRemoteDataSource>(
        () => _i141.UserProfileRemoteDataSourceImpl());
    gh.lazySingleton<_i960.PersonalStaffRepository>(() =>
        _i117.PersonalStaffRepositoryImpl(
            gh<_i676.PersonalStaffRemoteDataSource>()));
    gh.lazySingleton<_i383.GetPendingStaffUsecase>(() =>
        _i383.GetPendingStaffUsecase(gh<_i960.PersonalStaffRepository>()));
    gh.lazySingleton<_i55.AddPersonalStaffUseCase>(() =>
        _i55.AddPersonalStaffUseCase(gh<_i960.PersonalStaffRepository>()));
    gh.lazySingleton<_i696.PetRemoteDataSource>(
        () => _i696.PetRemoteDataSourceImpl());
    gh.lazySingleton<_i330.VehicleRemoteDataSource>(
        () => _i330.VehicleRemoteDataSourceImpl());
    gh.lazySingleton<_i433.PersonalStaffRolesRemoteDataSource>(
        () => _i433.PersonalStaffRolesDataSourceImpl());
    gh.lazySingleton<_i530.UserProfileRepository>(() =>
        _i25.UserProfileRepositoryImpl(
            gh<_i141.UserProfileRemoteDataSource>()));
    gh.lazySingleton<_i874.PersonalStaffRolesRepository>(() =>
        _i69.PersonalStaffRolesImpl(
            gh<_i433.PersonalStaffRolesRemoteDataSource>()));
    gh.lazySingleton<_i248.PetRepository>(
        () => _i1.PetRepositoryImpl(gh<_i696.PetRemoteDataSource>()));
    gh.lazySingleton<_i1061.AddPetUseCase>(
        () => _i1061.AddPetUseCase(gh<_i248.PetRepository>()));
    gh.lazySingleton<_i82.DeletePetUseCase>(
        () => _i82.DeletePetUseCase(gh<_i248.PetRepository>()));
    gh.lazySingleton<_i295.EditPetUseCase>(
        () => _i295.EditPetUseCase(gh<_i248.PetRepository>()));
    gh.lazySingleton<_i843.GetPetUseCase>(
        () => _i843.GetPetUseCase(gh<_i248.PetRepository>()));
    gh.lazySingleton<_i838.CurrentRepository>(() =>
        _i1018.CurrentFlatRepositoryImpl(
            gh<_i897.CurrentFlatRemoteDataSource>()));
    gh.factory<_i1009.PersonalStaffBloc>(() => _i1009.PersonalStaffBloc(
          gh<_i55.AddPersonalStaffUseCase>(),
          gh<_i383.GetPendingStaffUsecase>(),
        ));
    gh.lazySingleton<_i705.AuthDataSource>(
        () => _i705.AuthDataSourceimpl(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i934.NoticeRepository>(
        () => _i778.NoticeRepositoryImpl(gh<_i38.NoticeRemoteDataSource>()));
    gh.lazySingleton<_i206.VerifyOtpDataSource>(
        () => _i206.VerifyOtpDataSourceImpl(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i462.GetAllNoticesUsecase>(
        () => _i462.GetAllNoticesUsecase(gh<_i911.AllNoticeRepositories>()));
    gh.lazySingleton<_i531.GetPersonalStaffRolesUseCase>(() =>
        _i531.GetPersonalStaffRolesUseCase(
            gh<_i874.PersonalStaffRolesRepository>()));
    gh.lazySingleton<_i1063.AuthRepository>(() =>
        _i757.AuthRepositoryImpl(authDataSource: gh<_i705.AuthDataSource>()));
    gh.lazySingleton<_i284.GetCurrentFlat>(
        () => _i284.GetCurrentFlat(gh<_i838.CurrentRepository>()));
    gh.lazySingleton<_i641.VehicleRepository>(
        () => _i76.VehicleRepositoryImpl(gh<_i330.VehicleRemoteDataSource>()));
    gh.lazySingleton<_i753.DatabaseRepository>(
        () => _i1009.DatabaseRepositoryImpl(dbHandler: gh<_i189.DBHandler>()));
    gh.factory<_i353.AllNoticeBloc>(() =>
        _i353.AllNoticeBloc(getAllNotices: gh<_i462.GetAllNoticesUsecase>()));
    gh.lazySingleton<_i4.OtpResponseRepo>(() => _i693.VerifyOtpRepoImpl(
        verifyOtpDataSource: gh<_i206.VerifyOtpDataSource>()));
    gh.lazySingleton<_i744.CommunityConnectUseCase>(
        () => _i744.CommunityConnectUseCase(gh<_i530.UserProfileRepository>()));
    gh.lazySingleton<_i28.EditUserProfileUseCase>(
        () => _i28.EditUserProfileUseCase(gh<_i530.UserProfileRepository>()));
    gh.lazySingleton<_i318.UserProfileUseCase>(
        () => _i318.UserProfileUseCase(gh<_i530.UserProfileRepository>()));
    gh.factory<_i383.SqfDeleteDataUsecase>(
        () => _i383.SqfDeleteDataUsecase(gh<_i753.DatabaseRepository>()));
    gh.factory<_i426.SqfAddDataUseCase>(
        () => _i426.SqfAddDataUseCase(gh<_i753.DatabaseRepository>()));
    gh.factory<_i75.SqfReadDataUseCase>(
        () => _i75.SqfReadDataUseCase(gh<_i753.DatabaseRepository>()));
    gh.factory<_i920.SqfUpdateDataUseCase>(
        () => _i920.SqfUpdateDataUseCase(gh<_i753.DatabaseRepository>()));
    gh.factory<_i364.CurrentFlatBloc>(() =>
        _i364.CurrentFlatBloc(getCurrentFlat: gh<_i284.GetCurrentFlat>()));
    gh.factory<_i556.UserProfileBloc>(() => _i556.UserProfileBloc(
          gh<_i318.UserProfileUseCase>(),
          gh<_i744.CommunityConnectUseCase>(),
          gh<_i28.EditUserProfileUseCase>(),
        ));
    gh.lazySingleton<_i399.AuthUseCase>(
        () => _i399.AuthUseCase(authRepository: gh<_i1063.AuthRepository>()));
    gh.factory<_i1006.PetBloc>(() => _i1006.PetBloc(
          gh<_i1061.AddPetUseCase>(),
          gh<_i843.GetPetUseCase>(),
          gh<_i82.DeletePetUseCase>(),
          gh<_i295.EditPetUseCase>(),
        ));
    gh.lazySingleton<_i20.GetNoticesUsecase>(
        () => _i20.GetNoticesUsecase(gh<_i934.NoticeRepository>()));
    gh.factory<_i358.AuthBloc>(() => _i358.AuthBloc(gh<_i399.AuthUseCase>()));
    gh.factory<_i908.NoticeBloc>(
        () => _i908.NoticeBloc(getNotices: gh<_i20.GetNoticesUsecase>()));
    gh.factory<_i1065.SqfLiteBloc>(() => _i1065.SqfLiteBloc(
          gh<_i426.SqfAddDataUseCase>(),
          gh<_i920.SqfUpdateDataUseCase>(),
          gh<_i383.SqfDeleteDataUsecase>(),
          gh<_i75.SqfReadDataUseCase>(),
        ));
    gh.factory<_i377.PersonalStaffRolesBloc>(() =>
        _i377.PersonalStaffRolesBloc(gh<_i531.GetPersonalStaffRolesUseCase>()));
    gh.lazySingleton<_i1046.OtpUseCase>(
        () => _i1046.OtpUseCase(otpResponseRepo: gh<_i4.OtpResponseRepo>()));
    gh.lazySingleton<_i42.AddVehicleUseCase>(
        () => _i42.AddVehicleUseCase(gh<_i641.VehicleRepository>()));
    gh.lazySingleton<_i193.DeleteVehicleUseCase>(
        () => _i193.DeleteVehicleUseCase(gh<_i641.VehicleRepository>()));
    gh.lazySingleton<_i40.EditVehicleUseCase>(
        () => _i40.EditVehicleUseCase(gh<_i641.VehicleRepository>()));
    gh.lazySingleton<_i891.GetVehicleUseCase>(
        () => _i891.GetVehicleUseCase(gh<_i641.VehicleRepository>()));
    gh.factory<_i261.VehicleBloc>(() => _i261.VehicleBloc(
          gh<_i42.AddVehicleUseCase>(),
          gh<_i891.GetVehicleUseCase>(),
          gh<_i193.DeleteVehicleUseCase>(),
          gh<_i40.EditVehicleUseCase>(),
        ));
    gh.factory<_i605.OtpVerificationBloc>(
        () => _i605.OtpVerificationBloc(otpUseCase: gh<_i1046.OtpUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i142.RegisterModule {}
