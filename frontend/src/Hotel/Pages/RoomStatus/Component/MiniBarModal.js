import React, { Component } from "react";
import { Modal, Button } from "react-bootstrap";

export default class MiniBarModal extends Component {
  render() {
    return (
      <Modal show={this.props.show} onHide={this.props.onHide}>
        <Modal.Header closeButton>
          <Modal.Title>МиниБар дах бараанууд!</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <table className="table table-sm table-striped compact  small-table">
            <thead>
              <tr>
                <th>#</th>
                <th>Нэр</th>
                <th>Байх ёстой</th>
                <th>Байгаа</th>
              </tr>
            </thead>
            <tbody>
              {this.props.room.item_balances
                ? this.props.room.client_items.map((item, index) => (
                    <tr key={index}>
                      <td>{index + 1}</td>
                      <td>{item.product.name}</td>
                      <td>{item.quantity}</td>
                      <td>
                        {this.props.room.item_balances.map((i) => {
                          if (item.product) {
                            if (item.product.id === i.product.id) {
                              return i.quantity;
                            } else {
                              return null;
                            }
                          } else {
                            return null;
                          }
                        })}
                      </td>
                    </tr>
                  ))
                : null}
            </tbody>
          </table>
        </Modal.Body>
        <Modal.Footer className="modal-footer justify-content-between">
          <Button variant="danger" onClick={this.props.onHide} size="sm">
            <i className="fas fa-times" /> <b> Буцах</b>
          </Button>
        </Modal.Footer>
      </Modal>
    );
  }
}
