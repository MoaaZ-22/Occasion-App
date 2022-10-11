// ignore_for_file: avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../layout/occasion_home_layout.dart';
import '../../models/Halls_Model/halls_model.dart';
import '../../modules/Drawer_Screens/aboutus_screen.dart';
import '../../modules/Drawer_Screens/mybooking_screen.dart';
import '../../modules/Halls_Screen/hall_details_screen.dart';
import '../styles/color.dart';
import '../styles/styles.dart';
import 'const.dart';

class ReusableOccasionLogin extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final String labelText;
  final bool isPassword;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final Function()? suffixFunc;
  final IconData? suffixIcon;
  final TextInputType? keyBoardType;

  const ReusableOccasionLogin(
      {Key? key,
      required this.hintText,
      this.suffixIcon,
      this.suffixFunc,
      this.keyBoardType,
      this.onChanged,
      required this.isPassword,
      this.validator,
      required this.labelText,
      this.controller,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        controller: controller,
        obscureText: isPassword,
        onChanged: onChanged,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
          labelStyle: const TextStyle(
            color: Color(0xffBB6D78),
            fontWeight: FontWeight.bold,
          ),
          labelText: labelText,
          suffixIconColor: Colors.grey,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: suffixFunc,
                  icon: Icon(
                    suffixIcon,
                    color: Colors.grey,
                    size: 19,
                  ))
              : null,
          contentPadding: const EdgeInsets.only(left: 15),
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.black, width: 1.5)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.black, width: 1.5)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5)),
        ),
      ),
    );
  }
}

class ReusableOccasionLoginButton extends StatelessWidget {
  final double buttonRadius;
  final double height;
  final Color? colorOfButton;
  final String buttonTextOS;
  final VoidCallback buttonFuncOS;
  final TextStyle? textButtonStyleOS;

  const ReusableOccasionLoginButton(
      {Key? key,
      required this.buttonRadius,
      required this.height,
      this.colorOfButton,
      required this.buttonTextOS,
      required this.buttonFuncOS,
      this.textButtonStyleOS})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        width: double.infinity,
        height: height,
        child: MaterialButton(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
          ),
          onPressed: buttonFuncOS,
          color: colorOfButton,
          child: Text(buttonTextOS, style: textButtonStyleOS),
        ));
  }
}


// Function For Navigate To Other Screens
void navigateTo(context, dynamic widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

// Function For Navigate To Other Screens And Cant Return
void pushReplacementNavigate(context, dynamic widget) =>
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) {
        return false;
      },
    );

// Function To Return To Previous Screen
void popNavigate(context) => Navigator.pop(context);

// Reusable For All Hall Card Screen Card
Widget reusableHallCard(
        {void Function()? hallCardInkWellTab,
        required HallHomeData data,
        required BuildContext context}) =>
    InkWell(
      onTap: hallCardInkWellTab,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 6),
            child: Card(
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),

                        // Old Child to get Image From Api
                        // child: Image(image: NetworkImage(data.imagesProfile!),fit: BoxFit.cover,width: double.infinity,height: MediaQuery.of(context).size.width*0.3,),

                        // CachedNetworkImage Saved Image In Cache ones the Image Load
                        child: CachedNetworkImage(
                          imageUrl: data.imagesProfile!,
                          height: MediaQuery.of(context).size.height*0.315,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          placeholder: (context, url) =>
                              Center(
                                child: SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator(color: defaultColor,strokeWidth: 5,)),
                              ),
                          errorWidget: (context, url, error) => Center(child: SvgPicture.asset('assets/images/404notFound.svg',width: 300,)),
                        ),
                      ),
                      Positioned(
                          // top: 130,
                          // left: 12,
                          // there is a change here from top to bottom With Media Query
                          bottom: MediaQuery.of(context).size.height * 0.025,
                          left: MediaQuery.of(context).size.width * 0.033,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.065,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Colors.grey.shade400.withOpacity(0.70),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0, left: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data.catgoery!,
                                      style: kStackPhotoHallStyle),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${data.price!} EGP',
                                    style: kStackPhotoHallStyle,
                                  )
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(data.images!),
                                fit: BoxFit.contain),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      data.name!,
                                      style: kHallNameStyle,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 15,
                                          color: Color(0xffBB2036),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(data.rate!),
                                      ]),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  size: 14,
                                  color: Color(0xffBB2036),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    data.location!,
                                    style: kHallLocationTextStyle,
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget hallCategoriesBuildItem() => BlocConsumer<OccasionCubit, OccasionStates>(
  listener: (BuildContext context, OccasionStates states) {},
  builder: (BuildContext context, OccasionStates states) =>
      ConditionalBuilder(
        condition: states is! OccasionHallDataLoadingState,
        builder: (BuildContext context) => ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 3),
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (BuildContext context, index) => const SizedBox(),
          itemBuilder: (BuildContext context, index) => reusableHallCard(
              data: OccasionCubit.get(context).hallHomeModel!.data![index],
              context: context,
              hallCardInkWellTab: () {

                  OccasionCubit.get(context).getDetailsOfHotels(
                      names:
                      OccasionCubit.get(context).hallHomeModel!.data![index].name!);
                  navigateTo(
                      context,
                    HallDetailsScreen(
                        model: OccasionCubit.get(context).hallHomeModel!.data![index],
                        imagePro: OccasionCubit.get(context).hallHomeModel!.data![index].images,
                        image: OccasionCubit.get(context).hallHomeModel!.data![index].imagesProfile,
                        name: OccasionCubit.get(context).hallHomeModel!.data![index].name,
                        loc: OccasionCubit.get(context).hallHomeModel!.data![index].location,
                        index: index),

                  );
              }),
          itemCount: OccasionCubit.get(context).hallHomeModel!.data!.length,
        ),
        fallback: (BuildContext context) => SizedBox(
          height: 55,
          width: double.infinity,
          child: Center(
            child:
            CircularProgressIndicator(color: defaultColor, strokeWidth: 5),
          ),
        ),
      ),
);

 // AppBar Text For All Screens
 String appBarText = 'Smart  Occasion  System';

