import React, { Component } from 'react';
import { Modal, Button } from "react-bootstrap";
// import Moment from "moment";
// import Select from "react-select";

export default class Ebarimt extends Component {
  render() {
    return (
    <Modal
        show={this.props.show_modal}
        onHide={this.props.modalHide}
        size="lg"
    >
        <Modal.Header closeButton>
        <Modal.Title>Ебаримт хэвлэх</Modal.Title>
        </Modal.Header>
        <Modal.Body className="">
        <div className="ebarimt">
            <div className="title">
                БАЙГУУЛЛАГА
            </div>
            <div className="desc">
                Хэрэв байгууллага бол доорх талбарт регистрийн дугаарыг оруулна уу!
            </div>
            <input
                type="text"
                className="customerInput"
                name="company_register"
                onChange={(e) => this.props.registerChanger(e)}
                placeholder="Регистер"
                maxLength="7"
                minLength="7"
            />
            {this.props.company_register_status === "4" ? (
                <div className="status green">
                    {this.props.company_name}
                </div>
            ):(
                <div className="status red">
                    {this.props.company_register_status === "1" ? "Регистерийн орон дутуу байна." : null}
                    {this.props.company_register_status === "2" ? "Регистерийн орон илүү байна." : null}
                    {this.props.company_register_status === "3" ? "Компани олдсонгүй" : null}
                    {this.props.company_register_status === "0" ? "" : null}
                </div>
            )}
        </div>
        <div className="ebarimt human">
            <div className="title">
                ХУВЬ ХҮН
            </div>
            <div className="desc">
                Хэрэв хувь хүн бол шууд хэвлэх коммандыг өгнө!
            </div>
        </div>
        </Modal.Body>
        <Modal.Footer className="modal-footer justify-content-between">
            <Button variant="warning" size="sm" onClick={this.props.modalHide}>
                <i className="fas fa-arrow-left" /> <b> Буцах</b>
            </Button>
            <button className="btn btn-success" onClick={this.props.print_bill} disabled={this.props.company_register_status === "0" || this.props.company_register_status === "4" ? false : true}>
            <i className="fa fa-print" aria-hidden="true"></i> Хэвлэх
            </button>
        </Modal.Footer>
    </Modal>
    )
  }
}
