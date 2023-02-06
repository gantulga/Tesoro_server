import React, { Component } from "react";
// import { getLogs } from "./Components/LogRobots";
import ContentHeader from "../../../Main/Components/ContentHeader";
import { store } from "react-notifications-component";
import InfoModal from "./Components/InfoModal";
import Moment from "react-moment";

export default class index extends Component {
  constructor(props) {
    super(props);
    this.state = {
      ordersData: [],
      infoModal: false,
      orderInfo: null,
    };
  }

  async pageHide() {
    await this.setState({
      infoModal: false,
    });
  }

  async pageShow(orderInfo) {
    await this.setState({
      infoModal: true,
      orderInfo: orderInfo,
    });
  }

  paymentsSetState() {
    fetch("http://" + this.props.ip_address + "/api/hotel/ordersForPayments/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({ ordersData: data });
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
  }

  async finishOrder(orderId, index) {
    var url =
      "http://" + this.props.ip_address + "/api/hotel/orders/" + orderId + "/";
    var patchOrder = await fetch(url, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
      body: JSON.stringify({
        status: "Хаагдсан гүйлгээ.",
      }),
    })
      .then((results) => {
        const data = results.json();
        console.log(data);
        if (results.status === 200 || results.status === 201) {
          store.addNotification({
            title: "Амжилттай!",
            message: "Захиалгын төлвийн мэдээлэл амжилттай шинэчлэгдлээ!",
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
        return results;
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

    if (patchOrder.ok === true) {
      this.setState((prevState) => {
        const orders = [...prevState.ordersData];
        orders[index].status = "Хаагдсан гүйлгээ.";
        return { ordersData: orders };
      });
    }
  }

  componentDidMount() {
    this.paymentsSetState();
  }

  render() {
    return (
      <div>
        <ContentHeader {...this.props} />
        <div className="card">
          <div className="card-body">
            <table className="table table-sm compact small-table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Өрөө</th>
                  <th>Статус</th>
                  <th>Үйлчлүүлэгч</th>
                  <th>Огноо</th>
                  <th width="30px"></th>
                </tr>
              </thead>
              <tbody>
                {this.state.ordersData.map((order, index) => {
                  var css;
                  if (order.status === "Төлбөр гүйцэт төлсөн.") {
                    css = "fullPaid";
                  }
                  if (order.status === "Төлбөр төлөгдөөгүй.") {
                    css = "fullUnpaid";
                  }
                  if (order.status === "Төлбөр дутуу төлсөн.") {
                    css = "fullHalfPaid";
                  }
                  if (order.status === "Төлбөр илүү төлсөн.") {
                    css = "fullMorePaid";
                  }
                  return (
                    <tr key={index} className={css}>
                      <td>{order.id}</td>
                      <td>{order.client.number}</td>
                      <td>{order.status}</td>
                      <td>
                        {order.customer != null ? 
                        <>
                          {order.customer.firstname ? order.customer.firstname : null}
                          {order.customer.register ? order.customer.register : null}
                        </>
                          : null}
                      </td>
                      <td>
                        <Moment format="YYYY/MM/DD HH:mm">
                          {order.created_at}
                        </Moment>
                      </td>
                      <td width="79px">
                        {(order.status === "Төлбөр гүйцэт төлсөн.") |
                        (order.status === "Төлбөр илүү төлсөн.") ? (
                          <button
                            className="btn btn-sm btn-success"
                            onClick={() => this.finishOrder(order.id, index)}
                          >
                            <i className="fas fa-flag-checkered" />
                          </button>
                        ) : null}
                        <button
                          className="btn btn-sm bg-teal"
                          onClick={() => this.pageShow(order)}
                        >
                          <i className="fas fa-file-invoice" />
                        </button>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
              <tfoot>
                <tr>
                  <th>#</th>
                  <th>Өрөө</th>
                  <th>Статус</th>
                  <th>Үйлчлүүлэгч</th>
                  <th>Огноо</th>
                  <th width="30px"></th>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
        {this.state.infoModal === true ? (
          <InfoModal
            show={this.state.infoModal}
            onHide={this.pageHide.bind(this)}
            pageShow={this.pageShow.bind(this)}
            data={this.state.orderInfo}
            {...this.props}
          />
        ) : null}
      </div>
    );
  }
}
