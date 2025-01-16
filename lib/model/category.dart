import 'dart:ui';

class MyCategory{
  static const String sportsId = 'sports';
  static const String moviesId = 'movies';
  static const String musicsId = 'musics';
  String id ;
  late String title;
  late String image;

  MyCategory({required this.id , required this.title , required this.image});

  MyCategory.formId(this.id){
    if(id == sportsId){
      title = 'Sports';
      image = 'asstets/images/sports.png';
    } else if (id == moviesId){
      title = 'Movies';
      image = 'asstets/images/movies.png';
    } else if (id == musicsId){
      title = "Musics";
      image = 'asstets/images/music.png';
    }
  }

  static List<MyCategory> getCategory(){
    return [
      MyCategory.formId(sportsId),
      MyCategory.formId(musicsId),
      MyCategory.formId(moviesId),
    ];
  }
}