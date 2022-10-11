import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Login_Screen/Login_Cubit/cubit.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {

    OccasionLoginCubit  cubit = OccasionLoginCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            cubit.submit(context);
          }, child: Text('SKIP',style: TextStyle(color: defaultColor,fontWeight: FontWeight.bold,fontSize: 18),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if(index == cubit.boarding.length - 1)
                    {
                      setState(() {
                        cubit.isLast = true;
                      });
                    }
                  else
                      {
                        setState(() {
                          cubit.isLast = false;
                        });
                      }
                },
                controller: cubit.boardController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildOnboardingItem(cubit.boarding[index]),
                itemCount: cubit.boarding.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: cubit.boardController,
                  count: cubit.boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                    expansionFactor: 3.5,
                    dotWidth: 14,
                    spacing: 5
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (cubit.isLast)
                      {
                        cubit.submit(context);
                      }
                    else
                      {
                        cubit.boardController.nextPage(duration: const Duration(milliseconds: 750), curve: Curves.fastLinearToSlowEaseIn);
                      }

                  },
                  backgroundColor: defaultColor,
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
