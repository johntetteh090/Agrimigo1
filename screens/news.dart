import 'package:agrimigo/components/news_card.dart';
import 'package:agrimigo/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:agrimigo/components/customListTile.dart';
import 'package:agrimigo/models/article_model.dart';
import 'package:agrimigo/services/api_service.dart';
class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<String> _newsData = [
    "Et laboris culpa excepteur cupidatat nulla deserunt sunt id aliqua reprehenderit do ea adipisicing ut. Quis sit quis fugiat enim cillum aliqua ea ut cillum. Esse cupidatat aliqua cupidatat irure tempor anim cupidatat duis sunt exercitation. Occaecat laboris ut occaecat cillum. Qui proident qui ad consequat ipsum veniam.",
    "Et laboris culpa excepteur cupidatat nulla deserunt sunt id aliqua reprehenderit do ea adipisicing ut. Quis sit quis fugiat enim cillum aliqua ea ut cillum. Esse cupidatat aliqua cupidatat irure tempor anim cupidatat duis sunt exercitation. Occaecat laboris ut occaecat cillum. Qui proident qui ad consequat ipsum veniam.",
    "Et laboris culpa excepteur cupidatat nulla deserunt sunt id aliqua reprehenderit do ea adipisicing ut. Quis sit quis fugiat enim cillum aliqua ea ut cillum. Esse cupidatat aliqua cupidatat irure tempor anim cupidatat duis sunt exercitation. Occaecat laboris ut occaecat cillum. Qui proident qui ad consequat ipsum veniam.",
    "Et laboris culpa excepteur cupidatat nulla deserunt sunt id aliqua reprehenderit do ea adipisicing ut. Quis sit quis fugiat enim cillum aliqua ea ut cillum. Esse cupidatat aliqua cupidatat irure tempor anim cupidatat duis sunt exercitation. Occaecat laboris ut occaecat cillum. Qui proident qui ad consequat ipsum veniam.",
    "Et laboris culpa excepteur cupidatat nulla deserunt sunt id aliqua reprehenderit do ea adipisicing ut. Quis sit quis fugiat enim cillum aliqua ea ut cillum. Esse cupidatat aliqua cupidatat irure tempor anim cupidatat duis sunt exercitation. Occaecat laboris ut occaecat cillum. Qui proident qui ad consequat ipsum veniam."
  ];

  ApiService client =ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: newsBody()
    );
  }

 Widget newsBody() {

    return Column(
      children: [

        newsHeader(),

        SizedBox(height: 5),

        //The http news
        Expanded(
            child: FutureBuilder(
                future: client.getArticle(),
                builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot){

                  if(snapshot.hasData){

                    List<Article> articles = snapshot.data!;

                   // return Text('${articles.length}');
                    return ListView.builder(
                itemCount: articles.length,
                  itemBuilder: (context,index) => customListTile(articles[index])



              );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
            )
        )
      ],
    );





 }

  Widget newsHeader() {

   return Container(
      height: 100,
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'News',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'MontserratSemiBold',
                  fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Current news in the agriculture sector',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'MontserratThin',
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );

  }
}
