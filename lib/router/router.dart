part of 'app_router.dart';

@AutoRouterConfig(replaceInRouteName: 'page')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: SplashScreenRoute.page,
      path: '/',
    ),
    AutoRoute(page: BlocLoginPageRoute.page),
    AutoRoute(page: OtpPageRoute.page),
    AutoRoute(page: HomeScreenMainRoute.page),
    AutoRoute(page: AllNoticesCleanRoute.page),
    AutoRoute(page: HouseHoldMainRoute.page),
    AutoRoute(page: AddVehiclePageRoute.page),
    // AutoRoute(page: GetVehiclePageRoute.page),
    AutoRoute(page: EditVehicleFormRoute.page),
    AutoRoute(page: AddPetPageRoute.page),
    AutoRoute(page: EditPetPageRoute.page),
    AutoRoute(page: AddPetPageRoute.page),
    AutoRoute(page: EditPetPageRoute.page),
    AutoRoute(page: ProfilePageRoute.page),
    AutoRoute(page: EditAdditionalInfoRoute.page),
    AutoRoute(page: PersonalStaffStatusRoute.page),
    AutoRoute(page: PersonalStaffAccountCreateFormRoute.page),
    AutoRoute(page: SqfAddScreenRoute.page),
    AutoRoute(page: SqfLiteReadDataRoute.page),
    AutoRoute(page: SqfUpdateScreenRoute.page)
  ];
}
