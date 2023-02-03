import React, { Component } from "react";
import { Modal, Button } from "react-bootstrap";
import { fetchPut } from "../Robots/FetchPutRobot";
import { fetchGet } from "../Robots/FetchGetRobot";
import { store } from "react-notifications-component";

export default class ConfirmModal extends Component {
  constructor(props) {
    super(props);
    this.updateInfo = this.updateInfo.bind(this);
  }

  async updateInfo() {
    var roomObj;
    if (this.props.type === "room_free") {
      roomObj = {
        room_free: true,
      };
    }
    if (this.props.type === "room_clean") {
      roomObj = {
        room_clean: true,
      };
    }
    if (this.props.type === "minibarFull") {
      roomObj = {
        minibarFull: true,
      };
    }

    if (this.props.type === "room_free") {
      var urlGet =
        "http://" +
        this.props.ip_address +
        "/api/hotel/ordersForClients/" +
        this.props.room.id +
        "/";
      var orderGetResponse = fetchGet(urlGet, this.props.token);
      await orderGetResponse.then(
        await function (val) {
          val.map((order) => {
            if (
              order["status"] !== "Төлбөр гүйцэт төлсөн." ||
              order["status"] !== "Хаагдсан гүйлгээ."
            ) {
              store.addNotification({
                title: "Анхаар!",
                message:
                  "Тухайн өрөөний захиалгын тооцоо бүрэн хийгдээгүй байгаа тул АНХААРНА УУ! Захиалгын дугаар: " +
                  order["id"] +
                  ", төлөв: " +
                  order["status"],
                type: "danger",
                insert: "top",
                container: "top-right",
                animationIn: ["animated", "fadeIn"],
                animationOut: ["animated", "fadeOut"],
                dismiss: {
                  duration: 10000,
                  onScreen: true,
                },
              });
            }
            return null;
          });
        }
      );
    }

    var urlPut =
      "http://" +
      this.props.ip_address +
      "/api/hotel/rooms/" +
      this.props.room.id +
      "/";
    var roomPutResponse = fetchPut(roomObj, this.props.token, urlPut);
    var responseValue;
    await roomPutResponse.then(
      await function (val) {
        responseValue = val["ok"];
      }
    );
    if (responseValue) {
      store.addNotification({
        title: "Амжилттай!",
        message: "Өрөөний мэдээлэл амжилттай хадгалагдлаа!",
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
      this.props.roomsDataUpdater();
      this.props.onHide();
    }
  }

  render() {
    return (
      <Modal show={this.props.show} onHide={this.props.onHide}>
        <Modal.Header closeButton>
          <Modal.Title>Баталгаажуулах!</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <p>
            {this.props.room.number} {this.props.message}{" "}
          </p>
        </Modal.Body>
        <Modal.Footer className="modal-footer justify-content-between">
          <Button variant="danger" onClick={this.props.onHide} size="sm">
            <i className="fas fa-times" /> <b> Буцах</b>
          </Button>
          <Button variant="success" onClick={this.updateInfo} size="sm">
            <i className="fas fa-check" /> <b> Хадгалах</b>
          </Button>
        </Modal.Footer>
      </Modal>
    );
  }
}
