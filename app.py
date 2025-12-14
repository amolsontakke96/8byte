from flask import Flask, jsonify, request, render_template

app = Flask(__name__)

# In-memory storage (NO database)
USERS = []

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/users", methods=["GET", "POST"])
def users():
    if request.method == "POST":
        data = request.get_json()
        name = data.get("name")

        if not name:
            return jsonify({"error": "Name is required"}), 400

        USERS.append(name)
        return jsonify({"message": "User added", "users": USERS}), 201

    return jsonify({"users": USERS})

if __name__ == "__main__":
    app.run(debug=True)
