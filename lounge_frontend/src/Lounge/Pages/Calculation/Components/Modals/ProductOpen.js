import React, { Component } from 'react';
import { Modal, Button } from "react-bootstrap";
// import Moment from "moment";
// import Select from "react-select";

export default class ProductOpen extends Component {
  render() {
    return (
    <Modal
        show={this.props.show_modal}
        onHide={this.props.modalHide}
        size="lg"
    >
        <Modal.Header closeButton>
        <Modal.Title>Бүтээгдэхүүн задлах</Modal.Title>
        </Modal.Header>
        <Modal.Body className="canOpenProductBody">
        <div className="ebarimt">
            <div className="title">
                ЗАДЛАХ БОЛОМЖТОЙ БҮТЭЭГДЭХҮҮНҮҮД
            </div>
            <div className="desc">
                Барааг задгай граммын бараа болгон задлах бол доорх бараанаас задлахаа сонгоно уу!
            </div>
            <table className="canOpenProduct">
                <tbody>
                    <tr>
                        <th>№</th>
                        <th>Бүтээгдэхүүний нэр</th>
                        <th className="right">Тоо</th>
                        <th className="right">Үйлдэл</th>
                    </tr>
                    {this.props.products.map((product, index)=>{
                        return(
                            <tr key={index}>
                                <td>{index + 1}</td>
                                <td>{product.product_name}</td>
                                <td className="right">{product.quantity}</td>
                                <td className="right"><button onClick={()=>{this.props.product_convert_to_commodity(product.product_id)}}><i className="fa fa-flask" aria-hidden="true"></i></button></td>
                            </tr>
                        )
                    })}
                </tbody>
            </table>
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
