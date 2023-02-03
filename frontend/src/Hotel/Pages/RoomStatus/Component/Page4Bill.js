import React, { Component } from "react";
import { Modal, Button, InputGroup } from "react-bootstrap";
import PaymentInput from "./PaymentInput";
import NumberFormat from "react-number-format";

export default class Page4Bill extends Component {
  render() {
    return (
      <Modal show={this.props.show} onHide={this.props.onHide}>
        <Modal.Header closeButton>
          <Modal.Title>Тооцоо хийх</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <div className="row productDiv">
            <div className="col-4">1. {this.props.productDesc}</div>
            {/* <div className="float-left totalAmount">{this.props.totalCost}</div> */}
            <div className="col-2">{this.props.productCost}₮ </div>
            <div className="col-1">x {this.props.quantity}</div>
            <div className="col-2">
              <InputGroup size="sm">
                <NumberFormat
                  value={this.props.discount}
                  displayType={"number"}
                  thousandSeparator={false}
                  name="discount"
                  className="form-control"
                  onChange={this.props.discountChanger}
                />
              </InputGroup>
            </div>
            <div className="col-3">{this.props.totalCost}₮</div>
          </div>
          <hr />
          <div className="row">
            <div className="col-12 totalAmountDiv">
              <div className="float-left mr-2">#</div>
              <div className="float-left">Нийт дүн:</div>
              {/* <div className="float-left totalAmount">{this.props.totalCost}</div> */}
              <div className="float-right totalAmount">
                {this.props.totalCost}₮
              </div>
            </div>
          </div>
          <div className="row">
            <div className="col-12 totalAmountDiv">
              <div className="float-left mr-2">#</div>
              <div className="float-left">Төлсөн дүн:</div>
              {/* <div className="float-left totalAmount">{this.props.totalCost}</div> */}
              <div className="float-right totalAmount success">
                {this.props.paidAmount}₮
              </div>
            </div>
          </div>
          <div className="row">
            <div className="col-12 unpaidAmountDiv">
              <div className="float-left mr-2">#</div>
              <div className="float-left">Үлдэгдэл:</div>
              {/* <div className="float-left totalAmount">{this.props.totalCost}</div> */}
              <div className="float-right totalAmount unsuccess">
                {this.props.underpayment}₮
              </div>
            </div>
          </div>
          <hr />
          {this.props.paymentList.map((data, index) => {
            return (
              <PaymentInput
                key={index}
                handleChange={this.props.handleChange}
                wallet={data.wallet}
                amount={data.amount}
                tulhuur={index}
                {...this.props}
              />
            );
          })}
          <hr />
          <div className="row">
            <div className="col-12">
              <div className="float-right">
                <Button
                  variant="primary"
                  size="sm"
                  onClick={this.props.countAmount}
                  className="mr-2"
                >
                  <i className="fas fa-calc" /> Дүгнэх
                </Button>
                <Button
                  variant="success"
                  size="sm"
                  onClick={(e) => this.props.addInput(e)}
                >
                  <i className="fas fa-plus" /> Банк нэмэх
                </Button>
              </div>
            </div>
          </div>
          {this.props.lastShift ? (
            <div className="alert alert-danger mt-2" role="alert">
              Ээлжийг үүсгээгүй байна. Ээлжинд гарч байгаа ресепшин ээлжээ
              үүсгэнэ үү! <br />
              [Зочид буудал] -> [Барааны үлдэгдэл] -> [Ээлж үүсгэх]
            </div>
          ) : null}
        </Modal.Body>
        <Modal.Footer className="modal-footer justify-content-between">
          <Button
            className="ml-2"
            variant="primary"
            onClick={() => this.props.pageShow(3, this.props.room)}
            size="sm"
          >
            <i className="fas fa-arrow-left" /> <b> Буцах</b>
          </Button>
          <div className="float-right">
            <Button
              variant="success"
              onClick={this.props.finish}
              size="sm"
              disabled={this.props.lastShift}
            >
              <i className="fas fa-check" /> <b> Захиалгыг үүсгэх</b>
            </Button>
          </div>
        </Modal.Footer>
      </Modal>
    );
  }
}
