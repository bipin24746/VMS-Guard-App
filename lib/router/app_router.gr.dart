// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:dayonecontacts/features/all_notices/presentation/screens/all_notices_clean.dart'
    as _i3;
import 'package:dayonecontacts/features/home_screen_pages/home_screen.dart'
    as _i11;
import 'package:dayonecontacts/features/house_hold/domain/entity/pet_entity.dart'
    as _i27;
import 'package:dayonecontacts/features/house_hold/domain/entity/vehicle_entity.dart'
    as _i28;
import 'package:dayonecontacts/features/house_hold/presentation/screen/edit_pet_form.dart'
    as _i7;
import 'package:dayonecontacts/features/house_hold/presentation/screen/edit_vehicle_form.dart'
    as _i9;
import 'package:dayonecontacts/features/house_hold/presentation/screen/house_hold_main.dart'
    as _i12;
import 'package:dayonecontacts/features/house_hold/presentation/screen/pet_form.dart'
    as _i17;
import 'package:dayonecontacts/features/house_hold/presentation/screen/vehicle_form.dart'
    as _i23;
import 'package:dayonecontacts/features/house_hold/presentation/widgets/add_pet_page.dart'
    as _i1;
import 'package:dayonecontacts/features/house_hold/presentation/widgets/add_vehicle_page.dart'
    as _i2;
import 'package:dayonecontacts/features/house_hold/presentation/widgets/edit_pet_page.dart'
    as _i8;
import 'package:dayonecontacts/features/house_hold/presentation/widgets/get_pet_page.dart'
    as _i10;
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/screens/login_page.dart'
    as _i4;
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/screens/otp_page.dart'
    as _i13;
import 'package:dayonecontacts/features/main_home_screen/widgets/current_notices/presentation/pages/current_notices.dart'
    as _i5;
import 'package:dayonecontacts/features/personal%20_staff/presentation/screens/account_create_form.dart'
    as _i15;
import 'package:dayonecontacts/features/personal%20_staff/presentation/screens/pending_status.dart'
    as _i14;
import 'package:dayonecontacts/features/personal%20_staff/presentation/screens/status.dart'
    as _i16;
import 'package:dayonecontacts/features/profile_page/domain/user_profile_entity/user_profile_entity.dart'
    as _i26;
import 'package:dayonecontacts/features/profile_page/presentation/screens/edit_additional_info.dart'
    as _i6;
import 'package:dayonecontacts/features/profile_page/presentation/screens/profile_page.dart'
    as _i18;
import 'package:dayonecontacts/features/splash_screen/presentation/screen/SplashScreen.dart'
    as _i19;
import 'package:dayonecontacts/features/sqf_lite/data/model/sqf_lite_model.dart'
    as _i29;
import 'package:dayonecontacts/features/sqf_lite/presentation/screens/sqf_add_screen.dart'
    as _i20;
import 'package:dayonecontacts/features/sqf_lite/presentation/screens/sqf_lite_read_data.dart'
    as _i21;
import 'package:dayonecontacts/features/sqf_lite/presentation/screens/sqf_update_screen.dart'
    as _i22;
import 'package:flutter/material.dart' as _i25;

/// generated route for
/// [_i1.AddPetPage]
class AddPetPageRoute extends _i24.PageRouteInfo<void> {
  const AddPetPageRoute({List<_i24.PageRouteInfo>? children})
    : super(AddPetPageRoute.name, initialChildren: children);

  static const String name = 'AddPetPageRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddPetPage();
    },
  );
}

/// generated route for
/// [_i2.AddVehiclePage]
class AddVehiclePageRoute extends _i24.PageRouteInfo<void> {
  const AddVehiclePageRoute({List<_i24.PageRouteInfo>? children})
    : super(AddVehiclePageRoute.name, initialChildren: children);

  static const String name = 'AddVehiclePageRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddVehiclePage();
    },
  );
}

