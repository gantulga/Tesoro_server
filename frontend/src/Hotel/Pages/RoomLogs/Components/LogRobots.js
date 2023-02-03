//import { store } from "react-notifications-component";

export async function getLogs(token) {
  let url = "http://" + this.props.ip_address + "/api/hotel/clientlogs/";
  var logs = await fetch(url, {
    method: "GET",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
      Authorization: "Token " + token,
    },
  })
    .then((results) => results.json())
    .then((response) => {
      return response;
    });

  return logs;
}
