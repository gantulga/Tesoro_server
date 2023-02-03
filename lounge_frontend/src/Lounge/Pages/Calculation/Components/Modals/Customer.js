import React, { Component } from 'react';
import { Modal, Button } from "react-bootstrap";
import Moment from "moment";
import Select from "react-select";

export default class Customer extends Component {
  render() {
        return (
        <Modal
            show={this.props.show_modal}
            onHide={this.props.modalHide}
            size="lg"
        >
            <Modal.Header closeButton>
            <Modal.Title>Үйлчилүүлэгч</Modal.Title>
            </Modal.Header>
            <Modal.Body className="">
            <div className="customer_info">
                <div className="customer">
                    <div className="text">
                        Захиалга өгсөн үйлчлүүлэгчийн утасны дугаарыг
                        бичих хэсэг.
                    </div>
                    <input
                        type="text"
                        className="customerInput"
                        name="customer"
                        value={this.props.customer_mobile}
                        onChange={(e) => this.props.customerChanger(e, "input")}
                        placeholder="Утасны дугаар ..."
                        maxLength="8"
                    />
                    <button
                        disabled={
                        this.props.customer_mobile !== null &&
                        this.props.customer_mobile.length === 8
                            ? false
                            : true
                        }
                        onClick={this.props.set_customer_order}
                    >
                        <i
                        className="fa fa-floppy-o"
                        aria-hidden="true"
                        ></i>
                    </button>
                </div>
                <div className="worker">
                    <div className="text">
                        Бүтээгдэхүүн авсан, дутаасан, үрэгдүүлсэн ажилтны
                        нэрийг сонгоно.
                    </div>
                    <Select
                        className="basic-single workerSelector"
                        classNamePrefix="select"
                        defaultValue=""
                        isClearable="true"
                        isSearchable="true"
                        name="worker_id"
                        onChange={this.props.workerChanger}
                        getOptionLabel={(option) => {
                        return option.first_name;
                        }}
                        getOptionValue={(option) => {
                        return option.id;
                        }}
                        options={this.props.workersData}
                        placeholder="Ажилтаны нэрийг сонгоно уу!"
                    />
                    <button
                        disabled={
                        this.props.worker_id !== null ? false : true
                        }
                        onClick={this.props.set_worker_order}
                    >
                        <i
                        className="fa fa-floppy-o"
                        aria-hidden="true"
                        ></i>
                    </button>
                </div>
                {this.props.order_information ? (
                    <div className="orderInfo">
                        <ul>
                        <li>
                            Үйлчлүүлэгч:{" "}
                            {this.props.order_information.customer
                            ? this.props.order_information.customer
                                .mobile
                            : "Бүртгэлтгүй."}
                        </li>
                        <li>
                            Үйлчлүүлсэн Ажилтан:{" "}
                            {this.props.order_information.worker
                            ? this.props.order_information.worker
                                .first_name
                            : "Ажилтан биш."}
                        </li>
                        <li>
                            Дүн: {this.props.order_information.amount}₮
                        </li>
                        <li>
                            Төлөв: {this.props.order_information.status}
                        </li>
                        <li>
                            Ширээ:{" "}
                            {
                            this.props.order_information.client.division
                                .name
                            }{" "}
                            - {this.props.order_information.client.number}
                        </li>
                        <li>
                            Үүссэн:{" "}
                            {Moment(
                            this.props.order_information.created_at
                            ).format("Do, H:mm")}
                        </li>
                        <li>
                            Зассан:{" "}
                            {Moment(
                            this.props.order_information.updated_at
                            ).format("Do, H:mm")}
                        </li>
                        </ul>
                    </div>
                ) : null}
            </div>
            </Modal.Body>
            <Modal.Footer className="modal-footer justify-content-between">
            <Button variant="warning" size="sm" onClick={this.props.modalHide}>
                <i className="fas fa-arrow-left" /> <b> Буцах</b>
            </Button>
            </Modal.Footer>
        </Modal>
        )
  }
}
