import { store } from "react-notifications-component";
import { createUser } from "./CustomerRobots";
import { createOrder } from "./OrderRobots";
import { createOrderDetial } from "./OrderDetialRobots";
// import { createPayment } from "./PaymentRobots";
import { getUserId } from "../../../../Main/Utils/Auth";

export async function dataRecipient(data, token, ip_address) {
  var userId = getUserId();
  var createUserResp;
  var customerId;

  //Customer
  var customerObj = {
    customerId: data.customerId,
    lastname: data.lastname,
    firstname: data.firstname,
    register: data.register,
    mobile: data.mobile,
    email: data.email,
    address: data.address,
    created_by: userId,
  };

  let userResponse = createUser(customerObj, token, ip_address);
  await userResponse.then(
    await function (val) {
      createUserResp = val["status"];
      customerId = val["id"];
    }
  );
  if (createUserResp === "Success" && customerId) {
    //Payment List
    var paymentsList = [];
    data.paymentList.map(async (data) => {
      var paymentObj = {
        wallet: data["wallet"],
        confirmed_by: data["confirmed_by"],
        created_by: data["confirmed_by"],
        amount: data["amount"],
      };
      paymentsList.push(paymentObj);
    });

    //Order
    var orderObj = {
      amount: data.totalCost,
      required_date: data.fr_date,
      is_now: data.is_now,
      status: data.status,
      client: data.client,
      created_by: userId,
      customer: customerId,
      division: 3,
      payments: paymentsList,
      paidAmount: data.paidAmount,
      underpayment: data.underpayment,
      fr_date: data.fr_date,
      to_date: data.to_date,
    };
    let createOrderResp;
    let orderId;
    let date_error;
    let orderResponse = createOrder(orderObj, token, ip_address);
    await orderResponse.then(
      await function (val) {
        createOrderResp = val["status"];
        orderId = val["id"];
        date_error = val["date_error"];
      }
    );
    if (date_error) {
      date_error.map(async (error) => {
        store.addNotification({
          title: "Анхаар!",
          message: error,
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
    }
    if (createOrderResp !== null && orderId !== null) {
      //Order Detials
      var orderDetialObj = {
        quantity: data.quantity,
        fr_date: data.fr_date,
        to_date: data.to_date,
        created_by: userId,
        product: data.productId,
        discount: data.discount,
        subtotal:
          data.productCost * data.quantity * ((100 - data.discount) / 100),
        client: data.client,
        order: orderId,
      };
      let date_error;
      let status;
      let orderDetialResponse = createOrderDetial(
        orderDetialObj,
        token,
        ip_address
      );
      await orderDetialResponse.then(
        await function (val) {
          date_error = val["date_error"];
          status = val["status"];
        }
      );
      if (date_error || status === "Failed") {
        // date_error.map(async (error) => {
        //   let url = "http://127.0.0.1:8000/api/hotel/orders/" + orderId + "/";
        //   await fetch(url, {
        //     method: "DELETE",
        //     headers: {
        //       Accept: "application/json",
        //       "Content-Type": "application/json",
        //       Authorization: "Token " + token,
        //     },
        //     withCredentials: true,
        //   });
        //   store.addNotification({
        //     title: "Анхаар!",
        //     message: error,
        //     type: "danger",
        //     insert: "top",
        //     container: "top-right",
        //     animationIn: ["animated", "fadeIn"],
        //     animationOut: ["animated", "fadeOut"],
        //     dismiss: {
        //       duration: 5000,
        //       onScreen: true,
        //     },
        //   });
        // });
      } else {
        store.addNotification({
          title: "Мэдээлэл",
          message: "Захиалга амжилттай хийгдлээ! Захиалгын дугаар: " + orderId,
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
    }
  } else {
    store.addNotification({
      title: "Анхаар!",
      message:
        "Үйлчлүүлэгчийн мэдээллийг шинэчлэх, шинээр нэмэх явцад алдаа гарлаа!",
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
  return userResponse;
}
