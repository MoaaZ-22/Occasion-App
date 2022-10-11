import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/occasion_home_layout.dart';
import '../../shared/components/components.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/styles/color.dart';
import '../Login_Screen/login_screen.dart';
import 'Register_Cubit/cubit.dart';
import 'Register_Cubit/states.dart';

class OccasionRegisterScreen extends StatefulWidget {
  const OccasionRegisterScreen({Key? key}) : super(key: key);

  @override
  State<OccasionRegisterScreen> createState() => _OccasionRegisterScreenState();
}

class _OccasionRegisterScreenState extends State<OccasionRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    OccasionRegisterCubit cubit = OccasionRegisterCubit.get(context);
    return BlocConsumer<OccasionRegisterCubit, OccasionRegisterStates>(
        listener: (BuildContext context, OccasionRegisterStates state) {
      if (state is OccasionRegisterSuccessState) {
        if (state.occasionRegisterModel.message == 'success') {
          // print(state.occasionRegisterModel.message);
          // print(state.occasionRegisterModel.token);
          CacheHelper.saveData(
                  key: 'token', value: state.occasionRegisterModel.token)
              .then((value) => {
                    pushReplacementNavigate(context, const OccasionHomeLayout())
                  });
        } else {
          showToast(
              message: state.occasionRegisterModel.message,
              state: ToastStates.error);
        }
      }
    }, builder: (BuildContext context, OccasionRegisterStates state) {
      // Register Screen Form

      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: defaultColor,
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: cubit.registerFormKey,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                padding: const EdgeInsets.only(left: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffBB2036),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Register',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Register now to browse our hot offer',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            color: Colors.white)),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Center(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll){
                      overScroll.disallowIndicator();
                      return true;
                    },
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.only(top: 20),
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            ReusableOccasionLogin(
                              controller: cubit.registerUserNameController,
                              labelText: 'User Name',
                              hintText: 'Enter Your Name',
                              isPassword: false,
                              keyBoardType: TextInputType.name,
                              validator: (value) => cubit.userName(value),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ReusableOccasionLogin(
                              controller: cubit.registerEmailController,
                              labelText: 'Email Address',
                              hintText: 'Enter Your Email Address',
                              isPassword: false,
                              keyBoardType: TextInputType.emailAddress,
                              validator: (value) =>
                                  cubit.emailValidation(value),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ReusableOccasionLogin(
                              controller: cubit.registerPasswordController,
                              labelText: "Password",
                              hintText: 'Enter Your Password',
                              suffixIcon: Icons.visibility_off_outlined,
                              suffixFunc: () {
                                cubit.showPasswordRegisterScreen();
                              },
                              isPassword: cubit.isPasswordShow,
                              keyBoardType: TextInputType.visiblePassword,
                              validator: (value) =>
                                  cubit.passwordValidation(value),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ReusableOccasionLogin(
                              controller:
                                  cubit.registerConfirmPasswordController,
                              labelText: 'Confirm Password',
                              hintText: 'Enter Your Password',
                              suffixIcon: Icons.visibility_off_outlined,
                              suffixFunc: () {
                                cubit.showConfirmPasswordInRegister();
                              },
                              isPassword: cubit.isConfirmPasswordShow,
                              keyBoardType: TextInputType.visiblePassword,
                              validator: (value) =>
                                  cubit.confirmPasswordValidation(value),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            // Button
                            ConditionalBuilder(
                              condition: state is! OccasionRegisterLoadingState,
                              builder: (BuildContext context) =>
                                  ReusableOccasionLoginButton(
                                buttonRadius: 8,
                                textButtonStyleOS: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Montserrat'),
                                colorOfButton: const Color(0xffBB2036),
                                height: 55,
                                buttonTextOS: 'SIGN UP',
                                buttonFuncOS: () {
                                  if (cubit.registerFormKey.currentState!
                                      .validate()) {
                                    cubit.userRegister(
                                        name: cubit
                                            .registerUserNameController.text,
                                        email:
                                            cubit.registerEmailController.text,
                                        password: cubit
                                            .registerPasswordController.text,
                                        confirmPassword: cubit
                                            .registerConfirmPasswordController
                                            .text);
                                  }
                                },
                              ),
                              fallback: (BuildContext context) => SizedBox(
                                height: 55,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(
                                      color: defaultColor, strokeWidth: 5),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                //done
                                InkWell(
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffBB2036)),
                                  ),
                                  onTap: () {
                                    // Navigate to Register Screen
                                    pushReplacementNavigate(context,
                                        const OccasionSmartLoginScreen());
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
