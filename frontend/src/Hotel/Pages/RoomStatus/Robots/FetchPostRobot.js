export async function fetchPost(data, token, url) {
  var response = await fetch(url, {
    method: "POST",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
      Authorization: "Token " + token,
    },
    withCredentials: true,
    body: JSON.stringify(data),
  }).then((results) => {
    return results;
  });
  return response;
}
