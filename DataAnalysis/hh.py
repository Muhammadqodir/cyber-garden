import requests
import json

job = input("Job: ")
response = requests.get("https://api.hh.ru/vacancies?text="+job+"&per_page=40&only_with_salary=true&search_field=name")

data = response.json()
print("Items count: "+str(data["found"]))

skills = {}
for item in data["items"]:
  if item["salary"] != None:
    salary = str(item["salary"]["from"])+"-"+str(item["salary"]["to"])
    salary = item["salary"]["from"]
    print(item["name"]+"("+salary+")")
    key_skills = requests.get(item["url"]).json()
    for key in key_skills["key_skills"]:
      if key["name"] in skills:
        skills[key["name"]]["frequency"] += 1
        skills[key["name"]]["items"].append({"title": key_skills["name"], "salary":salary})
      else:
        init_data = {
          "frequency": 1,
          "items": [
            {
              "title": key_skills["name"],
              "salary": salary
            }
          ]
        }
        skills[key["name"]] = init_data
    print("-------------------------\n")

print("\n\nSkills:")
print(json.dumps(skills, indent = 4))