// App Bar Theme :
AppBar homeLayoutAppBar = AppBar(
  iconTheme: IconThemeData(
    color: defaultColor,
    size: 35,
  ),
  title: Text(
    appBarText,
    style: kHomeTitleStyle,

  ),
);

// Container have (today) in Events
Widget defaultContainerEvent({
  double padding = 6,
  double radius = 8,
  required String text,
  required Function function,
}) =>
    InkWell(
      onTap: function(),
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            color: const Color(0xffBB2036),
            borderRadius: BorderRadius.circular(radius)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );


// Class Model For Onboarding Screen
class BoardingModel {
  final String boardingTitle;
  final String boardingImage;
  final String boardingBody;

  const BoardingModel(
      {required this.boardingTitle,
      required this.boardingImage,
      required this.boardingBody});
}

// Onboarding Build Item
Widget buildOnboardingItem(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: SvgPicture.asset(model.boardingImage)),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          model.boardingTitle,
          style: const TextStyle(
              fontFamily: 'JosefinSans',
              fontWeight: FontWeight.w800,
              fontSize: 22.0),
        ),
        const SizedBox(height: 15),
        Text(
          model.boardingBody,
          style: const TextStyle(
              fontFamily: 'JosefinSans',
              fontWeight: FontWeight.w800,
              fontSize: 13.0),
        ),
        const SizedBox(
          height: 35.0,
        ),
      ],
    );

// Flutter Toast Components
Future<bool?> showToast(
        {required String message, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

// For Choose Color Of Toast
enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = defaultColor;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }

  return color;
}

Widget myDivider() => Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);


Future dialogBox(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      elevation: 2,
      backgroundColor: Colors.white,
      title: Column(
        children: [
          const Text('Payment Successful!',style: TextStyle(
              color: Color(0xff21CB88),
              fontWeight: FontWeight.w800,
              fontFamily: 'Montserrat'),),
          Center(
            // SvgPicture.asset('assets/images/DoneSvg.svg',width: 300,height: 50,)
            // Lottie.asset('assets/LottieLogo1.json'),
            child: Lottie.asset(
              'assets/donelottie.json',
              width: double.infinity,
              height: 100,
              animate: true,
              repeat: false,
              fit: BoxFit.contain,
            ),

          ),


          const SizedBox(
            height: 20,
          ),
          Row(children: const [
            Text('Payment type',style: TextStyle(fontSize: 15,color: Colors.grey),),
            Spacer(),
            Text('Net banking',style: TextStyle(fontSize: 15),),
          ],),
          const SizedBox(
            height: 10,
          ),
          Row(children: const [
            Text('bank',style: TextStyle(fontSize: 15,color: Colors.grey),),
            Spacer(),
            Text('HDFC',style: TextStyle(fontSize: 15),),
          ],),
          const SizedBox(
            height: 10,
          ),
          Row(children: const [
            Text('Mobile',style: TextStyle(fontSize: 15,color: Colors.grey),),
            Spacer(),
            Text('8897131444',style: TextStyle(fontSize: 15),),
          ],),
          const SizedBox(
            height: 10,
          ),
          Row(children: const [
            Text('Email',style: TextStyle(fontSize: 15,color: Colors.grey),),
            Spacer(),
            Text('User@gmail.com',style: TextStyle(fontSize: 15),),
          ],),
          const SizedBox(
            height: 10,
          ),
          Row(children: const [
            Text('Amount paid',style: TextStyle(fontSize: 15,color: Colors.grey),),
            Spacer(),
            Text('500.00',style: TextStyle(fontSize: 15),),
          ],),
          const SizedBox(
            height: 10,
          ),
          Row(children: const [
            Text('Transaction id',style: TextStyle(fontSize: 15,color: Colors.grey),),
            Spacer(),
            Text('123456789',style: TextStyle(fontSize: 15),),
          ],),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: 100,
                  child: MaterialButton(
                    height: 45,
                    color: defaultColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Montserrat'),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil<void>(
                        context,
                        MaterialPageRoute<void>(builder: (BuildContext context) => const OccasionHomeLayout()),
                        ModalRoute.withName('/'),
                      );
                    },

                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));

Widget drawerScreen (BuildContext context) =>  Drawer(
  width: 250,
  child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      const DrawerHeader(
        child: null,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/OccasionLoginLogo.png"),
                fit: BoxFit.fill)),
      ),
      Container(
        padding: EdgeInsets.zero,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: <Widget>[
                const Icon(
                  Icons.menu,
                  size: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  const MyBooking())
                      );
                    },
                    child: Text('My Bookings ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: defaultColor,
                        )),
                  ),
                )
              ]),
            ),

            const SizedBox(height: 5),
            Divider(
              color: defaultColor,
              thickness: 4,
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: <Widget>[
                const Icon(
                  Icons.info,
                  size: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  const AboutUs())
                      );

                    },
                    child: Text('About Us ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: defaultColor,
                        )),
                  ),
                )
              ]),
            ),
            const SizedBox(height: 5),
            Divider(
              color: defaultColor,
              thickness: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: <Widget>[
                const Icon(
                  Icons.logout,
                  size: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextButton(
                    onPressed: () {
                      signOut(context);
                    },
                    child: Text('Sign Out ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: defaultColor,
                        )),
                  ),
                )
              ]),
            ),
          ],
        ),
      )
    ],
  ),
);


