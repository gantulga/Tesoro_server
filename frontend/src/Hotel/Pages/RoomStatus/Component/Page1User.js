import React, { Component } from "react";
import { Modal, Button, InputGroup, FormControl } from "react-bootstrap";
import Select from "react-select";
import { store } from "react-notifications-component";

export default class Page1User extends Component {
  constructor(props) {
    super(props);
    this.state = {
      customersData: [],
    };
  }

  getCustomersData() {
    fetch("http://" + this.props.ip_address + "/api/customers/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then((response) => response.json())
      .then(async (customersList) => {
        await this.setState({ customersData: customersList });
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Үйлчилүүлэгчдийн мэдээллийг сервер чадсангүй. Системийн инженерт хандаж хэлнэ үү. " +
            error,
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
      });
  }

  componentDidMount() {
    this.getCustomersData();
  }

  render() {
    return (
      <Modal show={this.props.show} onHide={this.props.onHide}>
        <Modal.Header closeButton>
          <Modal.Title>Үйлчилүүлэгчийн мэдээлэл</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <div className="newRegisterTitle col-12">
            Регистерийн дугаараар нь хайх шаардлагатай!
          </div>
          <Select
            className="basic-single"
            classNamePrefix="select"
            defaultValue=""
            isClearable="true"
            isSearchable="true"
            name="customerId"
            onChange={this.props.changeFunction}
            getOptionLabel={(option) => {
              return option.register;
            }}
            getOptionValue={(option) => {
              return option.id;
            }}
            options={this.state.customersData}
            placeholder="Үйлчлүүлэгчийн регистер ..."
          />
          <hr />
          <div className="newRegisterTitle col-12">Шинээр бүртгэх</div>
          <InputGroup size="sm">
            <InputGroup.Prepend>
              <InputGroup.Text id="inputGroup-sizing-sm">
                Регистер:
              </InputGroup.Text>
            </InputGroup.Prepend>
            <FormControl
              aria-label="Small"
              aria-describedby="inputGroup-sizing-sm"
              name="register"
              value={this.props.register}
              onChange={this.props.changeFunction}
            />
          </InputGroup>
          <br />
          <InputGroup size="sm">
            <InputGroup.Prepend>
              <InputGroup.Text id="inputGroup-sizing-sm">Овог:</InputGroup.Text>
            </InputGroup.Prepend>
            <FormControl
              aria-label="Small"
              aria-describedby="inputGroup-sizing-sm"
              name="lastname"
              value={this.props.lastname}
              onChange={this.props.changeFunction}
            />
          </InputGroup>
          <br />
          <InputGroup size="sm">
            <InputGroup.Prepend>
              <InputGroup.Text id="inputGroup-sizing-sm">Нэр:</InputGroup.Text>
            </InputGroup.Prepend>
            <FormControl
              aria-label="Small"
              aria-describedby="inputGroup-sizing-sm"
              name="firstname"
              value={this.props.firstname}
              onChange={this.props.changeFunction}
            />
          </InputGroup>
          <br />
          <InputGroup size="sm">
            <InputGroup.Prepend>
              <InputGroup.Text id="inputGroup-sizing-sm">Утас:</InputGroup.Text>
            </InputGroup.Prepend>
            <FormControl
              aria-label="Small"
              aria-describedby="inputGroup-sizing-sm"
              name="phoneNumber"
              value={this.props.phoneNumber}
              onChange={this.props.changeFunction}
            />
          </InputGroup>
          <br />
          <InputGroup size="sm">
            <InputGroup.Prepend>
              <InputGroup.Text id="inputGroup-sizing-sm">
                Имэйл:
              </InputGroup.Text>
            </InputGroup.Prepend>
            <FormControl
              aria-label="Small"
              aria-describedby="inputGroup-sizing-sm"
              name="email"
              value={this.props.email}
              onChange={this.props.changeFunction}
            />
          </InputGroup>
          <br />
          <InputGroup size="sm">
            <InputGroup.Prepend>
              <InputGroup.Text id="inputGroup-sizing-sm">Хаяг:</InputGroup.Text>
            </InputGroup.Prepend>
            <FormControl
              aria-label="Small"
              aria-describedby="inputGroup-sizing-sm"
              name="homeAddress"
              value={this.props.homeAddress}
              onChange={this.props.changeFunction}
              required={true}
            />
          </InputGroup>
        </Modal.Body>
        <Modal.Footer className="modal-footer justify-content-between">
          <Button variant="danger" onClick={this.props.onHide} size="sm">
            <i className="fas fa-times" /> <b> Цуцлах</b>
          </Button>
          <Button
            variant="success"
            onClick={() => this.props.pageShow(2, this.props.room)}
            size="sm"
            type="submit"
          >
            <i className="fas fa-arrow-right" /> <b> Цааш</b>
          </Button>
        </Modal.Footer>
      </Modal>
    );
  }
}
