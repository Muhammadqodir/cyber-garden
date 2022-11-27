import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:url_launcher/url_launcher.dart';
import 'package:syber_garden/utils/circle.dart';

class GenerateIcon {
  Future<String> getIcon(String q) async {
    http.Response response = await http.get(Uri.parse(
      'https://www.flaticon.com/search?word=' + q + '&color=black&order_by=4',
    ));
    var doc = parse(response.body);
    log(response.body);
    log("searching");
    var icon = doc.querySelector('.link-icon-detail');
    log(icon?.innerHtml ?? "not found");
    var icon_url = icon?.querySelector('img')!.attributes['data-src'] ??
        "https://img.icons8.com/ios-filled/2x/christmas-star.png";
    return icon_url;
  }

  Future<List<Circle>> genRoadMap(String position) async {
    List<Circle> roadMap = [];

    http.Response response = await http.get(Uri.parse(
      'https://api.hh.ru/vacancies?text=$position&per_page=20&only_with_salary=true&search_field=name',
    ));
    log(response.body);
    Map<String, dynamic> skills = {};
    Map<String, dynamic> jsonObject = jsonDecode(response.body);
    log("searching");
    List<dynamic> items = jsonObject["items"];
    for (Map<String, dynamic> item in items) {
      Map<String, dynamic> salary = item["salary"];
      if (salary.containsKey("from")) {
        log(salary["from"].toString());
        List<dynamic> key_skills = jsonDecode(
            (await http.get(Uri.parse(item["url"]))).body)["key_skills"];
        for (var sk in key_skills) {
          if (skills.containsKey(sk["name"])) {
            skills[sk["name"]]["frequency"] += 1;
            // if(skills[sk["name"]]["salary"] > salary["from"]??100000000){
            //   skills[sk["name"]]["salary"] = salary;
            // }
          } else {
            var init_data = {
              "frequency": 1,
              "salary": salary["from"] ?? 1000000000
            };
            skills[sk["name"]] = init_data;
          }
        }
      }
    }
    var sortedByKeyMap = Map.fromEntries(skills.entries.toList()
      ..sort((a, b) => b.value['frequency'].compareTo(a.value['frequency'])));
    for (var skill in sortedByKeyMap.keys) {
      roadMap.add(Circle(
          title: skill,
          imgUrl: "notloaded",
          salary: sortedByKeyMap[skill]["salary"]));
    }
    return roadMap;
  }

  Future<List<Widget>> getCards(String theme) async {
    List<Widget> cards = [];

    http.Response response = await http.get(Uri.parse(
      'https://serpapi.com/search.json?engine=google&q=$theme курсы&gl=ru&api_key=95b8795a8f0ab0ddc95a5e571153f7a01fbd841a1e56a6a0c3ecfa4fd404f57a',
    ));
    log(response.body);
    Map<String, dynamic> jsonObject = jsonDecode(response.body);
    log("searching");
    List<dynamic> organic_results = jsonObject["organic_results"];

    for (Map<String, dynamic> item in organic_results) {
      cards.add(getCard(item["title"], item["snippet"], item["link"]));
    }
    return cards;
  }

  Widget getCard(String title, String desc, String url) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 49, 52, 95),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  desc,
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                // const Image(
                //   width: 30,
                //   height: 30,
                //   image: NetworkImage(
                //       'https://cdn-icons-png.flaticon.com/512/1384/1384060.png'),
                //   fit: BoxFit.cover,
                // ),
                Container(
                  width: 200,
                  child: Text(
                    url,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                SizedBox(
                  height: 30,
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: Color(0xff388461),
                    onPressed: () {
                      var url_ = Uri.parse(url);
                      launchUrl(url_);
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Перейти',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
