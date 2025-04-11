class ApiConstants {
  static const String baseUrl = 'https://housing-stagingserver.aitc.ai/api/v1';
  // static const String allnoticeEndpoint = '$baseUrl/client/notice';
  final String authurl = '${ApiConstants.baseUrl}/client/auth';
  final String verifyOtpUrl = '${ApiConstants.baseUrl}/client/otp/verify';
  final String urlProfile = '${ApiConstants.baseUrl}/client/user/profile';
  final String urlUser = '${ApiConstants.baseUrl}/client/user';
  final String urlCommunity = '${ApiConstants.baseUrl}/client/user/socialize';
  final String allnoticeEndpoint = '${ApiConstants.baseUrl}/client/notice';
  final String peturl = '${ApiConstants.baseUrl}/client/pet';
  final String vehicleurl = '${ApiConstants.baseUrl}/client/vehicle';
  final String noticeEndpoint = '${ApiConstants.baseUrl}/client/notice';
  final String currentFlatEndPoint = '${ApiConstants.baseUrl}/client/user/currentflat';
  final String addPersonalStaff = '${ApiConstants.baseUrl}/client/staff';
  final String addPersonalStaffRoles = '${ApiConstants.baseUrl}/client/staff/roles';
  final String pendingPersonalStaff = '${ApiConstants.baseUrl}/client/staff?status=pending';
}


//final String allnoticeEndpoint = ApiConstants().allnoticeEndpoint;