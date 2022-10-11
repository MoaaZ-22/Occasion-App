// ignore_for_file: avoid_print
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/occasion_home_layout.dart';
import '../../shared/components/components.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/styles/color.dart';
import '../Register_Screen/register_screen.dart';
import 'Login_Cubit/cubit.dart';
import 'Login_Cubit/states.dart';



class OccasionSmartLoginScreen extends StatefulWidget {
  const OccasionSmartLoginScreen({Key? key}) : super(key: key);

  @override
  State<OccasionSmartLoginScreen> createState() =>
      _OccasionSmartLoginScreenState();
}

class _OccasionSmartLoginScreenState extends State<OccasionSmartLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OccasionLoginCubit, OccasionLoginStates>(
      listener:(BuildContext context, OccasionLoginStates state)
      {
        if(state is OccasionLoginSuccessState)
          {
            if (state.occasionLoginModel.message == 'you are login now')
              {
                  // print(state.occasionLoginModel.message);
                  // print(state.occasionLoginModel.token);
                  CacheHelper.saveData(key: 'token', value: state.occasionLoginModel.token).then((value) =>
                  {
                    pushReplacementNavigate(context, const OccasionHomeLayout())
                  }
                  );
              }
            else
              {
                showToast(
                    message: state.occasionLoginModel.message,
                    state:ToastStates.error);
              }
          }
      } ,
      builder: (BuildContext context, OccasionLoginStates state)
      {
        // Login Screen Form
        GlobalKey<FormState> loginFormKey =  GlobalKey<FormState>(debugLabel: 'Login');
        OccasionLoginCubit  cubit = OccasionLoginCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Form(
              key: loginFormKey,
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: double.infinity,
                      decoration:  BoxDecoration(
                        color: defaultColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: Center(child: Image.asset('assets/images/OccasionLoginLogo.png',height: 200,)),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Center(
                        child: NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (overScroll){
                            overScroll.disallowIndicator();
                            return true;
                          },
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children:  [
                                ReusableOccasionLogin(
                                  controller: cubit.loginEmailController,
                                  labelText: 'Email Address',
                                  hintText: 'Enter Your Email Address',
                                  isPassword: false,
                                  keyBoardType: TextInputType.emailAddress,
                                  validator: (value) => cubit.emailValidation(value),
                                ),
                                const SizedBox(height: 20,),
                                ReusableOccasionLogin(
                                  onFieldSubmitted: (value)
                                  {
                                    if (loginFormKey.currentState!.validate())
                                    {
                                      cubit.userLogin(email: cubit.loginEmailController.text, password: cubit.loginPasswordController.text);
                                    }
                                  },
                                  controller: cubit.loginPasswordController,
                                  isPassword: cubit.isTrue,
                                  suffixIcon: Icons.visibility_off_outlined,
                                  suffixFunc: (){cubit.showPasswordLoginScreen();},
                                  labelText: 'Password',
                                  hintText: 'Enter Your Password',
                                  keyBoardType: TextInputType.visiblePassword,
                                  validator: (value) => cubit.passwordValidation(value),
                                ),
                                const SizedBox(height: 5,),
                                // Text ========>>>>>>>>>>>>>> Forget Password?
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: InkWell(
                                      onTap: (){
                                        // for make sure its works
                                        if (kDebugMode) {
                                          print('its Clickable too');
                                        }
                                      },
                                      child:  const Text('Forget Password?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),)),
                                ),
                                const SizedBox(height: 35,),

                                // Button
                                ConditionalBuilder(
                                  condition: state is! OccasionLoginLoadingState,
                                  builder: (BuildContext context) => ReusableOccasionLoginButton(
                                    buttonRadius:8,
                                    textButtonStyleOS:const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      fontFamily: 'Montserrat'
                                    ),
                                    colorOfButton: const Color(0xffBB2036),
                                    height: 55,
                                    buttonTextOS: 'SIGN IN',
                                    buttonFuncOS: (){
                                      if (loginFormKey.currentState!.validate())
                                        {
                                          cubit.userLogin(email: cubit.loginEmailController.text, password: cubit.loginPasswordController.text);
                                        }
                                    },
                                  ),
                                  fallback: (BuildContext context) => SizedBox(
                                    height: 55,
                                    width: double.infinity,
                                    child: Center(
                                      child: CircularProgressIndicator(color: defaultColor,strokeWidth: 5),),
                                  ),

                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Don\'t have an account?',
                                      style: TextStyle(fontSize: 14, color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    //done
                                    InkWell(
                                      child: const Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffBB2036)),
                                      ),
                                      onTap: () {
                                        // Navigate to Register Screen
                                        navigateTo(context, const OccasionRegisterScreen());
                                      },
                                    ),
                                  ],
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
          ),
        );
      },
    );
  }
}
