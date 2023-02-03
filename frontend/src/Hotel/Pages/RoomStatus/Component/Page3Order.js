import React, { Component } from "react";
import { Modal, Button, InputGroup, FormControl } from "react-bootstrap";
import NumberFormat from "react-number-format";

export default class Page3Order extends Component {
  render() {
    return (
      <Modal show={this.props.show} onHide={this.props.onHide}>
        <Modal.Header closeButton>
          <Modal.Title>Захиалгын мэдээлэл</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <InputGroup size="sm">
            <InputGroup.Prepend>
              <InputGroup.Text id="inputGroup-sizing-sm">
                Үйлчилгээ:
              </InputGroup.Text>
            </InputGroup.Prepend>
            <FormControl
              aria-label="Small"
              aria-describedby="inputGroup-sizing-sm"
              name="productDescription"
              value={this.props.productDesc}
              onChange={this.props.changeFunction}
              disabled
            />
          </InputGroup>
          <br />
          <InputGroup size="sm">
            <InputGroup.Prepend>
              <InputGroup.Text id="inputGroup-sizing-sm">
                Төлбөр:
              </InputGroup.Text>
            </InputGroup.Prepend>
            <NumberFormat
              value={this.props.productCost}
              displayType={"number"}
              thousandSeparator={true}
              suffix={"₮"}
              name="productCost"
              onChange={this.props.changeFunction}
              className="form-control"
              disabled
            />
          </InputGroup>
          <br />
          <InputGroup size="sm">
            <InputGroup.Prepend>
              <InputGroup.Text id="inputGroup-sizing-sm">
                Өдөр/Цаг:
              </InputGroup.Text>
            </InputGroup.Prepend>
            <FormControl
              aria-label="Small"
              aria-describedby="inputGroup-sizing-sm"
              name="quantity"
              value={this.props.quantity}
              onChange={this.props.changeFunction}
              disabled
            />
          </InputGroup>
          <br />
          <InputGroup size="sm">
            <InputGroup.Prepend>
              <InputGroup.Text id="inputGroup-sizing-sm">
                Нийт төлбөр:
              </InputGroup.Text>
            </InputGroup.Prepend>
            <NumberFormat
              value={this.props.totalCost}
              displayType={"number"}
              thousandSeparator={true}
              suffix={"₮"}
              onChange={this.props.changeFunction}
              className="form-control"
              disabled
            />
          </InputGroup>
          <br />
        </Modal.Body>
        <Modal.Footer className="modal-footer justify-content-between">
          <div className="float-left">
            <Button variant="danger" onClick={this.props.onHide} size="sm">
              <i className="fas fa-times" /> <b> Цуцлах</b>
            </Button>
            <Button
              className="ml-2"
              variant="primary"
              onClick={() => this.props.pageShow(2, this.props.room)}
              size="sm"
            >
              <i className="fas fa-arrow-left" /> <b> Буцах</b>
            </Button>
          </div>
          <Button
            variant="success"
            onClick={() => this.props.pageShow(4, this.props.room)}
            size="sm"
          >
            <i className="far fa-credit-card" /> <b> Тооцоог хийх</b>
          </Button>
        </Modal.Footer>
      </Modal>
    );
  }
}
