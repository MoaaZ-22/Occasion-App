import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../models/Organizers_Model/organizers_model.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/color.dart';
import '../../shared/styles/styles.dart';
import 'organizersProfile_screen/profile_details.dart';


class OrganizersScreen extends StatelessWidget {
  const OrganizersScreen({Key? key}) : super(key: key);

//jp
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OccasionCubit, OccasionStates>(
      listener: (BuildContext context, OccasionStates states) {},
      builder: (BuildContext context, OccasionStates states) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                ' Smart  Occasion  System ',
                style: kHomeTitleStyle,
              ),
              iconTheme: IconThemeData(
                color: defaultColor,
                size: 35,
              ),
            ),
            drawer:drawerScreen(context),
            body: ConditionalBuilder(
                condition: OccasionCubit.get(context).organizerHomeModel != null,
                builder: (context) => organizersBuilder(OccasionCubit.get(context).organizerHomeModel!, context),
                fallback: (BuildContext context) => SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(100.0),
                      child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: defaultColor,
                            strokeWidth: 5.0,
                          )
                      )
                      ,
                    )
                )
            )
        );
      },
    );
  }

  Widget organizersBuilder(OrganizerHomeModel model, BuildContext context) =>
      ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: model.data?.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              navigateTo(context,
                  OrganizerProfile(teamid:model.data?[index].id)
              );
            },

            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: FadeInImage(
                              fit: BoxFit.cover,
                              width: 400,
                              height:500,
                              placeholder: const NetworkImage(
                                  'https://image.shutterstock.com/image-vector/no-image-vector-symbol-missing-260nw-1310632172.jpg'),
                              image:
                              NetworkImage(model.data![index].image!),
                              imageErrorBuilder:
                                  (context, error, stackTrace) {
                                return Image.network(
                                  'https://image.shutterstock.com/image-vector/no-image-vector-symbol-missing-260nw-1310632172.jpg',
                                  fit: BoxFit.cover,
                                );
                              }),
                        ),
                        Positioned(
                          bottom: -35.0,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                                "${model.data?[index].imageprofile}"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 20,
                    child: ListTile(
                      title: Center(
                          child: Text(
                            '${model.data?[index].name}',
                            style: orgNameStyle,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 60,
                    child: ListTile(

                      title: Text(
                        'About Us',
                        style: orgNameStyle,
                      ),
                      subtitle: Text(
                        '${model.data?[index].about}',
                        style: orgTitle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      );
}
