import sys
import os
sys.path.append(
        os.path.abspath(os.path.join(os.path.dirname(__file__), '../../'))
)

from app import app

def test_home_page():
    client = app.test_client()
    response = client.get("/")
    assert response.status_code == 200

def test_get_users_empty():
    client = app.test_client()
    response = client.get("/users")
    assert response.json == {"users": []}

def test_add_user():
    client = app.test_client()
    response = client.post("/users", json={"name": "Amol"})
    assert response.status_code == 201
    assert "Amol" in response.json["users"]
