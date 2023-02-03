export async function createUser(data, token, ip_address) {
  var jsonObj = {};
  let status;
  let responseObj = {};
  Object.keys(data).map(function (key) {
    if (key === "mobile") {
      if (!data["mobile"]) {
        jsonObj["mobile"] = null;
      } else {
        jsonObj[key] = data[key];
      }
    } else {
      jsonObj[key] = data[key];
    }
    return null;
  });

  if (data.customerId) {
    let url =
      "http://" + ip_address + "/api/customers/" + data.customerId + "/";
    await fetch(url, {
      method: "PUT",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: "Token " + token,
      },
      withCredentials: true,
      body: JSON.stringify(jsonObj),
    })
      .then((results) => {
        if ((results.status === 200) | (results.status === 201)) {
          status = "Success";
        } else {
          status = "Failed";
        }
        return results;
      })
      .then((response) => {
        return response;
      })
      .then((results) => results.json())
      .then((response) => {
        if (response.id) {
          responseObj = { id: response.id };
        } else {
          responseObj = { id: null };
        }
      });
    responseObj = { ...responseObj, status: status };
    return responseObj;
  } else {
    await fetch("http://" + ip_address + "/api/customers/", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: "Token " + token,
      },
      body: JSON.stringify(jsonObj),
    })
      .then((results) => {
        if ((results.status === 200) | (results.status === 201)) {
          status = "Success";
        } else {
          status = "Failed";
        }
        return results;
      })
      .then((response) => {
        return response.json();
      })
      .then((response) => {
        if (response.id) {
          responseObj = { id: response.id };
        }
      });
    responseObj = { ...responseObj, status: status };
    return responseObj;
  }
}
