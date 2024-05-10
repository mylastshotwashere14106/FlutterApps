import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tap2024/models/popular_model.dart';

class PopularView extends StatelessWidget {
   PopularView({super.key, this.popularModel});

  PopularModel? popularModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child:CachedNetworkImage(
        imageUrl: 'https://image.tmdb.org/t/p/w500/${popularModel!.backdropPath}',
        placeholder: (context,url)=> const CircularProgressIndicator(),
        errorWidget: (context, url, error) => Image.network('https://resources.techsaga.co.in/wp-content/uploads/2024/03/TS-BANNER-1-2.jpg'),
      ) 
    );
  }
}