/// generated route for
/// [_i3.AllNoticesClean]
class AllNoticesCleanRoute extends _i24.PageRouteInfo<void> {
  const AllNoticesCleanRoute({List<_i24.PageRouteInfo>? children})
    : super(AllNoticesCleanRoute.name, initialChildren: children);

  static const String name = 'AllNoticesCleanRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i3.AllNoticesClean();
    },
  );
}

/// generated route for
/// [_i4.BlocLoginPage]
class BlocLoginPageRoute extends _i24.PageRouteInfo<void> {
  const BlocLoginPageRoute({List<_i24.PageRouteInfo>? children})
    : super(BlocLoginPageRoute.name, initialChildren: children);

  static const String name = 'BlocLoginPageRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i4.BlocLoginPage();
    },
  );
}

/// generated route for
/// [_i5.CurrentNoticeHome]
class CurrentNoticeHomeRoute extends _i24.PageRouteInfo<void> {
  const CurrentNoticeHomeRoute({List<_i24.PageRouteInfo>? children})
    : super(CurrentNoticeHomeRoute.name, initialChildren: children);

  static const String name = 'CurrentNoticeHomeRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i5.CurrentNoticeHome();
    },
  );
}

/// generated route for
/// [_i6.EditAdditionalInfo]
class EditAdditionalInfoRoute
    extends _i24.PageRouteInfo<EditAdditionalInfoRouteArgs> {
  EditAdditionalInfoRoute({
    _i25.Key? key,
    required _i26.UserProfileEntity userProfileEntity,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         EditAdditionalInfoRoute.name,
         args: EditAdditionalInfoRouteArgs(
           key: key,
           userProfileEntity: userProfileEntity,
         ),
         initialChildren: children,
       );

  static const String name = 'EditAdditionalInfoRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditAdditionalInfoRouteArgs>();
      return _i6.EditAdditionalInfo(
        key: args.key,
        userProfileEntity: args.userProfileEntity,
      );
    },
  );
}

class EditAdditionalInfoRouteArgs {
  const EditAdditionalInfoRouteArgs({
    this.key,
    required this.userProfileEntity,
  });

  final _i25.Key? key;

  final _i26.UserProfileEntity userProfileEntity;

  @override
  String toString() {
    return 'EditAdditionalInfoRouteArgs{key: $key, userProfileEntity: $userProfileEntity}';
  }
}

/// generated route for
/// [_i7.EditPetForm]
class EditPetFormRoute extends _i24.PageRouteInfo<EditPetFormRouteArgs> {
  EditPetFormRoute({
    _i25.Key? key,
    required _i27.PetEntity pet,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         EditPetFormRoute.name,
         args: EditPetFormRouteArgs(key: key, pet: pet),
         initialChildren: children,
       );

  static const String name = 'EditPetFormRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditPetFormRouteArgs>();
      return _i7.EditPetForm(key: args.key, pet: args.pet);
    },
  );
}

class EditPetFormRouteArgs {
  const EditPetFormRouteArgs({this.key, required this.pet});

  final _i25.Key? key;

  final _i27.PetEntity pet;

  @override
  String toString() {
    return 'EditPetFormRouteArgs{key: $key, pet: $pet}';
  }
}

/// generated route for
/// [_i8.EditPetPage]
class EditPetPageRoute extends _i24.PageRouteInfo<EditPetPageRouteArgs> {
  EditPetPageRoute({
    _i25.Key? key,
    required _i27.PetEntity pet,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         EditPetPageRoute.name,
         args: EditPetPageRouteArgs(key: key, pet: pet),
         initialChildren: children,
       );

  static const String name = 'EditPetPageRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditPetPageRouteArgs>();
      return _i8.EditPetPage(key: args.key, pet: args.pet);
    },
  );
}

class EditPetPageRouteArgs {
  const EditPetPageRouteArgs({this.key, required this.pet});

  final _i25.Key? key;

  final _i27.PetEntity pet;

  @override
  String toString() {
    return 'EditPetPageRouteArgs{key: $key, pet: $pet}';
  }
}

