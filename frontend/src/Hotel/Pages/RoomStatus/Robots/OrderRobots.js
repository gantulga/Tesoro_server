//import { store } from "react-notifications-component";

export async function createOrder(data, token, ip_address) {
  var jsonObj = {};
  let status;
  let responseObj = {};
  Object.keys(data).map(function (key) {
    if (key === "status") {
      if (!data["paidAmount"]) {
        data["paidAmount"] = 0;
      }
      if (data["paidAmount"] === 0 || data["paidAmount"] === null) {
        jsonObj[key] = "Төлбөр төлөгдөөгүй.";
      } else if (
        data["paidAmount"] > 0 &&
        data["paidAmount"] < data["amount"]
      ) {
        jsonObj[key] = "Төлбөр дутуу төлсөн.";
      } else if (
        data["paidAmount"] > 0 &&
        data["paidAmount"] > data["amount"]
      ) {
        jsonObj[key] = "Төлбөр илүү төлсөн.";
      } else if (
        data["paidAmount"] > 0 &&
        data["paidAmount"] === data["amount"]
      ) {
        jsonObj[key] = "Төлбөр гүйцэт төлсөн.";
      }
    } else if (key === "paidAmount" || key === "underpayment") {
    } else if (key === "amount") {
      jsonObj[key] = parseInt(data["amount"]);
    } else if (key === "is_now") {
      var now = new Date();
      var frDate = data["required_date"];
      var zuruu = frDate.getTime() - now.getTime();
      if (zuruu < 54000) {
        jsonObj[key] = true;
      } else {
        jsonObj[key] = false;
      }
    } else {
      jsonObj[key] = data[key];
    }
    return null;
  });

  let url = "http://" + ip_address + "/api/hotel/newRoomOrder/";
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
        responseObj = { id: null, date_error: response.date_error };
      }
    });

  responseObj = { ...responseObj, status: status };
  return responseObj;
}
