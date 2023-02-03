import React, { Component } from "react";
import { Modal, Button } from "react-bootstrap";
//import Moment from "react-moment";
//import { getUserId } from "../../../../../Main/Utils/Auth";

export default class ProductBalances extends Component {
  constructor(props) {
    super(props);
    this.state = {
      productBalances: [],
    };
  }

  show_addTransfer() {
    this.setState({ show_addTransfer: !this.state.show_addTransfer });
  }

  handleChange(e) {
    if (e.target.name !== "description") {
      this.setState({
        [e.target.name]: parseInt(e.target.value),
      });
    } else {
      this.setState({
        [e.target.name]: e.target.value,
      });
    }
  }

  render() {
    return (
      <Modal
        show={this.props.show_modal}
        onHide={this.props.modalHide}
        size="lg"
      >
        <Modal.Header closeButton>
          <Modal.Title>Барааны жагсаалт</Modal.Title>
        </Modal.Header>
        <Modal.Body className="productBalancesContainer">
          <h4>Бүтээгдэхүүн</h4>
          <div className="body">
            <div className="balance">
              <div className="number">№</div>
              <div className="name">Бараа</div>
              <div className="type">Х.Н</div>
              <div className="prev_balance">
                {this.props.shift_workers.length > 1 ? this.props.shift_workers[1].worker.first_name + this.props.shift_workers[1].id : null}
              </div>
              <div className="quantity">
                {this.props.shift_worker !== null ? this.props.shift_worker.worker.first_name + this.props.shift_worker.id : null}
              </div>
              <div className="sold">
                Зарагдсан
              </div>
            </div>
            {this.props.productBalances.map((balance, index) => {
              if(balance.product !== null){
                if(!balance.product.is_ingrediented){
                  return (
                    <div className="balance" key={index}>
                      <div className="number">{index + 1}.</div>
                      <div className="name">{balance.product.name}</div>
                      <div className="type">
                        {balance.quantity !== null && balance.size === null ? "ш" : null}
                        {balance.size !== null && balance.quantity === null ? "гр" : null}
                      </div>
                      {this.props.prevProductBalances.length > 0 ? (
                        <div className="prev_balance">
                          {this.props.prevProductBalances.map((prevBalance, index)=>{
                            if(prevBalance.product !== null){
                              if(prevBalance.product.id === balance.product.id){
                                if(prevBalance.quantity !== null){
                                  return prevBalance.quantity
                                }else if(prevBalance.size !== null){
                                  return prevBalance.size
                                }else{
                                  return null
                                }
                              }else{
                                return null
                              }
                            }else{return null}
                          })}
                        </div>
                      ) : null}
                      <div className="quantity">
                        {balance.quantity !== null ? balance.quantity : null}
                        {balance.size !== null ? balance.size : null}
                      </div>
                      {this.props.prevProductBalances.length > 0 ? (
                        <div className="sold">
                          {this.props.prevProductBalances.map((prevBalance, index)=>{
                            if(prevBalance.product !== null){
                              if(balance.product.id === prevBalance.product.id){
                                var too
                                if(balance.quantity !== null && prevBalance.quantity !== null){
                                  too = prevBalance.quantity - balance.quantity
                                  if(too > 0){
                                    return too
                                  }else{
                                    return null
                                  }
                                }else if(balance.size !== null && prevBalance.size !== null){
                                  too = prevBalance.size - balance.size
                                  if(too > 0){
                                    return too
                                  }else{
                                    return null
                                  }
                                }else{
                                  return null
                                }
                              }else{
                                return null
                              }
                            }else{return null}
                          })}
                        </div>
                      ) : null}
                    </div>
                  );
                }else{return null}
              }else{return null}
            })}
          </div>
          <h4 className="pt-5">Материал</h4>
          <div className="body">
            <div className="balance">
              <div className="number">№</div>
              <div className="name">Бараа</div>
              <div className="type">Х.Н</div>
              <div className="prev_balance">
                {this.props.shift_workers.length > 1 ? this.props.shift_workers[1].worker.first_name + this.props.shift_workers[1].id : null}
              </div>
              <div className="quantity">
                {this.props.shift_worker !== null ? this.props.shift_worker.worker.first_name + this.props.shift_worker.id : null}
              </div>
              <div className="sold">
                Зарагдсан
              </div>
            </div>
            {this.props.productBalances.map((balance, index) => {
              if(balance.commodity !== null){
                return (
                  <div className="balance" key={index}>
                    <div className="number">{index + 1}.</div>
                    <div className="name">{balance.commodity.name}</div>
                    <div className="type">
                      {balance.quantity !== null && balance.size === null ? "ш" : null}
                      {balance.size !== null && balance.quantity === null ? "гр" : null}
                    </div>
                    {this.props.prevProductBalances.length > 0 ? (
                      <div className="prev_balance">
                        {this.props.prevProductBalances.map((prevBalance, index)=>{
                          if(prevBalance.commodity !== null){
                            if(prevBalance.commodity.id === balance.commodity.id){
                              if(prevBalance.quantity !== null){
                                return prevBalance.quantity
                              }else if(prevBalance.size !== null){
                                return prevBalance.size
                              }else{
                                return null
                              }
                            }else{
                              return null
                            }
                          }else{return null}
                        })}
                      </div>
                    ) : null}
                    <div className="quantity">
                      {balance.quantity !== null ? balance.quantity : null}
                      {balance.size !== null ? balance.size : null}
                    </div>
                    {this.props.prevProductBalances.length > 0 ? (
                      <div className="sold">
                        {this.props.prevProductBalances.map((prevBalance, index)=>{
                          if(prevBalance.commodity !== null){
                            if(balance.commodity.id === prevBalance.commodity.id){
                              var too
                              if(balance.quantity !== null && prevBalance.quantity !== null){
                                too = prevBalance.quantity - balance.quantity
                                if(too > 0){
                                  return too
                                }else{
                                  return null
                                }
                              }else if(balance.size !== null && prevBalance.size !== null){
                                too = prevBalance.size - balance.size
                                if(too > 0){
                                  return too
                                }else{
                                  return null
                                }
                              }else{
                                return null
                              }
                            }else{
                              return null
                            }
                          }else{return null}
                        })}
                      </div>
                    ) : null}
                  </div>
                );
              }else{return null}
            })}
          </div>
        </Modal.Body>
        <Modal.Footer className="modal-footer justify-content-between">
          <Button variant="warning" size="sm" onClick={this.props.modalHide}>
            <i className="fas fa-arrow-left" /> <b> Буцах</b>
          </Button>
        </Modal.Footer>
      </Modal>
    );
  }
}
