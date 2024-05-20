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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      child:ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              imageUrl: 'https://image.tmdb.org/t/p/w500/${popularModel!.backdropPath}',
              placeholder: (context,url)=> const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.network('https://resources.techsaga.co.in/wp-content/uploads/2024/03/TS-BANNER-1-2.jpg'),
            ),
            Container(
              height: 60,
              color: Colors.black54,
              child: ListTile(
                title: Text(popularModel!.title,style: TextStyle(color: Colors.white)),
                subtitle: Text(popularModel!.releaseDate,style: TextStyle(color: Colors.white),maxLines: 1,),
                trailing: IconButton(
                  onPressed: ()=>Navigator.pushNamed(context,'/detail',arguments: popularModel),
                  icon: const Icon(Icons.chevron_right), 
                  color: Colors.white,),
              ),
            )
          ],
        ),
      ) 
    );
  }
}