/// generated route for
/// [_i9.EditVehicleForm]
class EditVehicleFormRoute
    extends _i24.PageRouteInfo<EditVehicleFormRouteArgs> {
  EditVehicleFormRoute({
    _i25.Key? key,
    required _i28.VehicleEntity vehicle,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         EditVehicleFormRoute.name,
         args: EditVehicleFormRouteArgs(key: key, vehicle: vehicle),
         initialChildren: children,
       );

  static const String name = 'EditVehicleFormRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditVehicleFormRouteArgs>();
      return _i9.EditVehicleForm(key: args.key, vehicle: args.vehicle);
    },
  );
}

class EditVehicleFormRouteArgs {
  const EditVehicleFormRouteArgs({this.key, required this.vehicle});

  final _i25.Key? key;

  final _i28.VehicleEntity vehicle;

  @override
  String toString() {
    return 'EditVehicleFormRouteArgs{key: $key, vehicle: $vehicle}';
  }
}

/// generated route for
/// [_i10.GetPetPage]
class GetPetPageRoute extends _i24.PageRouteInfo<void> {
  const GetPetPageRoute({List<_i24.PageRouteInfo>? children})
    : super(GetPetPageRoute.name, initialChildren: children);

  static const String name = 'GetPetPageRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i10.GetPetPage();
    },
  );
}

/// generated route for
/// [_i11.HomeScreenMain]
class HomeScreenMainRoute extends _i24.PageRouteInfo<void> {
  const HomeScreenMainRoute({List<_i24.PageRouteInfo>? children})
    : super(HomeScreenMainRoute.name, initialChildren: children);

  static const String name = 'HomeScreenMainRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i11.HomeScreenMain();
    },
  );
}

/// generated route for
/// [_i12.HouseHoldMain]
class HouseHoldMainRoute extends _i24.PageRouteInfo<void> {
  const HouseHoldMainRoute({List<_i24.PageRouteInfo>? children})
    : super(HouseHoldMainRoute.name, initialChildren: children);

  static const String name = 'HouseHoldMainRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i12.HouseHoldMain();
    },
  );
}

/// generated route for
/// [_i13.OtpPage]
class OtpPageRoute extends _i24.PageRouteInfo<OtpPageRouteArgs> {
  OtpPageRoute({
    _i25.Key? key,
    required String phoneNo,
    required String hash,
    required String otp,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         OtpPageRoute.name,
         args: OtpPageRouteArgs(
           key: key,
           phoneNo: phoneNo,
           hash: hash,
           otp: otp,
         ),
         initialChildren: children,
       );

  static const String name = 'OtpPageRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpPageRouteArgs>();
      return _i13.OtpPage(
        key: args.key,
        phoneNo: args.phoneNo,
        hash: args.hash,
        otp: args.otp,
      );
    },
  );
}

class OtpPageRouteArgs {
  const OtpPageRouteArgs({
    this.key,
    required this.phoneNo,
    required this.hash,
    required this.otp,
  });

  final _i25.Key? key;

  final String phoneNo;

  final String hash;

  final String otp;

  @override
  String toString() {
    return 'OtpPageRouteArgs{key: $key, phoneNo: $phoneNo, hash: $hash, otp: $otp}';
  }
}

/// generated route for
/// [_i14.PendingStatus]
class PendingStatusRoute extends _i24.PageRouteInfo<void> {
  const PendingStatusRoute({List<_i24.PageRouteInfo>? children})
    : super(PendingStatusRoute.name, initialChildren: children);

  static const String name = 'PendingStatusRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i14.PendingStatus();
    },
  );
}

/// generated route for
/// [_i15.PersonalStaffAccountCreateForm]
class PersonalStaffAccountCreateFormRoute extends _i24.PageRouteInfo<void> {
  const PersonalStaffAccountCreateFormRoute({
    List<_i24.PageRouteInfo>? children,
  }) : super(
         PersonalStaffAccountCreateFormRoute.name,
         initialChildren: children,
       );

  static const String name = 'PersonalStaffAccountCreateFormRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i15.PersonalStaffAccountCreateForm();
    },
  );
}

/// generated route for
/// [_i16.PersonalStaffStatus]
class PersonalStaffStatusRoute extends _i24.PageRouteInfo<void> {
  const PersonalStaffStatusRoute({List<_i24.PageRouteInfo>? children})
    : super(PersonalStaffStatusRoute.name, initialChildren: children);

  static const String name = 'PersonalStaffStatusRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i16.PersonalStaffStatus();
    },
  );
}

/// generated route for
/// [_i17.PetForm]
class PetFormRoute extends _i24.PageRouteInfo<void> {
  const PetFormRoute({List<_i24.PageRouteInfo>? children})
    : super(PetFormRoute.name, initialChildren: children);

  static const String name = 'PetFormRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i17.PetForm();
    },
  );
}

/// generated route for
/// [_i18.ProfilePage]
class ProfilePageRoute extends _i24.PageRouteInfo<void> {
  const ProfilePageRoute({List<_i24.PageRouteInfo>? children})
    : super(ProfilePageRoute.name, initialChildren: children);

  static const String name = 'ProfilePageRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i18.ProfilePage();
    },
  );
}

/// generated route for
/// [_i19.SplashScreen]
class SplashScreenRoute extends _i24.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i24.PageRouteInfo>? children})
    : super(SplashScreenRoute.name, initialChildren: children);

  static const String name = 'SplashScreenRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return _i19.SplashScreen();
    },
  );
}

/// generated route for
/// [_i20.SqfAddScreen]
class SqfAddScreenRoute extends _i24.PageRouteInfo<SqfAddScreenRouteArgs> {
  SqfAddScreenRoute({_i25.Key? key, List<_i24.PageRouteInfo>? children})
    : super(
        SqfAddScreenRoute.name,
        args: SqfAddScreenRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'SqfAddScreenRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SqfAddScreenRouteArgs>(
        orElse: () => const SqfAddScreenRouteArgs(),
      );
      return _i20.SqfAddScreen(key: args.key);
    },
  );
}

class SqfAddScreenRouteArgs {
  const SqfAddScreenRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'SqfAddScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i21.SqfLiteReadData]
class SqfLiteReadDataRoute extends _i24.PageRouteInfo<void> {
  const SqfLiteReadDataRoute({List<_i24.PageRouteInfo>? children})
    : super(SqfLiteReadDataRoute.name, initialChildren: children);

  static const String name = 'SqfLiteReadDataRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i21.SqfLiteReadData();
    },
  );
}

/// generated route for
/// [_i22.SqfUpdateScreen]
class SqfUpdateScreenRoute
    extends _i24.PageRouteInfo<SqfUpdateScreenRouteArgs> {
  SqfUpdateScreenRoute({
    _i25.Key? key,
    required _i29.SqfLiteModel modelClass,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         SqfUpdateScreenRoute.name,
         args: SqfUpdateScreenRouteArgs(key: key, modelClass: modelClass),
         initialChildren: children,
       );

  static const String name = 'SqfUpdateScreenRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SqfUpdateScreenRouteArgs>();
      return _i22.SqfUpdateScreen(key: args.key, modelClass: args.modelClass);
    },
  );
}

class SqfUpdateScreenRouteArgs {
  const SqfUpdateScreenRouteArgs({this.key, required this.modelClass});

  final _i25.Key? key;

  final _i29.SqfLiteModel modelClass;

  @override
  String toString() {
    return 'SqfUpdateScreenRouteArgs{key: $key, modelClass: $modelClass}';
  }
}

/// generated route for
/// [_i23.VehicleForm]
class VehicleFormRoute extends _i24.PageRouteInfo<void> {
  const VehicleFormRoute({List<_i24.PageRouteInfo>? children})
    : super(VehicleFormRoute.name, initialChildren: children);

  static const String name = 'VehicleFormRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i23.VehicleForm();
    },
  );
}
