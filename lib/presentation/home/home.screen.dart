import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkwell/app/data/models/news_model.model.dart';
import 'package:inkwell/presentation/widgets/news_card.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      top: false,
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            title: const Text('InkWell'),
            forceMaterialTransparency: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: SearchBar(
                  leading: const Icon(Icons.search),
                  hintText: "Search...",
                  elevation: const MaterialStatePropertyAll(5.0),
                  onSubmitted: (value) {
                    controller.getArticleListBySearch(query: value);
                  },
                ),
              ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/icons/quill.png",
                        repeat: ImageRepeat.noRepeat,
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Text(
                        'InkWell',
                        style: GoogleFonts.firaSans(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Get.theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  itemCount: controller.chips.keys.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    String title = controller.chips.keys.toList()[index];
                    return ListTile(
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      title: Text(title),
                      onTap: () {
                        controller.getArticleListByCategory(category: title);
                        Get.back();
                      },
                      leading: Icon(controller.chips[title]),
                    );
                  },
                ),
              ],
            ),
          ),
          body: ListView.builder(
            itemCount: controller.articles.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              NewsModel article = controller.articles[index];
              return NewsCardWidget(
                title: article.title ?? "No Title",
                description: article.description ?? "No Description",
                imageUrl:
                    article.urlToImage ?? "https://placehold.co/600x400.png",
                publishedAt: article.publishedAt ?? "No Publish Date",
                url: article.url ?? "No Url", source: article.source!.name ?? "No Source",
              );
            },
          ),
        ),
      ),
    );
  }
}
