import requests

job = input("Job: ")
response = requests.get("https://api.hh.ru/vacancies?text="+job+"&per_page=40")

data = response.json()
print("Items count: "+str(data["found"]))

skills = []
for item in data["items"]:
  if item["salary"] != None:
    print(item["name"]+"("+str(item["salary"]["from"])+"-"+str(item["salary"]["to"])+")")
    key_skills = requests.get(item["url"]).json()["key_skills"]
    for key in key_skills:
      skills.append(key["name"])
    print("-------------------------\n")

print("\n\nSkills:")
my_dict = {i:skills.count(i) for i in skills}
print(my_dict)