from flask import Flask, render_template, request
from process_data import get_data, filter_data
from deep_translator import GoogleTranslator

app = Flask(__name__)


@app.route('/', methods=["GET"])
def home():
    return render_template("home.html")


@app.route('/result', methods=["POST", "GET"])
def result():
    location = request.form.get("location")
    location = GoogleTranslator(source='auto', target='en').translate(location)
    print(location)
    data = get_data(location)
    if not data:
        return "error could not retrieve result try again" + render_template("home.html")
    weather_list = filter_data(data)
    return render_template("results.html",
                           weather_list=weather_list,
                           location=GoogleTranslator(source='auto', target='en').translate(data['resolvedAddress']))


if __name__ == '__main__':
    app.run()
