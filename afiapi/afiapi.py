from afitop100 import AFITop100
from flask import Flask, jsonify, redirect
import logging

log = logging.getLogger(__name__)

app = Flask(__name__)
app.config["DEBUG"] = True

afi = AFITop100()
afi.scrape_afi_list()


@app.route("/", methods=["GET"])
def home():
    return redirect("/api/v1/resources/afitop100/all", code=301)


@app.route("/api/v1/resources/afitop100/all", methods=["GET"])
def api_all():
    return jsonify(afi.afi_list)


@app.errorhandler(404)
def page_not_found(e):
    return "<h1>NOT FOUND</h1>", 404


if __name__ == "__main__":
    app.run(use_reloader=False, host="0.0.0.0")
