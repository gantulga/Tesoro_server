import React, { Component } from "react";
import { InputGroup, FormControl } from "react-bootstrap";
import NumberFormat from "react-number-format";

export default class PaymentInput extends Component {
  render() {
    const walletsData = Array.from(this.props.walletsData);
    return (
      <div key={this.props.tulhuur} className="row mb-3">
        <div className="col-8">
          <div className="float-left inputWidth100">
            <InputGroup size="sm">
              <FormControl
                key={this.props.tulhuur}
                aria-label="Small"
                aria-describedby="inputGroup-sizing-sm"
                name="wallet"
                as="select"
                defaultValue="0"
                onChange={(e) => {
                  this.props.handleChange(e, this.props.tulhuur);
                }}
              >
                <option key="0" value="0" disabled>
                  Банкаа сонгоно уу.
                </option>
                {walletsData.map((el, index) => {
                  return (
                    <option key={index + 1} value={el.id}>
                      {el.name} - {el.wallet} {el.account}
                    </option>
                  );
                })}
              </FormControl>
            </InputGroup>
          </div>
        </div>
        <div className="col-4">
          <div className="float-right inputWidth100">
            <InputGroup size="sm">
              <NumberFormat
                value={this.props.amount}
                displayType={"number"}
                thousandSeparator={true}
                name="amount"
                className="form-control"
                key={this.props.tulhuur}
                onChange={(e) => {
                  this.props.handleChange(e, this.props.tulhuur);
                }}
              />
            </InputGroup>
          </div>
        </div>
      </div>
    );
  }
}
