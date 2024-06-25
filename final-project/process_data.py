import requests

def filter_data(data):
    if data:
        weather_list = []
        count = 0
        average = 0
        for day in data["days"]:
            weather_list.append({"datetime": day["datetime"],
                                 "humidity": day["humidity"],
                                 "temperature_day": day["temp"],
                                 "temperature_night": day["temp"]})
            for hour in day["hours"]:
                if hour["datetime"] == "07:00:00":
                    weather_list[count].update({"temperature_day": hour["temp"]})
                    average += weather_list[count]['temperature_day']

                if hour["datetime"] == "21:00:00":
                    weather_list[count].update({"temperature_night": hour["temp"]})
                    count += 1
        average = round(average / count, 1)
        weather_list.append({"average": average})
        return weather_list

# def weather_clothing()

def get_data(location):
    url = f"""https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/{location}/next7days?&key=UD49KK84DR6KZ3M93CHWZFVVN&include=hours&unitGroup=metric"""
    print(url)
    try:
        response = requests.get(url)

    except:
        print("error")
        return "error happened"

    if response.status_code == 200:
        return response.json()
    return False
