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
            <Modal.Title>Үйлчилүүлэгч</Modal.Title>
            </Modal.Header>
            <Modal.Body className="">
            <div className="customer_info">
                <div className="worker">
                    <div className="text">
                        Бүтээгдэхүүн авсан, дутаасан, үрэгдүүлсэн ажилтны
                        нэрийг сонгоно.
                    </div>
                </div>
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
