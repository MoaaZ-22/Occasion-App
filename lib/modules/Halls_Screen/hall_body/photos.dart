import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../layout/cubit/cubit.dart';
import '../../../layout/cubit/states.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  List<String> imageList = [
    'https://thumbs.dreamstime.com/b/hotel-lobby-luxury-staircases-fountain-39479289.jpg',
    'https://cf.bstatic.com/xdata/images/hotel/max1024x768/284754113.jpg?k=a194302efbfa2168f9c348686e36985c41fbb8435cf4a2f4f8e844721f1218de&o=&hp=1',
    'https://cf.bstatic.com/xdata/images/hotel/max1024x768/284754113.jpg?k=a194302efbfa2168f9c348686e36985c41fbb8435cf4a2f4f8e844721f1218de&o=&hp=1',
    'https://thumbs.dreamstime.com/b/hotel-lobby-luxury-staircases-fountain-39479289.jpg',
    'https://thumbs.dreamstime.com/b/hotel-lobby-luxury-staircases-fountain-39479289.jpg',
    'https://thumbs.dreamstime.com/b/hotel-lobby-luxury-staircases-fountain-39479289.jpg',
    'https://thumbs.dreamstime.com/b/hotel-lobby-luxury-staircases-fountain-39479289.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OccasionCubit, OccasionStates>(
      listener: (BuildContext context, OccasionStates states) {},
      builder: (BuildContext context, OccasionStates states) {
        var model = OccasionCubit.get(context).detailsOfHotelsModel!;
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            margin: const EdgeInsets.all(12),
            child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                itemCount: model.images!.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        child: Image.network(
                          '${model.images![index].name}',
                          fit: BoxFit.cover,
                        )),
                  );
                },
                staggeredTileBuilder: (index) {
                  return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                }),
          ),
        );
      },
    );
  }
}
