import React, { Component } from 'react';
import { Modal, Button } from "react-bootstrap";
import NumberFormat from 'react-number-format';
import { store } from "react-notifications-component";
import { getUserId } from "../../../../../Main/Utils/Auth";

export default class DetialsInformation extends Component {

    constructor(props) {
        super(props);
        this.state = {
          discount: 0,
        };
        this.changeDiscount = this.changeDiscount.bind(this);
    }

    async changeDiscount(e) {
        e.persist();
        if (e.target.name === "discounted-price") {
            var paymentTotalAmount = 0;
            this.props.order_payments.map(
            (payment) =>
                (paymentTotalAmount = parseInt(paymentTotalAmount) + parseInt(payment.amount))
            );
            if(parseInt(e.target.value) > parseInt(this.props.order_information.amount) - paymentTotalAmount){
                await this.setState({
                    discount: parseInt(this.props.order_information.amount) - paymentTotalAmount
                })
            }else{
                await this.setState({
                    discount: parseInt(e.target.value)
                })
            }
        }
    }

    componentDidMount(){
        if(this.props.order_information){
            this.setState({
                discount: this.props.order_information.discount,
            })
        }
    }

    async saveDiscrount(){
        var percent = parseInt(this.state.discount)/parseInt(this.props.order_information.amount)*100
        var status = ""

        var paymentTotalAmount = 0;
        this.props.order_payments.map(
        (payment) =>
            (paymentTotalAmount =
            parseInt(paymentTotalAmount) + parseInt(payment.amount))
        );

        if(paymentTotalAmount + parseInt(this.state.discount) === parseInt(this.props.order_information.amount)){
            status = "Төлбөр гүйцэт төлсөн."
        }else if(paymentTotalAmount + parseInt(this.state.discount) < parseInt(this.props.order_information.amount) && paymentTotalAmount > 0){
            status = "Төлбөр дутуу төлсөн."
        }else{
            status = "Төлбөр төлөгдөөгүй."
        }
        
        var orderData = {
            "discount":this.state.discount, 
            "discounted_amount": parseInt(this.props.order_information.amount) - parseInt(this.state.discount),
            "discounted_percent": percent.toFixed(2),
            "status": status,
            "discount_by": getUserId()
        }

        var url2 = "http://" + this.props.ip_address + "/api/lounge/postOrder/" + this.props.order_information.id.toString() + "/";
        var response = await fetch(url2, {
          method: "PATCH",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
            Authorization: "Token " + this.props.token,
          },
          withCredentials: true,
          body: JSON.stringify(orderData),
        })
        .then((results) => {
            console.log(results.json())
            return results;
        })

        if(response.ok){
            store.addNotification({
                title: "Амжилттай хадгалагдлаа",
                message:
                  "Хөнгөлөлтийн мэдээлэл амжилттай хадгалагдлаа",
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
            this.props.set_order_information(this.props.order_information.id)
        }else{
            store.addNotification({
                title: "Алдаа гарлаа!",
                message:
                  "Хадгалах явцад алдаа гарлаа системийн инженерт ханадана уу!",
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
        }
    }

    render() {
        var paymentTotalAmount = 0;
        this.props.order_payments.map(
        (payment) =>
            (paymentTotalAmount =
            parseInt(paymentTotalAmount) + parseInt(payment.amount))
        );
        
        return (
            <Modal
                show={this.props.show_modal}
                onHide={this.props.modalHide}
                size="lg"
            >
                <Modal.Header closeButton>
                <Modal.Title>Барааг хямдруулах</Modal.Title>
                </Modal.Header>
                <Modal.Body className="">
                    {this.props.order_id ? (
                        <div className="discount_modal">
                            {this.props.order_information ?
                                <>
                                    <div className="box">
                                        <div className="name">Салбар: </div>
                                        <div className="value">{this.props.order_information.client ? this.props.order_information.client.division.name : null}</div>
                                    </div>
                                    <div className="box">
                                        <div className="name">Ширээ/Өрөө: </div>
                                        <div className="value">{this.props.order_information.client ? this.props.order_information.client.number : null}</div>
                                    </div>
                                    <div className="box">
                                        <div className="name">Хэрэглэгч: </div>
                                        <div className="value">{this.props.order_information.customer ? this.props.order_information.customer.mobile : null}</div>
                                    </div>
                                    <div className="box">
                                        <div className="name">Ажилчин: </div>
                                        <div className="value">{this.props.order_information.worker ? this.props.order_information.worker.first_name: null}</div>
                                    </div>
                                    <div className="box">
                                        <div className="name">Нийт дүн: </div>
                                        <div className="value">
                                            <NumberFormat value={parseInt(this.props.order_information.amount)} displayType={'text'} thousandSeparator={true} />₮
                                        </div>
                                    </div>
                                    <div className="box">
                                        <div className="name">Хөнгөлөгдөж буй дүн: </div>
                                        <div className="value">
                                            <NumberFormat value={parseInt(this.props.order_information.discount)} displayType={'text'} thousandSeparator={true} />₮
                                        </div>
                                    </div>
                                    <div className="box">
                                        <div className="name">Хөнгөлөгдөж буй хувь: </div>
                                        <div className="value">
                                        {this.props.order_information.discounted_percent}%
                                        </div>
                                    </div>
                                    <div className="box">
                                        <div className="name">Хөнгөлөгдсөн дүн: </div>
                                        <div className="value">
                                            <NumberFormat value={parseInt(this.props.order_information.discounted_amount)} displayType={'text'} thousandSeparator={true} />₮
                                        </div>
                                    </div>
                                    <div className="box">
                                        <div className="name">Төлсөн: </div>
                                        <div className="value paid">
                                            <NumberFormat value={parseInt(paymentTotalAmount)} displayType={'text'} thousandSeparator={true} />₮
                                        </div>
                                    </div>
                                    <div className="box">
                                        <div className="name">Дутуу: </div>
                                        <div className="value under">
                                            <NumberFormat value={parseInt(this.props.order_information.discounted_amount) - parseInt(paymentTotalAmount)} displayType={'text'} thousandSeparator={true} />₮
                                        </div>
                                    </div>
                                </> : null}
                            <div className="discount-input">
                                <div className="sentence">Хөнгөлөгдөж байгаа үнийн дүнгээ бичнэ үү! </div>
                                <input type="number" name="discounted-price" onChange={(e) => this.changeDiscount(e)} value={this.state.discount} />
                            </div>
                            
                        </div>
                    ) : null}
                </Modal.Body>
                <Modal.Footer className="modal-footer justify-content-between">
                    <Button variant="warning" size="sm" onClick={this.props.modalHide}>
                        <i className="fas fa-arrow-left" /> <b> Буцах</b>
                    </Button>
                    <Button variant="success" size="sm" onClick={()=>this.saveDiscrount()}>
                        <i className="fas fa-save" /> <b> Хадгалах</b>
                    </Button>
                </Modal.Footer>
            </Modal>
        )
    }
}
