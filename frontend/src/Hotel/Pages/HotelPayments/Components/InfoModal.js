import React, { Component } from "react";
import { Modal, Button } from "react-bootstrap";

export default class InfoModal extends Component {
  constructor(props) {
    super(props);
    this.state = {
      total: 0,
      paymentTotal: 0,
      underAmount: 0,
    };
  }

  async totalAmountCalculator() {
    this.props.data.order_detials.map(async (detial) => {
      await this.setState((prevState) => {
        return { total: prevState.order + detial.subtotal };
      });
      return null;
    });

    this.props.data.payments.map(async (payment) => {
      await this.setState((prevState) => {
        return {
          paymentTotal:
            parseInt(prevState.paymentTotal) + parseInt(payment.amount),
        };
      });
      return null;
    });

    await this.setState({
      underAmount:
        parseInt(this.state.total) - parseInt(this.state.paymentTotal),
    });
  }

  componentDidMount() {
    this.totalAmountCalculator();
  }

  render() {
    return (
      <Modal show={this.props.show} onHide={this.props.onHide}>
        <Modal.Header closeButton>
          <Modal.Title>Захиалгын мэдээлэл</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <div className="row">
            <div className="col-12 totalAmountDiv">
              <div className="float-left">
                <b>Бүтээгдэхүүнүүд:</b>
              </div>
            </div>
          </div>
          {this.props.data.order_detials.map((detial, index) => (
            <div key={index + 1} className="row">
              <div className="col-12 productDiv">
                <div className="float-left mr-2">{index + 1}</div>
                <div className="float-left name col-7">
                  {detial.product.description}
                </div>
                <div className="float-left price">{detial.product.cost}</div>
                <div className="float-left quantity ml-2 mr-2">
                  x {detial.quantity}
                </div>
                <div className="float-right amount">
                  {detial.quantity * detial.product.cost}₮
                </div>
              </div>
            </div>
          ))}
          <hr />
          <div className="row">
            <div className="col-12 totalAmountDiv">
              <div className="float-left mr-2">#</div>
              <div className="float-left">Нийт дүн:</div>
              <div className="float-right totalAmount">
                {parseInt(this.props.data.amount)}₮
              </div>
            </div>
          </div>
          <div className="row">
            <div className="col-12 totalAmountDiv">
              <div className="float-left mr-2">#</div>
              <div className="float-left">Төлсөн дүн:</div>
              <div className="float-right totalAmount success">
                {this.state.paymentTotal}₮
              </div>
            </div>
          </div>
          <div className="row">
            <div className="col-12 totalAmountDiv">
              <div className="float-left mr-2">#</div>
              <div className="float-left">Үлдэгдэл дүн:</div>
              <div className="float-right totalAmount success">
                {parseInt(this.state.underAmount)}₮
              </div>
            </div>
          </div>
          <hr />
          <div className="row">
            <div className="col-12 totalAmountDiv">
              <div className="float-left">
                <b>Гүйлгээнүүд:</b>
              </div>
            </div>
          </div>
          {this.props.data.payments.map((payment, index) => (
            <div key={index + 1} className="row">
              <div className="col-12 productDiv">
                <div className="float-left mr-2">{index + 1}</div>
                <div className="float-left name col-7">
                  {payment.wallet.bank} {payment.wallet.name}{" "}
                  {payment.wallet.account}
                </div>
                <div className="float-right amount">{payment.amount}₮</div>
              </div>
            </div>
          ))}
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
