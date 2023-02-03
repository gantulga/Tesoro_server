import React, { Component } from "react";
import { Modal, Button } from "react-bootstrap";
import { store } from "react-notifications-component";
import Moment from "react-moment";

export default class OrdersModal extends Component {
  constructor(props) {
    super(props);
    this.state = {
      roomOrders: [],
    };
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
        const orders = [...prevState.roomOrders];
        orders[index].status = "Хаагдсан гүйлгээ.";
        return { roomOrders: orders };
      });
    }
  }

  getHotelRoomOrders() {
    var url =
      "http://" +
      this.props.ip_address +
      "/api/hotel/ordersForClients/" +
      this.props.roomId +
      "/";
    fetch(url, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({ roomOrders: data });
      })
      .catch((error) => {
        this.setState({ APIError: error });
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

  componentDidMount() {
    this.getHotelRoomOrders();
  }

  render() {
    console.log(this.state.roomOrders);
    return (
      <Modal show={this.props.show} onHide={this.props.onHide} size="lg">
        <Modal.Header closeButton>
          <Modal.Title>Захиалгын мэдээлэл</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <table className="table table-sm table-striped compact  small-table">
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
              {this.state.roomOrders.map((order, index) => (
                <tr key={index}>
                  <td>
                    {order.id} {index}
                  </td>
                  <td>{order.client.number}</td>
                  <td>{order.status}</td>
                  <td>{order.customer ? order.customer.mobile : null}</td>
                  <td>
                    <Moment format="YYYY/MM/DD HH:mm">
                      {order.created_at}
                    </Moment>
                  </td>
                  <td width="79px">
                    {order.status === "Төлбөр гүйцэт төлсөн." ? (
                      <button
                        className="btn btn-sm btn-success"
                        onClick={() => this.finishOrder(order.id, index)}
                      >
                        <i className="fas fa-flag-checkered" />
                      </button>
                    ) : null}
                    <button
                      className="btn btn-sm bg-teal ml-2 float-right"
                      onClick={() => this.props.pageShow("order", order)}
                    >
                      <i className="fas fa-file-invoice" />
                    </button>
                  </td>
                </tr>
              ))}
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
        </Modal.Body>
        <Modal.Footer className="modal-footer justify-content-between">
          <Button variant="danger" onClick={this.props.onHide} size="sm">
            <i className="fas fa-times" /> <b> Хаах</b>
          </Button>
        </Modal.Footer>
      </Modal>
    );
  }
}
