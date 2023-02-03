export async function fetchUserId(username, token, ip_address) {
  var users = await fetch("http://" + ip_address + "/api/users/", {
    method: "GET",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
      Authorization: "Token " + token,
    },
  }).then((results) => results.json());

  var userId;
  users.map((el) => {
    if (el.username === username) {
      userId = el.id;
    }
    return null;
  });
  return userId;
}
