export async function createOrderDetial(data, token, ip_address) {
  var jsonObj = {};
  let status;
  let responseObj = {};
  Object.keys(data).map(function (key) {
    jsonObj[key] = data[key];
    return null;
  });
  let url = "http://" + ip_address + "/api/hotel/ordersDetials/";
  await fetch(url, {
    method: "POST",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
      Authorization: "Token " + token,
    },
    withCredentials: true,
    body: JSON.stringify(jsonObj),
  })
    .then((results) => {
      if (results.status === 200 || results.status === 201) {
        status = "Success";
      } else {
        status = "Failed";
      }
      return results;
    })
    .then((results) => results.json())
    .then((response) => {
      if (response.id) {
        responseObj = { id: response.id, date_error: null };
      } else {
        responseObj = {
          id: null,
          date_error: response.date_error,
        };
      }
    });
  responseObj = { ...responseObj, status: status };
  return responseObj;
}
