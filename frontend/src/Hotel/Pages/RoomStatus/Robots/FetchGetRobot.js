import { store } from "react-notifications-component";
export async function fetchGet(url, token) {
  var cost = await fetch(url, {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
      Authorization: "Token " + token,
    },
  })
    .then(async (response) => {
      const data = await response.json();
      return data;
    })
    .catch((error) => {
      store.addNotification({
        title: "Анхаар!",
        message:
          "Алдаа гарлаа. Системийн инженертэй холбогдож хэлнэ үү! Алдааны мэдээлэл: " +
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
  return cost;
}
