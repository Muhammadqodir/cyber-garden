import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:syber_garden/utils/circle.dart';

class GenerateIcon {
  Future<String> getIcon(String q) async {
    http.Response response = await http.get(Uri.parse(
      'https://www.flaticon.com/search?word='+q+'&color=black&order_by=4',
    ));
    var doc = parse(response.body);
    log(response.body);
    log("searching");
    var icon = doc.querySelector('.link-icon-detail');
    log(icon?.innerHtml??"not found");
    var icon_url =
        icon?.querySelector('img')!.attributes['data-src'] ?? "https://img.icons8.com/ios-filled/2x/christmas-star.png";
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
    for(Map<String, dynamic> item in items){
      Map<String, dynamic> salary = item["salary"];
      if(salary.containsKey("from")){
        log(salary["from"].toString());
        List<dynamic> key_skills = jsonDecode((await http.get(Uri.parse(item["url"]))).body)["key_skills"];
        for(var sk in key_skills){
          if(skills.containsKey(sk["name"])){
            skills[sk["name"]]["frequency"] += 1;
            // if(skills[sk["name"]]["salary"] > salary["from"]??100000000){
            //   skills[sk["name"]]["salary"] = salary;
            // }
          }else{
            var init_data = {
              "frequency": 1,
              "salary": salary["from"]??1000000000
            };
            skills[sk["name"]] = init_data;
          }
        }
      }
    }
    var sortedByKeyMap = Map.fromEntries(skills.entries.toList()
    ..sort((a, b) => b.value['frequency'].compareTo(a.value['frequency'])));
    for(var skill in sortedByKeyMap.keys){
      roadMap.add(Circle(title: skill, imgUrl: "notloaded", salary: sortedByKeyMap[skill]["salary"]));
    }
    return roadMap;
  }
}
