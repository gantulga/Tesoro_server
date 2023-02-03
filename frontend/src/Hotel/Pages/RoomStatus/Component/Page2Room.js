import React, { Component } from "react";
import { Modal, Button, InputGroup, FormControl, Form } from "react-bootstrap";
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";

export default class Page2Room extends Component {
  constructor() {
    super();
    this.state = {
      hotelTimeRange: false,
    };
  }
  render() {
    return (
      <Modal show={this.props.show} onHide={this.props.onHide}>
        <Modal.Header closeButton>
          <Modal.Title>Өрөөний мэдээлэл</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form.Label className="hotelInfoLabel">
            <i className="fas fa-door-closed" />
            &nbsp;&nbsp; Өрөөний дугаар : {this.props.room.number}
          </Form.Label>
          <br />
          <Form.Label className="hotelInfoLabel">
            <i className="fas fa-star" />
            &nbsp;&nbsp; Өрөөний зэрэглэл : {this.get_roomRating()}
          </Form.Label>
          <br />
          <Form.Label className="hotelInfoLabel">
            <i className="fas fa-bed" />
            &nbsp;&nbsp; Орны тоо : {this.bed_counter()}
          </Form.Label>
          <br />
          <br />
          <InputGroup size="sm">
            <InputGroup.Prepend>
              <InputGroup.Text id="inputGroup-sizing-sm">
                Үйлчилгээ:
              </InputGroup.Text>
            </InputGroup.Prepend>
            <FormControl
              aria-label="Small"
              aria-describedby="inputGroup-sizing-sm"
              name="productType"
              onChange={(e) => {
                this.props.changeFunction(e);
                this.changer(e);
              }}
              as="select"
              defaultValue={this.props.productType}
              required
            >
              <option key="0" value="" disabled>
                Хугацааны төрлийг сонгоно уу!
              </option>
              {this.props.room !== null
                ? this.props.room.client_products.map((el, index) => {
                    if (el.name.toLowerCase().indexOf("хоног") !== -1) {
                      return (
                        <option key={index + 1} value="day">
                          Хоногоор
                        </option>
                      );
                    } else if (el.name.toLowerCase().indexOf("цаг") !== -1) {
                      return (
                        <option key={index + 1} value="time">
                          Цагаар
                        </option>
                      );
                    } else {
                      return <option>Үйлчилгээ байхгүй байна.</option>;
                    }
                  })
                : null}
            </FormControl>
          </InputGroup>
          {this.state.hotelTimeRange === true ? (
            <Form.Label className="hotelLoginInputLabel">
              {this.props.startTime}:00 - {this.props.deadlineTime}:00 цагийн
              хооронд өрөөг цагаар авах боломжтой! Доод тал нь{" "}
              {this.props.minimumTime} цагаар авах боломжтой.
            </Form.Label>
          ) : (
            <Form.Label className="hotelLoginInputLabel">
              Үүрийн {this.props.deadlineDay}:00 цагаас өмнө өрөөг хоногоор авах
              тохиолдолд өрөөнөөс тухайн өдрийнхөө 12 цагт гарахыг анхаарна уу!
            </Form.Label>
          )}
          <InputGroup size="sm">
            <InputGroup.Prepend>
              <InputGroup.Text id="inputGroup-sizing-sm">Орох:</InputGroup.Text>
            </InputGroup.Prepend>
            <DatePicker
              selected={this.props.fr_date}
              onChange={(date) => this.props.dateChangeFunction(date)}
              dateFormat="MM/dd/yyyy HH:mm"
              timeFormat="HH:mm"
              showTimeInput
              withPortal
              className="form-control form-control-sm"
              todayButton="Яаг одоо болгох"
              timeInputLabel="Цаг:"
              minDate={new Date()}
            />
          </InputGroup>
          <br />
          <InputGroup size="sm">
            <InputGroup.Prepend>
              <InputGroup.Text id="inputGroup-sizing-sm">
                Хугацаа:
              </InputGroup.Text>
            </InputGroup.Prepend>
            <FormControl
              aria-label="Small"
              aria-describedby="inputGroup-sizing-sm"
              name="quantity"
              value={this.props.quantity}
              onChange={this.props.changeFunction}
            />
          </InputGroup>
          <br />
          <InputGroup size="sm">
            <InputGroup.Prepend>
              <InputGroup.Text id="inputGroup-sizing-sm">
                Гарах:
              </InputGroup.Text>
            </InputGroup.Prepend>
            <DatePicker
              selected={this.props.to_date}
              dateFormat="MM/dd/yyyy HH:mm"
              disabled
              className="form-control form-control-sm col-12"
            />
          </InputGroup>
        </Modal.Body>
        <Modal.Footer className="modal-footer justify-content-between col-12">
          <div className="float-right">
            <Button variant="danger" onClick={this.props.onHide} size="sm">
              <i className="fas fa-times" /> <b> Цуцлах</b>
            </Button>
            <Button
              className="ml-2"
              variant="primary"
              onClick={() => this.props.pageShow(1, this.props.room)}
              size="sm"
            >
              <i className="fas fa-arrow-left" /> <b> Буцах</b>
            </Button>
          </div>
          <Button
            className="float-right"
            variant="success"
            onClick={() => this.props.pageShow(3, this.props.room)}
            size="sm"
          >
            <i className="fas fa-arrow-right" /> <b> Үргэлжлүүлэх</b>
          </Button>
        </Modal.Footer>
      </Modal>
    );
  }
  async changer(e) {
    if (e.target.value === "time") {
      await this.setState({ hotelTimeRange: true });
    } else {
      await this.setState({ hotelTimeRange: false });
    }
  }

  get_roomRating() {
    const description = this.props.room.description.toLowerCase();
    if (description.includes("энгийн")) {
      return "Энгийн";
    } else if (description.includes("хагас lux")) {
      return "Хагас LUX";
    } else if (
      description.includes("lux") &&
      description.includes("хагас") === false
    ) {
      return "LUX";
    } else if (description.includes("vip")) {
      return "VIP";
    } else {
      return null;
    }
  }

  bed_counter() {
    const description = this.props.room.description;
    if (description.includes("1")) {
      return "1";
    } else if (description.includes("2")) {
      return "2";
    } else {
      return null;
    }
  }
}
