import React, { Component } from "react";
import { Modal, Button } from "react-bootstrap";
//import Moment from "react-moment";
//import { getUserId } from "../../../../../Main/Utils/Auth";
import Moment from "moment";
import NumberFormat from 'react-number-format';

export default class UnpaidOrders extends Component {
  constructor(props) {
    super(props);
    this.state = {
    };
  }

  render() {
      var total = 0
    return (
      <Modal show={this.props.show_modal} onHide={this.props.modalHide} size="lg" >
        <Modal.Header closeButton>
          <Modal.Title>Төлөгдөөгүй тооцоонууд</Modal.Title>
        </Modal.Header>
        <Modal.Body className="unpaidOrders">
            {this.props.unpaidOrders.length > 0 ? (
              <div className="orderList">
                <div className="order head">
                    <div className="number">№</div>
                    <div className="date">Огноо</div>
                    <div className="client">Ширээ</div>
                    <div className="amount">Үнийн</div>
                    <div className="under">Дутуу</div>
                    <div className="customer">Үйлчилүүлэгч</div>
                    <div className="worker">Ажилтан</div>
                    <div className="button"></div>
                </div>
                {this.props.unpaidOrders.map((order, index)=>{
                    var paid = 0
                    for (let index = 0; index < order.payments.length; ++index) {
                        paid = paid + parseInt(order.payments[index].amount)
                    }
                    total = total + (parseInt(order.amount) - paid)
                    return (
                        <div className="order" key={index}>
                            <div className="number">{index + 1}</div>
                            <div className="date">{Moment(order.created_at).format("YY/MM/DD H:mm")}</div>
                            <div className="client">
                                {order.division === 3 ? "Hotel " : null}
                                {order.division === 4 ? "Resta " : null}
                                {order.division === 5 ? "Loung " : null}
                                {order.division === 6 ? "Karao " : null}
                                {order.client.number}
                            </div>
                            <div className="amount">
                                <NumberFormat
                                    value={parseInt(order.amount)}
                                    displayType={'text'}
                                    thousandSeparator={true}
                                />₮
                            </div>
                            <div className="under">
                                <NumberFormat
                                    value={parseInt(order.amount) - paid}
                                    displayType={'text'}
                                    thousandSeparator={true}
                                />₮
                            </div>
                            <div className="customer">
                                {order.customer ? order.customer.mobile : null}
                            </div>
                            <div className="worker">
                                {order.worker ? order.worker.first_name : null}
                            </div>
                            <div className="button">
                              <button type="button" onClick={()=>this.props.set_order(order.id, order.amount)}><i className="fa fa-credit-card" aria-hidden="true"></i></button>
                            </div>
                        </div>
                    )
                })}
                <div className="order foot">
                    <div className="number"></div>
                    <div className="date"></div>
                    <div className="client"></div>
                    <div className="amount">НИЙТ АВЛАГА</div>
                    <div className="under">
                        <NumberFormat
                            value={total}
                            displayType={'text'}
                            thousandSeparator={true}
                        />₮
                    </div>
                    <div className="customer"></div>
                    <div className="worker"></div>
                    <div className="button"></div>
                </div>
            </div>
            ) : null}
        </Modal.Body>
        <Modal.Footer className="modal-footer justify-content-between">
          <Button variant="warning" size="sm" onClick={this.props.modalHide}>
            <i className="fas fa-arrow-left" /> <b> Буцах</b>
          </Button>
        </Modal.Footer>
      </Modal>
    );
    }
}
