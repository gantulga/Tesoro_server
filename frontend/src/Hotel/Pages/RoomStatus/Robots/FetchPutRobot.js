export async function fetchPut(data, token, url) {
  var response = await fetch(url, {
    method: "PATCH",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
      Authorization: "Token " + token,
    },
    withCredentials: true,
    body: JSON.stringify(data),
  }).then((results) => {
    //   if (results.status === 200 || results.status === 201) {
    //     status = "Success";
    //   } else {
    //     status = "Failed";
    //   }
    return results;
  });
  //     .then((results) => results.json())
  //     .then((response) => {
  //       console.log(response);
  //       return response;
  //     });
  //   console.log(response);
  return response;
}
