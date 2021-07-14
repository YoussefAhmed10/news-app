import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:newapp/modules/weviewr/webview.dart';

Widget articleItem(article, context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WebViewScreen(article['url'])),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.0,
            width: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: article['urlToImage'] == null
                      ? NetworkImage(
                          'https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg')
                      : NetworkImage('${article['urlToImage']}'),
                )),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '${article['description']}',
                    maxLines: 2,
                  ),
                  Text(
                    '${article['publishedAt']}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildArticleItem(context, list, {isSearch = false}) {
  return Conditional.single(
    context: context,
    conditionBuilder: (BuildContext context) => list.length > 0,
    widgetBuilder: (BuildContext context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => articleItem(list[index], context),
      separatorBuilder: (ctx, index) => Divider(
        color: Colors.grey,
        height: 5,
        thickness: 1,
      ),
      itemCount: list.length,
    ),
    fallbackBuilder: (BuildContext context) => isSearch
        ? Container(
            child: Center(
              child: Text(
                'Please do some reaserch',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          ),
  );
}
