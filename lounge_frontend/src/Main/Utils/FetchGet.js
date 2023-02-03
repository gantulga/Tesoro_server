import { store } from "react-notifications-component";
export function fetchGet(url, token, hezee) {
  var responseData = {};
  fetch(url, {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
      Authorization: "Token " + token,
    },
  })
    .then((response) => {
      responseData = { status: response.status, success: response.ok };
      if (response.status === 200) {
        var jsonResponse = response.json();
        responseData = { ...responseData, data: jsonResponse };
      } else {
        store.addNotification({
          title: "Анхаар!",
          message:
            hezee +
            " үед алдаа гарлаа. Системийн инженертэй холбогдож хэлнэ үү! Алдааны мэдээлэл: " +
            response.status,
          type: "danger",
          insert: "top",
          container: "top-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      }
    })
    .catch((error) => {
      responseData = { ...responseData, error: error };
      store.addNotification({
        title: "Анхаар!",
        message:
          hezee +
          " үед алдаа гарлаа. Системийн холболтонд алдаа гарлаа! Алдааны мэдээлэл: " +
          error,
        type: "danger",
        insert: "top",
        container: "top-right",
        animationIn: ["animated", "fadeIn"],
        animationOut: ["animated", "fadeOut"],
        dismiss: {
          duration: 5000,
          onScreen: true,
        },
      });
    });
  console.log(responseData);
  return responseData;
}
