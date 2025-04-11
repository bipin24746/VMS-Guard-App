import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';

import 'package:dayonecontacts/features/login_pages/clean_code/presentation/bloc/otp_bloc/otp_verification_bloc.dart';
import 'package:dayonecontacts/l10n/l10n.dart';

import 'package:dayonecontacts/router/app_router.gr.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class OtpPage extends StatefulWidget {
  final String phoneNo;
  final String hash;
  final String otp;

  const OtpPage({
    Key? key,
    required this.phoneNo,
    required this.hash,
    required this.otp,
  }) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController _otpVerified = TextEditingController();
  bool _isotpValid = false;

  int _remainingTime = 30;

  @override
  void initState() {
    super.initState();
    _otpVerified.addListener(_validateOtp);
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _validateOtp() {
    final isValid = _otpVerified.text.isNotEmpty &&
        int.tryParse(_otpVerified.text) != null &&
        _otpVerified.text.length == 6; // Correcting length to 6

    if (_isotpValid != isValid) {
      setState(() {
        _isotpValid = isValid;
      });
    }
  }

  void _resendOtp() {
    setState(() {
      _remainingTime = 30; // Resetting the timer
    });
    // Implement the logic to resend the OTP here
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<OtpVerificationBloc>())],
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentNode = FocusScope.of(context);
          if (currentNode.focusedChild != null &&
              !currentNode.hasPrimaryFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(200.h),
            child: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:  Icon(
                  Icons.arrow_back,
                  size: 35.sp,
                ),
              ),
              flexibleSpace: SizedBox(
                height: 300.h,
                child: Padding(
                  padding:  EdgeInsets.only(top: 15.0.h),
                  child: Image.asset("lib/assets/images/signupimage.png"),
                ),
              ),
            ),
          ),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 18.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localization!.otpVerification,
                  //   "OTP VERIFICATION",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
                Text(
                  localization.pleaseEnterThe6DigitCodeSentViaSMS,
                  // "Please enter the 6-digit code sent via SMS to"
                ),
                Text(
                  '+977 ${widget.phoneNo}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.start,
                  numberOfFields: 6,
                  borderColor: Colors.black,
                  showFieldAsBox: true,
                  onSubmit: (code) => _otpVerified.text = code,
                ),
                 SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      localization.resendcode,
                      // "Resend Code "
                    ),
                    if (_remainingTime > 0)
                      Text("00:$_remainingTime")
                    else
                      TextButton(
                        onPressed: _resendOtp,
                        child: Text(localization.resendotp
                            // "Resend OTP"
                            ),
                      ),
                  ],
                ),
                Text("${widget.otp}")
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding:  EdgeInsets.all(15.0.w),
            child: Builder(builder: (context) {
              return BlocListener<OtpVerificationBloc, OtpVerificationState>(
                listener: (context, state) {
                  if (state is OtpVerificationSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Otp Verified Successfully."),
                      ),
                    );

                    AutoRouter.of(context).push(HomeScreenMainRoute());
                  } else if (state is OtpVerificationErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('OTP Error: ${state.errorMessage}'),
                      ),
                    );
                  }
                },
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Button enabled always
                  ),
                  onPressed: _isotpValid
                      ? () {
                          context.read<OtpVerificationBloc>().add(
                                OtpVerificationUserEvent(
                                  phoneNo: widget.phoneNo,
                                  otp:
                                      _otpVerified.text, // Using user input OTP
                                  hash: widget.hash,
                                  fcmToken:
                                      'fhCbQpQSQCKFH5pIXRl8aL:APA91bFQurQq0hivgZGZ3A3QI4IkZojznFPgtskZsvVh16aSnl56JkquQVMddRq3QNSIJe7qv4YlxI7Uv-N_YsxqeYb4_1Wy551BYzCFJCObDXZE-VzLtIhp1iBBy8nv-PyTTKTx1apL', // Replace with actual FCM token

                                  deviceId:
                                      '04762b6a13fe52fb', // Replace with actual device ID
                                  deviceType:
                                      'android', // Replace with actual device type
                                ),
                              );
                        }
                      : null,
                  child: const Text("Login",
                      style: TextStyle(color: Colors.white)),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
