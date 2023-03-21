import React, { Component } from 'react';

export default class Dashboard extends Component {
  render() {
    return (
      <div className={this.props.show_modal ? "show" : "hide" }>
        {this.props.orders.length > 0 ? (
            <div className="dashboard">
                <div className="dashboard-body">
                    {this.props.orders.map((order, index) => {
                        var payments_total = 0
                        order.payments.map((payment)=>{
                            payments_total = payments_total + parseInt(payment.amount)
                            return null
                        })
                        var color = "default"
                        if(order.division.id === 1){
                            color = "office"
                        }else if(order.division.id === 3){
                            color = "hotel"
                        }else if(order.division.id === 4){
                            color = "restaurant"
                        }else if(order.division.id === 5){
                            color = "lounge"
                        }else if(order.division.id === 6){
                            color = "karaoke"
                        }

                        return (
                            <figure key={index} onClick={() =>this.props.set_order(order.id, order.amount)}>
                                <div className={color + " address"}>
                                    {order.division.name} - {order.client.number}
                                </div>
                                <div className="details">
                                    {order.order_detials.map((detail, index) => {
                                        if(detail.is_deleted){
                                            return null
                                        }else{
                                            return (
                                                <div className="detail" key={index}>
                                                    <div className="product">{detail.product.name}</div>
                                                    <div className="quantity">{detail.quantity}</div>
                                                    <div className="subtotal">
                                                    {detail.subtotal.slice(0, -3)}₮
                                                    </div>
                                                </div>
                                            );
                                        }
                                    })}
                                </div>
                                <div className="amount">
                                    Нийт: {order.discounted_amount - payments_total}₮
                                </div>
                            </figure>
                        );
                    })}
                </div>
            </div>
        ) : null}
      </div>
    );
  }
}
