export function createPayment(paymentList, token, ip_address) {
  console.log(paymentList);
  var responseObjArr = [];
  paymentList.map(async (data) => {
    console.log(data);
    var jsonObj = {};
    let status;
    let responseObj = {};
    Object.keys(data).map(function (key) {
      jsonObj[key] = parseInt(data[key]);
      console.log(jsonObj[key]);
      return null;
    });
    console.log(jsonObj);
    let url = "http://" + ip_address + "/api/hotel/payments/";
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
        console.log(results);
        if (results.status === 200 || results.status === 201) {
          status = "Success";
        } else {
          status = "Failed";
        }
        return results;
      })
      .then((results) => results.json())
      .then((response) => {
        console.log(response);
        if (response.id) {
          responseObj = { id: response.id };
        } else {
          responseObj = { id: null };
        }
      });
    responseObj = { ...responseObj, status: status };
    responseObjArr.push(responseObj);
    return null;
  });
  return responseObjArr;
}
