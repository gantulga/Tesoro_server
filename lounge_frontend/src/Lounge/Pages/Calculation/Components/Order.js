import React, { Component } from 'react';
import NumberFormat from 'react-number-format';
import Moment from "moment";
import Keyboard from './Keyboard';
import ProductList from './ProductList';
import { store } from "react-notifications-component";

export default class componentName extends Component {
  constructor(props) {
    super(props);
    this.state = {
    };
    this.calculator = this.calculator.bind(this);
  }

  calculator (payments){
    var payment_total = 0
    for(var i=0; i < payments.length; i++){
      payment_total = payment_total + parseInt(payments[i].amount)
    }
    return payment_total
  }

  order_print(order_id) {
    var url = "http://" + this.props.ip_address + "/api/order/print?order=" + order_id + "&printer=1"
    fetch(url, {
      method: "GET",
    })
    .then(response=>response.json())
    .then(data=>{
      if(data['success']){
        store.addNotification({
          message: "Order амжилттай хэвлэгдлээ.",
          type: "success",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 3000,
            onScreen: true,
          },
        });
        this.modalHide()
      }else{
        store.addNotification({
          message: data['errorCode'],
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 3000,
            onScreen: true,
          },
        });
        this.sendError("fetchError, print_bill")
      }
    })
  }

  render() {
    var paymentTotalAmount = 0;
    this.props.order_payments.map(
      (payment) =>
        (paymentTotalAmount =
          parseInt(paymentTotalAmount) + parseInt(payment.amount))
    );

    var product_index = 0
    return (
      <div className={this.props.show_modal ? "show" : "hide" }>
        <div className={this.props.show_keyboard && !this.props.show_product ? "order-box half" : "order-box"}>
          <div className="box-heading">
            <div className="button back">
              <button className="white" onClick={()=>this.props.back_orders()}>
                <i className="fa fa-arrow-left" aria-hidden="true"></i>
              </button>
            </div>
            <div className="button">
              <button className={this.props.show_product ? "white active" : "white"} onClick={this.props.toggle_product}>
                <i className="fa fa-plus" aria-hidden="true"></i>Бараа
              </button>
            </div>
            <div className="button">
              <button className={this.props.show_keyboard && !this.props.show_product ? "white active" : "white"} onClick={this.props.toggle_keyboard}>
                <i className="fa fa-calculator" aria-hidden="true"></i>Тооцоо
              </button>
            </div>
            <div className="button">
              <button className="white" onClick={this.props.show_customer} disabled={this.props.order_id !== null ? false : true}>
              <i className="fa fa-user" aria-hidden="true"></i>Үйлчлүүлэгч
              </button>
            </div>
            <div className="button">
              <button className="white" onClick={() => this.props.show_detial(this.props.order_id)} disabled={this.props.order_id !== null ? false : true}>
              <i className="fa fa-percent" aria-hidden="true"></i>Хөнгөлөлт
              </button>
            </div>
            <div className="button">
              <button className="white" onClick={() => this.props.order_print(this.props.order_id)}>
              <i className="fa fa-print" aria-hidden="true"></i> Нэхэмжлэл
              </button>
            </div>
            <div className="button">
              <button className={this.props.order_id !== null && this.props.order_information && this.props.order_information.discounted_amount - paymentTotalAmount === 0 ? "white" : "white disabled"} onClick={() => this.props.show_ebarimt(this.props.order_id)} disabled={this.props.order_id !== null && this.props.order_information && this.props.order_information.discounted_amount - paymentTotalAmount === 0 ? false : true}>
              <i className="fa fa-print" aria-hidden="true"></i> Баримт
              </button>
            </div>
          </div>
          <div className={!this.props.show_product ? "box-body" : "box-body hide"}>
            <div className="order">
              <div className="white head">
                  <div className="field index">
                    <button>№</button>
                  </div>
                  <div className="field date">
                    <button>Огноо</button>
                  </div>
                  <div className="field name">
                    <button>Бүтээгдэхүүн</button>
                  </div>
                  <div className="field amount">
                    <button>Үнэ</button>
                  </div>
                  <div className="field quantity">
                    <button>Т/ш</button>
                  </div>
                  <div className="field amount">
                    <button>Дүн</button>
                  </div>
              </div>
            </div>
            {this.props.order_detials.map((detial, index)=>{
              return (
                <button className="order" key={index}>
                  <div className="white">
                    <div className="field index">
                      {index + 1}
                    </div>
                    <div className="field date">
                      {Moment(detial.created_at).format(
                          "Do, H:mm"
                      )}
                    </div>
                    <div className="field name">
                      {detial.product.name}
                    </div>
                    <div className="field amount">
                      <NumberFormat
                        value={parseInt(detial.product.cost)}
                        displayType={'text'}
                        thousandSeparator={true}
                      />₮
                    </div>
                    <div className="field quantity">
                      x {detial.quantity}
                    </div>
                    <div className="field amount">
                      <NumberFormat
                        value={parseInt(detial.subtotal)}
                        displayType={'text'}
                        thousandSeparator={true}
                      />₮
                    </div>
                  </div>
                </button>
              )
            })}
            {!this.props.show_keyboard ? (
              <div className="total">
                <div className="left">
                  <div className="niit">НИЙТ ДҮН:</div>
                  <div className="discount">ХӨНГӨЛӨЛТ:</div>
                  <div className="discounted_percent">ХӨНГӨЛӨГТИЙН ХУВЬ:</div>
                  <div className="discounted_amount">ХӨНГӨЛӨГДСӨН ДҮН:</div>
                  <div className="paid">ТӨЛСӨН:</div>
                  <div className="under">ДУТУУ:</div>
                </div>
                <div className="right">
                  {this.props.order_information ? (
                    <>
                    <div className="niit">
                      <NumberFormat
                        value={parseInt(this.props.order_information.amount)}
                        displayType={'text'}
                        thousandSeparator={true}
                      />₮
                    </div>
                    <div className="discount">
                      <NumberFormat
                        value={parseInt(this.props.order_information.discount)}
                        displayType={'text'}
                        thousandSeparator={true}
                      />₮
                    </div>
                    <div className="discounted_percent">{this.props.order_information.discounted_percent}%</div>
                    <div className="discounted_amount">
                      <NumberFormat
                        value={parseInt(this.props.order_information.discounted_amount)}
                        displayType={'text'}
                        thousandSeparator={true}
                      />₮
                    </div>
                    <div className="paid">
                      <NumberFormat
                        value={paymentTotalAmount}
                        displayType={'text'}
                        thousandSeparator={true}
                      />₮
                    </div>
                    <div className="under">
                      <NumberFormat
                        value={this.props.order_information.discounted_amount - paymentTotalAmount}
                        displayType={'text'}
                        thousandSeparator={true}
                      />₮
                    </div>
                    </>
                  ) : null}
                </div>
              </div>
            ) : null}
          </div>
          <div className={this.props.show_product ? "product-list" : "product-list hide"}>
            <div className="left">
              <div className="list">
                {this.props.order_detials.map((detial, index)=>{
                  product_index = product_index + 1
                  return (
                    <button className="order" key={index} onClick={()=>{this.props.searchingProduct(detial.product.name, "text")}}>
                      <div className="white">
                        <div className="field index">
                          {index + 1}
                        </div>
                        <div className="field name">
                          {detial.product.name}
                        </div>
                      </div>
                      <div className="finance">
                        <div className="field cost">
                          {detial.product.cost.toString().slice(0, -3).replace(/\B(?=(\d{3})+(?!\d))/g, ",")}
                        </div>
                        <div className="field quantity">
                          x {detial.quantity}
                        </div>
                        <div className="field subtotal">
                          = {detial.subtotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}₮
                        </div>
                      </div>
                    </button>
                  )
                })}
                {
                  /* Show OrderingList */
                  this.props.orderingList.map((detial, index) => {
                    return (
                      <button className="order new" key={index} onClick={()=>{this.props.searchingProduct(detial.name, "text")}}>
                        <div className="white">
                          <div className="field index">
                            {index + 1 + product_index}
                          </div>
                          <div className="field name">
                            {detial.name}
                          </div>
                        </div>
                        <div className="finance">
                          <div className="field cost">
                            {detial.cost.toString().slice(0, -3).replace(/\B(?=(\d{3})+(?!\d))/g, ",")}
                          </div>
                          <div className="field quantity">
                            x {detial.quantity}
                          </div>
                          <div className="field subtotal">
                            = {detial.subtotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}₮
                          </div>
                        </div>
                      </button>
                    );
                  })}
              </div>
              <div className="buttons">
                <button
                  type="button"
                  className={
                    this.props.orderingList.length === 0
                      ? "btn btn-danger clearBtn disabled"
                      : "btn btn-danger clearBtn"
                  }
                  onClick={() => this.props.clearButton()}
                >
                  <i className="fa fa-trash" aria-hidden="true"></i>
                </button>
                <button
                  type="button"
                  className={
                    this.props.orderingList.length === 0
                      ? "btn btn-success doOrderBtn disabled"
                      : "btn btn-success doOrderBtn"
                  }
                  onClick={
                    this.props.orderingList.length !== 0
                      ? () => {
                          if (this.props.order_id) {
                            this.props.updateOrderButton();
                          } else {
                            this.props.doOrderButton();
                          }
                        }
                      : null
                  }
                >
                  <i className="fa fa-plus" aria-hidden="true"></i>
                </button>
              </div>
            </div>
            <div className="right">
              <ProductList {...this.props}/>
            </div>
          </div>
        </div>
        <div className={this.props.show_keyboard && !this.props.show_product ? "order-bottom-side" : "order-bottom-side hide"}>
          <div className="left-side">
            <Keyboard
              {...this.props}
              max_amount={this.props.order_information ? (this.props.order_information.discounted_amount - paymentTotalAmount).toString() : null}
            />
          </div>
          <div className="right-side">
            <div className="total">
              <div className="left">
                <div className="niit">НИЙТ ДҮН:</div>
                <div className="discount">ХӨНГӨЛӨЛТ:</div>
                <div className="discounted_percent">ХӨНГӨЛӨГТИЙН ХУВЬ:</div>
                <div className="discounted_amount">ХӨНГӨЛӨГДСӨН ДҮН:</div>
                <div className="paid">ТӨЛСӨН:</div>
                <div className="under">ДУТУУ:</div>
              </div>
              <div className="right">
                {this.props.order_information ? (
                  <>
                  <div className="niit">
                    <NumberFormat
                      value={parseInt(this.props.order_information.amount)}
                      displayType={'text'}
                      thousandSeparator={true}
                    />₮
                  </div>
                  <div className="discount">
                    <NumberFormat
                      value={parseInt(this.props.order_information.discount)}
                      displayType={'text'}
                      thousandSeparator={true}
                    />₮
                  </div>
                  <div className="discounted_percent">{this.props.order_information.discounted_percent}%</div>
                  <div className="discounted_amount">
                    <NumberFormat
                      value={parseInt(this.props.order_information.discounted_amount)}
                      displayType={'text'}
                      thousandSeparator={true}
                    />₮
                  </div>
                  <div className="paid">
                    <NumberFormat
                      value={paymentTotalAmount}
                      displayType={'text'}
                      thousandSeparator={true}
                    />₮
                  </div>
                  <div className="under">
                    <NumberFormat
                      value={this.props.order_information.discounted_amount - paymentTotalAmount}
                      displayType={'text'}
                      thousandSeparator={true}
                    />₮
                  </div>
                  </>
                ) : null}
              </div>
            </div>
            {this.props.order_payments.length > 0 ? (
              <div className="payment-list">
                {this.props.order_payments.map((payment, index) => {
                  return (
                    <div key={index} className="payment">
                      <div className="index">
                        {index + 1}
                      </div>
                      <div className="date">
                        {Moment(payment.created_at).format("H:mm")}
                      </div>
                      <div className="name">{payment.wallet.name}</div>
                      <div className="account">{payment.wallet.account}</div>
                      <div className="amount">
                        <NumberFormat
                          value={payment.amount}
                          displayType={'text'}
                          thousandSeparator={true}
                        />₮
                      </div>
                    </div>
                  );
                })}
              </div>
            ) : (
              <p>
                Тухайн захиалга гүйлгээ хийгээгүй эсвэл захиалгыг
                сонгоогүй байна.
              </p>
            )}
          </div>
        </div>
      </div>
    );
  }
}
