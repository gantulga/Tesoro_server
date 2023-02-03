import React, { Component } from "react";
import { InputGroup, FormControl } from "react-bootstrap";
import NumberFormat from "react-number-format";
import { fetchGet } from "../Robots/FetchGetRobot";

export default class ProductInput extends Component {
  constructor(props) {
    super(props);
    this.state = {
      productsData: [],
    };
  }

  async getProductsData(e) {
    var url =
      "http://" +
      this.props.ip_address +
      "/api/client/" +
      e.target.value +
      "/products/";
    var data;
    var productsData = fetchGet(url, this.props.token);
    await productsData.then(
      await function (val) {
        data = val;
      }
    );
    await this.setState({
      productsData: data,
    });
  }

  async getProductMaxQuantity(e) {}

  render() {
    const productsData = Array.from(this.state.productsData);
    return (
      <div key={this.props.propKey} className="row mb-3">
        <div className="col-sm-3">
          <div className="float-left inputWidth100">
            <InputGroup size="sm">
              <FormControl
                key={this.props.propKey}
                aria-label="Small"
                aria-describedby="inputGroup-sizing-sm"
                name="client"
                as="select"
                defaultValue="0"
                onChange={(e) => {
                  this.props.handleChange(e, this.props.propKey);
                  this.getProductsData(e);
                }}
              >
                <option key="0" value="0" disabled>
                  Цэгийг сонгоно уу.
                </option>
                {this.props.clientsData.map((el, index) => {
                  return (
                    <option key={index + 1} value={el.id}>
                      {el.number} - {el.description}
                    </option>
                  );
                })}
              </FormControl>
            </InputGroup>
          </div>
        </div>
        <div className="col-sm-3">
          <div className="float-left inputWidth100">
            <InputGroup size="sm">
              <FormControl
                key={this.props.propKey}
                aria-label="Small"
                aria-describedby="inputGroup-sizing-sm"
                name="product"
                as="select"
                defaultValue="0"
                onChange={(e) => {
                  this.props.handleChange(e, this.props.propKey);
                  this.getProductMaxQuantity(e);
                }}
              >
                <option key="0" value="0" disabled>
                  Бараагаа сонгоно уу.
                </option>
                {productsData.map((el, index) => {
                  return (
                    <option key={index + 1} value={el.id}>
                      {el.product.name}
                    </option>
                  );
                })}
              </FormControl>
            </InputGroup>
          </div>
        </div>
        <div className="col-sm-6 row">
          <div className="col-2">
            <div className="float-right inputWidth100">
              <InputGroup size="sm">
                <NumberFormat
                  value={this.props.product.quantity}
                  displayType={"number"}
                  thousandSeparator={true}
                  name="quantity"
                  className="form-control"
                  key={this.props.propKey}
                  onChange={(e) => {
                    this.props.handleChange(e, this.props.propKey);
                  }}
                />
              </InputGroup>
            </div>
          </div>
          <div className="col-1">
            <div className="inputWidth100">x</div>
          </div>
          <div className="col-2">
            <div className="inputWidth100">{this.props.product.cost}</div>
          </div>
          <div className="col-2">
            <div className="inputWidth100">
              <InputGroup size="sm">
                <NumberFormat
                  value={this.props.product.discount}
                  displayType={"number"}
                  thousandSeparator={false}
                  name="discount"
                  className="form-control"
                  key={this.props.propKey}
                  onChange={(e) => {
                    this.props.handleChange(e, this.props.propKey);
                  }}
                />
              </InputGroup>
            </div>
          </div>
          <div className="col-1">
            <div className="inputWidth100">=</div>
          </div>
          <div className="col-4">
            <div className="float-right">{this.props.product.subtotal}</div>
          </div>
        </div>
      </div>
    );
  }
}
