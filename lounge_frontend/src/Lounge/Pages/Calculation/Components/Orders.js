import React, { Component } from 'react';
import NumberFormat from 'react-number-format';
import Moment from "moment";

export default class Orders extends Component {
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

  render() {
    return (
      <div className={this.props.show_modal ? "show" : "hide" }>
          <div className="orders-box">
            <div className="box-heading">
              <div className="button back">
                <button className="white" onClick={this.props.back_tables}>
                  <i className="fa fa-arrow-left" aria-hidden="true"></i>
                </button>
              </div>
              <div className="button">
                {this.props.selected_client ? 
                  <button className={this.props.selected_division && this.props.selected_client ? "white active" : "white"} >
                    {this.props.selected_client_number}
                  </button>
                  :
                  <button className="white disabled" >
                    Ширээ/Өрөө
                  </button>
                }
              </div>
              {this.props.selected_division ? 
                <div className="button">
                    <button className={this.props.selected_division && !this.props.selected_client ? "white active" : "white"} onClick={this.props.show_division_orders}>
                        {this.props.selected_division_name}
                    </button>
                </div>
                :
                <div className="button">
                    <button className="white disabled" >
                        Салбар
                    </button>
                </div>
              }
              <div className="button">
                  <button className={!this.props.selected_division && !this.props.selected_client ? "white active" : "white"} onClick={this.props.show_all_orders}>
                      Бүгд
                  </button>
              </div>
              <div className="button new">
                  <button className="white" onClick={this.props.new_order}>
                    <i className="fa fa-plus" aria-hidden="true"></i>Шинэ захиалга
                  </button>
              </div>
            </div>
            <div className="box-body">
              <div className="order">
                <div className="white head">
                    <div className="field id">
                      <button>№</button>
                    </div>
                    <div className="field date">
                      <button>Огноо</button>
                    </div>
                    <div className="field client">
                      <button>Ширээ</button>
                    </div>
                    <div className="field customer">
                      <button>Үйлчлүүлэгч</button>
                    </div>
                    <div className="field amount">
                      <button>Нийт дүн</button>
                    </div>
                    <div className="field amount">
                      <button>Төлсөн</button>
                    </div>
                    <div className="field amount">
                      <button>Үлдсэн</button>
                    </div>
                    <div className="field discount">
                      <button>%</button>
                    </div>
                </div>
              </div>
                {this.props.orders.map((order, index)=>{
                    if(parseInt(order.amount) - this.calculator(order.payments) > 0 && order.worker === null){
                      return (
                        <button className="order" key={index} onClick={() =>
                          this.props.set_order(order.id, order.amount)
                        }>
                            <div className={this.props.selected_order === order.id ? "white active" : "white"} 
                                onClick={() =>
                                    this.props.set_order(
                                        order.id,
                                        order.number
                                    )
                                }>
                                <div className="field id">
                                  {order.id}
                                </div>
                                <div className="field date">
                                  {Moment(order.created_at).format(
                                      "Do, H:mm"
                                  )}
                                </div>
                                <div className="field client">
                                  {order.division === 3 ? "ЗоБу " : null}
                                  {order.division === 4 ? "Рест " : null}
                                  {order.division === 5 ? "Лоун " : null}
                                  {order.division === 6 ? "Кара " : null}
                                  {order.client.number}
                                </div>
                                <div className="field customer">
                                  {order.worker && !order.customer ? order.worker.first_name : null}
                                  {order.customer && !order.worker ? order.customer.mobile : null}
                                  {order.customer && order.worker ? order.worker.first_name : null}
                                </div>
                                <div className="field amount">
                                  <NumberFormat
                                    value={parseInt(order.amount)}
                                    displayType={'text'}
                                    thousandSeparator={true}
                                  />₮
                                </div>
                                {order.status === "Төлбөр гүйцэт төлсөн." ? 
                                  <div className="field amount">
                                    <NumberFormat
                                      value={parseInt(order.amount)}
                                      displayType={'text'}
                                      thousandSeparator={true}
                                    />₮
                                  </div> 
                                  : 
                                  <div className="field amount">
                                    <NumberFormat
                                      value={this.calculator(order.payments)}
                                      displayType={'text'}
                                      thousandSeparator={true}
                                    />₮
                                  </div>
                                }
                                <div className={parseInt(order.discounted_amount) - this.calculator(order.payments) > 0 ? "field amount under" : "field amount"}>
                                  <NumberFormat
                                    value={parseInt(order.discounted_amount) - this.calculator(order.payments)}
                                    displayType={'text'}
                                    thousandSeparator={true}
                                  />₮
                                </div>
                                <div className={order.discounted_percent > 0 ? "field discount discounted" : "field discount"}>
                                  <div>{order.discounted_percent}%</div>
                                </div>
                            </div>
                        </button>
                    )
                    }else{
                      return null
                    }
                })}
                {this.props.orders.map((order, index)=>{
                    if(parseInt(order.amount) - this.calculator(order.payments) <= 0 || order.worker !== null){
                      return (
                        <button className="order" key={index} onClick={() =>
                          this.props.set_order(order.id, order.amount)
                        }>
                            <div className={this.props.selected_order === order.id ? "white active" : "white"} 
                                onClick={() =>
                                    this.props.set_order(
                                        order.id,
                                        order.number
                                    )
                                }>
                                <div className="field id">
                                  {order.id}
                                </div>
                                <div className="field date">
                                  {Moment(order.created_at).format(
                                      "Do, H:mm"
                                  )}
                                </div>
                                <div className="field client">
                                  {order.division === 3 ? "ЗоБу " : null}
                                  {order.division === 4 ? "Рест " : null}
                                  {order.division === 5 ? "Лоун " : null}
                                  {order.division === 6 ? "Кара " : null}
                                  {order.client.number}
                                </div>
                                <div className="field customer">
                                  {order.worker && !order.customer ? order.worker.first_name : null}
                                  {order.customer && !order.worker ? order.customer.mobile : null}
                                  {order.customer && order.worker ? order.worker.first_name : null}
                                </div>
                                <div className="field amount">
                                  <NumberFormat
                                    value={parseInt(order.amount)}
                                    displayType={'text'}
                                    thousandSeparator={true}
                                  />₮
                                </div>
                                {order.status === "Төлбөр гүйцэт төлсөн." ? 
                                  <div className="field amount">
                                    <NumberFormat
                                      value={parseInt(order.amount)}
                                      displayType={'text'}
                                      thousandSeparator={true}
                                    />₮
                                  </div> 
                                  : 
                                  <div className="field amount">
                                    <NumberFormat
                                      value={this.calculator(order.payments)}
                                      displayType={'text'}
                                      thousandSeparator={true}
                                    />₮
                                  </div>
                                }
                                {parseInt(order.discounted_amount) - this.calculator(order.payments) > 0 && order.worker === null ? (
                                  <div className="field amount under">
                                    <NumberFormat
                                      value={parseInt(order.discounted_amount) - this.calculator(order.payments)}
                                      displayType={'text'}
                                      thousandSeparator={true}
                                    />₮
                                  </div>
                                ) : (
                                  <div className={parseInt(order.discounted_amount) - this.calculator(order.payments) < 0 ? "field amount up" : "field amount"}>
                                    <NumberFormat
                                      value={parseInt(order.discounted_amount) - this.calculator(order.payments)}
                                      displayType={'text'}
                                      thousandSeparator={true}
                                    />₮
                                  </div>
                                )}
                                <div className={order.discounted_percent > 0 ? "field discount discounted" : "field discount"}>
                                  <div>{order.discounted_percent}%</div>
                                </div>
                            </div>
                        </button>
                    )
                    }else{
                      return null
                    }
                })}
            </div>
          </div>
      </div>
    );
  }
}
