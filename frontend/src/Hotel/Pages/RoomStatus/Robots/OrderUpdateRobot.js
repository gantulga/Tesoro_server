import { fetchPut } from "./FetchPutRobot";
import { fetchPost } from "./FetchPostRobot";
import { store } from "react-notifications-component";

export async function updateOrder(data, token, ip_address) {
  var status;
  var responseValue1;
  var responseValue2;
  if (data.underAmount === 0) {
    status = "Төлбөр гүйцэт төлсөн.";
  } else if (data.underAmount === data.orderAmount) {
    status = "Төлбөр төлөгдөөгүй.";
  } else if (data.underAmount > 0) {
    status = "Төлбөр дутуу төлсөн.";
  } else if (data.underAmount < 0) {
    status = "Төлбөр илүү төлсөн.";
  }
  var orderObj = {
    amount: data.orderAmount,
    status: status,
    updated_at: data.updated_at,
    updated_by: data.updated_by,
    payments: data.paymentsList,
  };
  var urlPut =
    "http://" + ip_address + "/api/hotel/orders/" + data.orderId + "/";
  var orderResponse = fetchPut(orderObj, token, urlPut);
  await orderResponse.then(
    await function (val) {
      responseValue1 = val["ok"];
    }
  );
  if (responseValue1 === true) {
    if (data.detialsList.length !== 0) {
      data.detialsList.map(async (detial, index) => {
        var detialObj = {
          client: data.client,
          order: detial.order,
          product: detial.product,
          subtotal: detial.subtotal,
          quantity: detial.quantity,
          created_by: detial.created_by,
          fr_client: detial.client,
        };
        var urlPost = "http://" + ip_address + "/api/hotel/ordersDetials2/";
        var detialResponse = fetchPost(detialObj, token, urlPost);
        console.log(detialResponse);
        await detialResponse.then(
          await function (val) {
            console.log(val);
            responseValue2 = val["ok"];
          }
        );
        if (responseValue2 === true) {
          store.addNotification({
            title: "Анхаар!",
            message: "Захиалгад бараа амжилттай нэмэгдлээ!",
            type: "success",
            insert: "top",
            container: "top-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 5000,
              onScreen: true,
            },
          });
        } else {
          store.addNotification({
            title: "Анхаар!",
            message:
              "Захиалгын барааг хадгалах үед алдаа гарлаа. Системийн инженерт хандана уу!",
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
      });
    } else {
      store.addNotification({
        title: "Анхаар!",
        message: "Гүйлгээний мэдээлэл амжилттай хадгалагдлаа.",
        type: "success",
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
  } else {
    store.addNotification({
      title: "Анхаар!",
      message:
        "Захиалгын гүйлгээг хадгалах үед алдаа гарлаа. Системийн инженерт хандана уу!",
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

  return responseValue2;
}
