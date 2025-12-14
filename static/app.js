async function addUser() {
    const name = document.getElementById("name").value;

    await fetch("/users", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ name })
    });

    loadUsers();
}

async function loadUsers() {
    const res = await fetch("/users");
    const data = await res.json();

    const list = document.getElementById("users");
    list.innerHTML = "";

    data.users.forEach(user => {
        const li = document.createElement("li");
        li.innerText = user;
        list.appendChild(li);
    });
}

loadUsers();
