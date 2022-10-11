import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/cubit/cubit.dart';
import '../../../layout/cubit/states.dart';
import '../../../models/Halls_Model/details_hotels_model.dart';
import '../../../shared/components/components.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OccasionCubit, OccasionStates>(
      listener: (BuildContext context, OccasionStates states) {},
      builder: (BuildContext context, OccasionStates states) {
        var model = OccasionCubit.get(context).detailsOfHotelsModel!;
        return Scaffold(
          body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: _buildInfo(model, context)),
        );
      },
    );
  }
}

Widget _buildInfo(DetailsOfHotelsModel model, context) {
  return Container(
      padding: const EdgeInsets.all(15),
      child: ListView.separated(
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About as',
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Color(0xffBB2036),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '${model.info![index].aboutAs}',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Start',
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Color(0xffBB2036),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${model.info![index].start}',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'End',
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Color(0xffBB2036),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${model.info![index].end}',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Review',
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Color(0xffBB2036),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${model.info![index].review}',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Deals',
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Color(0xffBB2036),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${model.info![index].deals}',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
          ],
        ),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: model.info!.length,
      ));
}
