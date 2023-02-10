import React, { Component } from "react";
import { Modal, Button } from "react-bootstrap";
import Moment from "react-moment";
import { store } from "react-notifications-component";
import { getUserId } from "../../../../../Main/Utils/Auth";

export default class MoneyTransfers extends Component {
  constructor(props) {
    super(props);
    this.state = {
      mTransfersData: [],
      mTransferTypesData: [],
      walletsData: [],
      workersData: [],
      money_transfer_type: null,
      fr_wallet: null,
      amount: 0,
      to_user: null,
      description: null,
      show_addTransfer: false,
      shift_work: null,
      type: "all"
    };
    this.show_addTransfer = this.show_addTransfer.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.postMTransfer = this.postMTransfer.bind(this);
    this.type_changer = this.type_changer.bind(this)
  }

  async getMTransferTypesData() {
    await fetch(
      "http://" +
        this.props.ip_address +
        "/api/lounge/loungeMoneyTransferTypes/",
      {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
      }
    )
      .then(async (response) => {
        const data = await response.json();
        await this.setState({
          mTransferTypesData: data,
        });
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Алдаа гарлаа. Системийн инженертэй холбогдож хэлнэ үү! Алдааны мэдээлэл: " +
            error,
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      });
  }

  async getWalletsData() {
    await fetch("http://" + this.props.ip_address + "/api/finance/wallets/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        await this.setState({
          walletsData: data,
        });
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Алдаа гарлаа. Системийн инженертэй холбогдож хэлнэ үү! Алдааны мэдээлэл: " +
            error,
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      });
  }

  async getWorkersData() {
    await fetch("http://" + this.props.ip_address + "/api/users/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        await this.setState({
          workersData: data,
        });
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Алдаа гарлаа. Системийн инженертэй холбогдож хэлнэ үү! Алдааны мэдээлэл: " +
            error,
          type: "danger",
          insert: "top",
          container: "bottom-right",
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
    this.getMTransferTypesData();
    this.getWalletsData();
    this.getWorkersData();
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

  async postMTransfer() {
    var orderObj = {
      money_transfer_type: this.state.money_transfer_type,
      fr_wallet: this.state.fr_wallet,
      to_user: this.state.to_user,
      amount: this.state.amount,
      shift_work: this.props.shift_worker.id,
      description: this.state.description,
      created_by: getUserId(),
      created_at: new Date(),
    };
    await fetch(
      "http://" + this.props.ip_address + "/api/finance/postMoneyTransfer/",
      {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
          Authorization: "Token " + this.props.token,
        },
        withCredentials: true,
        body: JSON.stringify(orderObj),
      }
    )
      .then(async (response) => {
        if (response.ok) {
          store.addNotification({
            title: "Амжилттай",
            message: "Зарлагын гүйлгээ амжилттай хадгалагдлаа!",
            type: "success",
            insert: "top",
            container: "bottom-right",
            animationIn: ["animated", "fadeIn"],
            animationOut: ["animated", "fadeOut"],
            dismiss: {
              duration: 5000,
              onScreen: true,
            },
          });
          this.getMTransfersData();
        }
        return response;
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Алдаа гарлаа. Системийн инженертэй холбогдож хэлнэ үү! Алдааны мэдээлэл: " +
            error,
          type: "danger",
          insert: "top",
          container: "bottom-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      });
  }

  async type_changer(type){
    console.log(type)
    await this.setState({
      type: type
    })
  }

  render() {
    var totalOrlogo = 0;
    var totalZarlaga = 0;
    this.state.mTransfersData.map((transfer) => {
      if ([1, 9].includes(transfer.money_transfer_type)) {
        totalOrlogo = totalOrlogo + parseInt(transfer.amount);
      } else if ([2, 3, 6, 7, 8, 10].includes(transfer.money_transfer_type)) {
        totalZarlaga = totalZarlaga + parseInt(transfer.amount);
      }
      return null;
    });
    return (
      <Modal
        show={this.props.show_modal}
        onHide={this.props.modalHide}
        size="lg"
      >
        <Modal.Header closeButton>
          <Modal.Title>Гүйлгээний мэдээлэл</Modal.Title>
        </Modal.Header>
        <Modal.Body className="moneyTransferContainer">
          <div className="row moneyTransferModalButtons">
            <div className="col-md-12">
              <button className="btn btn-success btn-sm" onClick={()=> this.type_changer("orlogo")}>Орлого</button>
              <button className="btn btn-secondary btn-sm" onClick={()=> this.type_changer("all")}>Бүгд</button>
              <button className="btn btn-info btn-sm" onClick={()=> this.type_changer("zarlaga")}>Зарлага</button>
              <button
                className="btn btn-info btn-sm addTransfer"
                onClick={this.show_addTransfer}
              >
                <i className="fa fa-plus" aria-hidden="true"></i>Зарлагын
                гүйлгээ нэмэх
              </button>
            </div>
          </div>
          <div className="row moneyTransferModalBody">
            {this.props.mTransfersData.map((transfer, index) => {
              if ([1].includes(transfer.money_transfer_type)) {
                if(this.state.type === "all" || this.state.type === "orlogo"){
                  return (
                    <div className="col-12 pt-1" key={index}>
                      <div className="orlogo">
                        <div className="date">
                          <Moment format="MM/DD H:mm">
                            {transfer.created_at}
                          </Moment>
                        </div>
                        <div className="amount">
                          {transfer.amount.slice(0, -3)}₮
                        </div>
                        <div className="wallet">
                          {transfer.to_wallet.name +
                            " - " +
                            transfer.to_wallet.account}
                        </div>
                      </div>
                    </div>
                  );
                }else{
                  return null
                }
              }
              if ([2].includes(transfer.money_transfer_type)) {
                if(this.state.type === "all" || this.state.type === "zarlaga"){
                  return (
                    <div className="col-12 pt-1" key={index}>
                      <div className="zarlaga">
                        <div className="wallet">
                          {transfer.fr_wallet
                            ? transfer.fr_wallet.name +
                              " - " +
                              transfer.fr_wallet.account
                            : null}
                        </div>
                        <div className="amount">
                          {transfer.amount.slice(0, -3)}₮
                        </div>
                        <div className="date">
                          {transfer.to_user ? transfer.to_user.first_name : null}{" "}
                          - {transfer.description ? transfer.description : null}
                          <Moment format="MM/DD H:mm">
                            {transfer.created_at}
                          </Moment>
                        </div>
                      </div>
                    </div>
                  );
                }else{
                  return null
                }
              } else {
                return null;
              }
            })}
          </div>
          <div className="total row m-0 p-0">
            <div className="col-md-4 orlogo">Нийт орлого: {totalOrlogo}₮</div>
            <div className="col-md-4 uldegdel">
              Үлдэгдэл: {totalOrlogo - totalZarlaga}₮
            </div>
            <div className="col-md-4 zarlaga">
              Нийт зарлага: {totalZarlaga}₮
            </div>
          </div>
          {this.state.show_addTransfer ? (
            <div className="row addMoneyTransferBox">
              <div className="col-md-6">
                <select
                  name="money_transfer_type"
                  className="inputs"
                  onChange={(e) => this.handleChange(e)}
                >
                  <option>Гүйлгээний төрлийг сонго!</option>
                  {this.state.mTransferTypesData.map((tType, index) => {
                    if ([2].includes(tType.id)) {
                      return (
                        <option value={tType.id} key={index}>
                          {tType.name}
                        </option>
                      );
                    } else {
                      return null;
                    }
                  })}
                </select>
              </div>
              <div className="col-md-6">
                <select
                  name="fr_wallet"
                  className="inputs"
                  onChange={(e) => this.handleChange(e)}
                >
                  <option>Аль данснаас шилжүүлж ...</option>
                  {this.state.walletsData.map((wallet, index) => {
                    if ([4, 5].includes(wallet.id) === false) {
                      return (
                        <option value={wallet.id} key={index}>
                          {wallet.name} - {wallet.account}
                        </option>
                      );
                    } else {
                      return null;
                    }
                  })}
                </select>
              </div>
              <div className="col-md-6">
                <input
                  type="number"
                  name="amount"
                  className="inputs"
                  placeholder="Мөнгөн дүн"
                  onChange={(e) => this.handleChange(e)}
                />
              </div>
              <div className="col-md-6">
                <select
                  name="to_user"
                  className="inputs"
                  onChange={(e) => this.handleChange(e)}
                >
                  <option value="">Хариуцаж авсан ажилтан</option>
                  {this.state.workersData.map((worker, index) => {
                    return (
                      <option value={worker.id} key={index}>
                        {worker.first_name}
                      </option>
                    );
                  })}
                </select>
              </div>
              <div className="col-md-12" onChange={(e) => this.handleChange(e)}>
                <textarea
                  type="text"
                  name="description"
                  placeholder="Нэмэлт тайлбар ..."
                />
              </div>
            </div>
          ) : null}
        </Modal.Body>
        <Modal.Footer className="modal-footer justify-content-between">
          <Button variant="warning" size="sm" onClick={this.props.modalHide}>
            <i className="fas fa-arrow-left" /> <b> Буцах</b>
          </Button>
          {this.state.money_transfer_type &&
          this.state.fr_wallet &&
          this.state.amount &&
          this.state.to_user ? (
            <Button variant="success" size="sm" onClick={this.postMTransfer}>
              <i className="fas fa-check" /> <b> Хадгалах</b>
            </Button>
          ) : null}
        </Modal.Footer>
      </Modal>
    );
  }
}
