from app import app, USERS

def test_full_user_flow():
    USERS.clear()  # Reset memory

    client = app.test_client()

    # Add user
    res1 = client.post("/users", json={"name": "TestUser"})
    assert res1.status_code == 201

    # Fetch users
    res2 = client.get("/users")
    assert "TestUser" in res2.json["users"]
