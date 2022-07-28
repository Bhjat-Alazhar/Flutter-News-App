import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/moudules/web_view.dart';

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            testImage(article),
            SizedBox(width: 15),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        "${article['title']}",
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${article['publishedAt']}",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget buildSourceItem(source, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(source['url']));
      },
      child: ConditionalBuilder(
        condition: (source['country'] == 'us' ||
                    source['country'] == 'sa' ||
                    source['country'] == 'ae' ||
                    source['country'] == 'uk') &&
                source['language'] == 'en' ||
            source['language'] == 'ar',
        builder: (context) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 120.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${source['name']}",
                        style:Theme.of(context).textTheme.subtitle1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Text(
                          "${source['description']}",
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "Category : ${source['category']}",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 15,
                        indent: 15,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        fallback: (context) => Center(),
      ),
    );

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          thickness: 1,
          endIndent: 15,
          indent: 15,
        ),
        itemCount: list.length,
        physics: BouncingScrollPhysics(),
      ),
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );

Widget sourceBuilder(
  list,
  context,
) =>
    ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.builder(
        itemBuilder: (context, index) => buildSourceItem(list[index], context),
        itemCount: list.length,
        physics: BouncingScrollPhysics(),
      ),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );



void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Widget testImage(article) {
  return article['urlToImage'] == null
      ? Container(
          child: Center(
              child: Text(
            "No Image Available",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white70),
          )),
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(10.0)),
        )
      : Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(article['urlToImage']),
            ),
          ),
        );
}
