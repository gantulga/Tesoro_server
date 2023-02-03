import React, { Component } from "react";
import ContentHeader from "../../../Main/Components/ContentHeader";
import RoomDiv from "./Component/RoomDiv";

import Page1User from "./Component/Page1User";
import Page2Room from "./Component/Page2Room";
import Page3Order from "./Component/Page3Order";
import Page4Bill from "./Component/Page4Bill";
import { store } from "react-notifications-component";
import { dataRecipient } from "./Robots/newOrderRobots";
import { getUserId } from "../../../Main/Utils/Auth";
import OrdersModal from "./Component/OrdersModal";
import OrderModal from "./Component/OrderModal";
import ConfirmModal from "./Component/ConfirmModal";
import MiniBarModal from "./Component/MiniBarModal";

export default class index extends Component {
  constructor() {
    super();
    this.state = {
      roomsData: [],
      search: "",
      //Modal paguudiin haragdah true/false
      page1Show: false,
      page2Show: false,
      page3Show: false,
      page4Show: false,
      ordersModal: false,
      orderModal: false,
      confirmModal: false,
      minibarModal: false,

      //Informations
      //Page1
      roomData: null,
      customerId: "",
      lastname: "",
      firstname: "",
      discount: 0,
      register: "",
      phoneNumber: "",
      email: "",
      homeAddress: "",
      //Page2
      fr_date: new Date(),
      to_date: "",
      productType: "",
      quantity: "",
      //Page3
      productDesc: "",
      productCost: "",
      productId: null,
      totalCost: null,
      //Page4
      paidAmount: null,
      underpayment: null,
      paymentList: [],
      walletsData: "",

      //orderModal
      orderData: null,

      //confirmModal
      confirmModalType: null,
      confirmModalMessage: null,
      confirmModalRoom: null,

      // eelj
      lastShift: null,
    };
  }

  updateSearch(event) {
    this.setState({
      search: event.target.value.substr(0, 20),
    });
  }

  async dateChange(e) {
    await this.setState({
      fr_date: new Date(e),
    });
    this.toDateCalculator();
  }

  async discountChanger(e) {
    e.persist();
    if (e.target.name === "discount") {
      if (e.target.value < 0 || e.target.value > 100) {
        await this.setState({
          discount: 0,
        });
        store.addNotification({
          title: "Анхаар!",
          message: "Хөнгөлөлтийн % нь 1-100 хооронд байх ёстой! ",
          type: "warning",
          insert: "top",
          container: "top-right",
          animationIn: ["animated", "fadeIn"],
          animationOut: ["animated", "fadeOut"],
          dismiss: {
            duration: 5000,
            onScreen: true,
          },
        });
      } else {
        await this.setState({
          discount: e.target.value,
        });
      }
    }
    this.toDateCalculator();
  }

  lastShiftSetState() {
    fetch("http://" + this.props.ip_address + "/api/hotel/shiftWorks/last", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        await this.setState({ lastShift: data[0].finished });
      })
      .catch((error) => {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Алдаа гарлаа. Системийн инженертэй холбогдож хэлнэ үү! Алдааны мэдээлэл: " +
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

  async onChange(e) {
    if (e) {
      if (e.target) {
        await this.setState({
          [e.target.name]: e.target.value,
        });
        if (this.state.productType) {
          this.state.roomData.client_products.map(async (el) => {
            if (
              el.name.toLowerCase().includes("хоног") &&
              this.state.productType === "day"
            ) {
              await this.setState({
                productDesc: el.name,
                productCost: el.cost,
                productId: el.id,
              });
            }
            if (
              el.name.toLowerCase().includes("цаг") &&
              this.state.productType === "time"
            ) {
              await this.setState({
                productDesc: el.name,
                productCost: el.cost,
              });
            }
          });
        }
      }
      if (e.firstname) {
        await this.setState({
          firstname: e.firstname,
        });
      }
      if (e.lastname) {
        await this.setState({
          lastname: e.lastname,
        });
      }
      if (e.register) {
        await this.setState({
          register: e.register,
          customerId: e.id,
        });
      }
      if (e.mobile) {
        await this.setState({
          phoneNumber: e.mobile,
        });
      }
      if (e.email) {
        await this.setState({
          email: e.email,
        });
      }
      if (e.address) {
        await this.setState({
          homeAddress: e.address,
        });
      }
    } else {
      await this.setState({
        firstname: "",
        lastname: "",
        discount: 0,
        register: "",
        phoneNumber: "",
        email: "",
        homeAddress: "",
        customerId: "",
      });
    }
    this.toDateCalculator();
  }

  toDateCalculator() {
    if (this.state.productType && this.state.quantity && this.state.fr_date) {
      var range;
      var fr_dateModulo;
      var to_date;
      if (this.state.productType === "day") {
        //udriin timestampiig udriin toond urjuulj hugatsaanii timestampiig gargaj bn
        range = 86400000 * this.state.quantity;
        //uruund oroh ognoon deer hugatsaanii timestampiig nemeed, 00:00 tsagaas hoishih zuruug olj bn
        fr_dateModulo = (this.state.fr_date.getTime() + 3600000 * 8) % 86400000;
        //uruunuus garah etssiin tsagiig timestampruu hurvuulj bn
        var leaveTimestamp = 3600000 * this.props.leaveTime;

        if (fr_dateModulo <= 3600000 * this.props.deadlineDay) {
          to_date = new Date(
            this.state.fr_date.getTime() +
              range -
              86400000 -
              fr_dateModulo +
              leaveTimestamp
          );
          this.setState({
            to_date: to_date,
          });
        } else {
          to_date = new Date(
            this.state.fr_date.getTime() +
              range -
              fr_dateModulo +
              leaveTimestamp
          );
          this.setState({
            to_date: to_date,
          });
        }
      } else {
        range = 3600000 * this.state.quantity;
        fr_dateModulo = (this.state.fr_date.getTime() + 3600000 * 8) % 86400000;
        if (
          fr_dateModulo >= this.props.startTime * 3600000 &&
          fr_dateModulo <= this.props.deadlineTime * 3600000
        ) {
          to_date = new Date(this.state.fr_date.getTime() + range);
          this.setState({
            to_date: to_date,
          });
        }
      }
    }
    if (this.state.productCost && this.state.quantity) {
      var totalCost;
      if (this.state.discount !== 0) {
        totalCost =
          this.state.productCost *
          this.state.quantity *
          ((100 - this.state.discount) / 100);
      } else {
        totalCost = this.state.productCost * this.state.quantity;
      }
      this.setState({
        totalCost: totalCost,
      });
    }
  }

  async pageShow(page, roomData) {
    if (page === 1) {
      if (this.state.roomData && this.state.roomData !== roomData) {
        await this.setState({
          //user
          lastname: "",
          firstname: "",
          discount: 0,
          register: "",
          phoneNumber: "",
          email: "",
          homeAddress: "",
          //order
          fr_date: new Date(),
          to_date: "",
          productType: "",
          quantity: "",
          productDesc: "",
          productCost: "",
          totalCost: "",
          paidAmount: "",
          underpayment: "",
          //payment
          paymentList: [],
        });
      }
      await this.setState({
        page1Show: true,
        page2Show: false,
        page3Show: false,
        page4Show: false,
        roomData: roomData,
      });
    } else if (page === 2) {
      if (this.state.lastname && this.state.firstname && this.state.register) {
        await this.setState({
          page1Show: false,
          page2Show: true,
          page3Show: false,
          page4Show: false,
          roomData: roomData,
        });
      }
      if (!this.state.lastname) {
        store.addNotification({
          title: "Анхаар!",
          message: "Та үйлчлүүлэгийн овог [Овог] цэсийг бөглөх шаардлагатай!",
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
      }
      if (!this.state.firstname) {
        store.addNotification({
          title: "Анхаар!",
          message: "Та үйлчлүүлэгийн нэр [Нэр] цэсийг бөглөх шаардлагатай!",
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
      }
      if (!this.state.register) {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Та үйлчлүүлэгийн регистерийн дугаар [Регистер] цэсийг бөглөх шаардлагатай!",
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
      }
    } else if (page === 3) {
      if (this.state.productType && this.state.fr_date && this.state.quantity) {
        if (this.state.productType === "time") {
          var fr_dateModulo =
            (this.state.fr_date.getTime() + 3600000 * 8) % 86400000;
          var time = parseInt(fr_dateModulo / 3600000);
          if (time >= this.props.startTime && time <= this.props.deadlineTime) {
            await this.setState({
              page1Show: false,
              page2Show: false,
              page3Show: true,
              page4Show: false,
              roomData: roomData,
            });
          } else {
            store.addNotification({
              title: "Анхаар!",
              message:
                "Өрөөнд цагаар орох боломжгүй байна. Дотоод журмын дугуу өрөөнд зөвшөөрөгдсөн цагуудад цагаар орох боломжтой!",
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
          }
        } else {
          await this.setState({
            page1Show: false,
            page2Show: false,
            page3Show: true,
            page4Show: false,
            roomData: roomData,
          });
        }
      }
      if (!this.state.productType) {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Та үйлчилгээний төрөл [Үйлчилгээ] цэсийг бөглөх шаардлагатай!",
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
      }
      if (!this.state.fr_date) {
        store.addNotification({
          title: "Анхаар!",
          message: "Та өрөөнд орох огноо [Орох] цэсийг бөглөх шаардлагатай!",
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
      }
      if (!this.state.quantity) {
        store.addNotification({
          title: "Анхаар!",
          message:
            "Та өдөр/цагийн хэмжээ [Хугацаа] цэсийг бөглөх шаардлагатай!",
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
      }
    } else if (page === 4) {
      this.getWalletsData();
      await this.setState({
        page1Show: false,
        page2Show: false,
        page3Show: false,
        page4Show: true,
        roomData: roomData,
      });
    } else if (page === "orders") {
      await this.setState({
        orderModal: false,
        ordersModal: true,
        roomData: roomData,
      });
    } else if (page === "order") {
      await this.setState({
        paymentList: [],
      });
      this.getWalletsData();
      //total calculate
      var total = 0;
      if (roomData.order_detials.length > 0) {
        await roomData.order_detials.map(async (detials, index) => {
          total = total + parseInt(detials.subtotal);
          if (roomData.order_detials.length === index + 1) {
            await this.setState({
              totalCost: total,
            });
          }
        });
      } else {
        await this.setState({
          totalCost: total,
        });
      }
      //paid calculate
      var paid = 0;
      if (roomData.payments.length > 0) {
        await roomData.payments.map(async (payment, index) => {
          paid = paid + parseInt(payment.amount);
          if (roomData.payments.length === index + 1) {
            await this.setState({
              paidAmount: paid,
              underpayment: this.state.totalCost - paid,
            });
          }
        });
      } else {
        await this.setState({
          paidAmount: paid,
          underpayment: this.state.totalCost - paid,
        });
      }

      await this.setState({
        orderData: roomData,
        ordersModal: false,
        orderModal: true,
        roomData: roomData.client,
      });
    } else if (page === "freeInfo") {
      await this.setState({
        confirmModalType: "room_free",
        confirmModalMessage:
          " тоот өрөөний хүн гарч, өрөө сул болсон уу? Хэрэв тийм бол ХАДЛАГАХ товчийг дарна уу!",
        confirmModalRoom: roomData,
        confirmModal: true,
      });
    } else if (page === "cleanInfo") {
      await this.setState({
        confirmModalType: "room_clean",
        confirmModalMessage:
          " тоот өрөөг цэвэрлэж дууссан уу? Хэрэв тийм бол ХАДЛАГАХ товчийг дарна уу!",
        confirmModalRoom: roomData,
        confirmModal: true,
      });
    } else if (page === "minibarFullInfo") {
      await this.setState({
        confirmModalType: "minibarFull",
        confirmModalMessage:
          " тоот өрөөний минибарыг дүүргэсэн үү? Хэрэв тийм бол ХАДЛАГАХ товчийг дарна уу!",
        confirmModalRoom: roomData,
        confirmModal: true,
      });
    } else if (page === "minibarModal") {
      await this.setState({
        minibarModal: true,
        roomData: roomData,
      });
    }
  }

  async pageHide() {
    await this.setState({
      page1Show: false,
      page2Show: false,
      page3Show: false,
      page4Show: false,
      ordersModal: false,
      orderModal: false,
      confirmModal: false,
      minibarModal: false,

      roomData: null,
      customerId: "",
      lastname: "",
      firstname: "",
      discount: 0,
      register: "",
      phoneNumber: "",
      email: "",
      homeAddress: "",
      //Page2
      fr_date: new Date(),
      to_date: "",
      productType: "",
      quantity: "",
      //Page3
      productDesc: "",
      productCost: "",
      productId: null,
      totalCost: null,
      //Page4
      paidAmount: null,
      underpayment: null,
      paymentList: [],
      walletsData: "",
    });
  }

  addInput() {
    this.setState({
      paymentList: [
        ...this.state.paymentList,
        { wallet: null, amount: 0, confirmed_by: getUserId() },
      ],
    });
  }

  handleChange(e, index) {
    e.persist();
    if (e.target.name === "wallet") {
      this.setState((prevState) => {
        const newItems = [...prevState.paymentList];
        newItems[index].wallet = e.target.value;
        return { paymentList: newItems };
      });
    } else {
      this.setState((prevState) => {
        const newItems = [...prevState.paymentList];
        newItems[index].amount = e.target.value.split(",").join("");
        return { paymentList: newItems };
      });
    }
  }

  async countAmount() {
    var hasError = false;
    this.state.paymentList.map((payment) => {
      if (!payment.wallet) {
        hasError = true;
        store.addNotification({
          title: "Анхаар!",
          message: "Та банкны нэрийг сонгоогүй байна.",
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
      }
      if (!payment.amount && payment.amount !== 0) {
        hasError = true;
        store.addNotification({
          title: "Анхаар!",
          message:
            "Та мөнгөн дүнг бичээгүй байна. Аль эсвэл дүнг 0 гэж бичих шаардлагатай!",
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
      }
      return null;
    });
    if (hasError === false) {
      var totalAmount = this.state.totalCost;
      var paidAmount = 0;
      this.state.paymentList.map((value) => {
        if (value.amount) {
          paidAmount += parseInt(value.amount);
        }
        return null;
      });
      var underpayment = parseInt(totalAmount) - paidAmount;
      await this.setState({
        paidAmount: paidAmount,
        underpayment: underpayment,
      });
    }
  }

  async finish(e) {
    if (this.state.paidAmount !== null && this.state.underpayment !== "") {
      let orderObj = {
        customerId: this.state.customerId,
        lastname: this.state.lastname,
        discount: this.state.discount,
        firstname: this.state.firstname,
        register: this.state.register,
        mobile: this.state.phoneNumber,
        email: this.state.email,
        address: this.state.homeAddress,
        fr_date: this.state.fr_date,
        to_date: this.state.to_date,
        productType: this.state.productType,
        quantity: this.state.quantity,
        productDesc: this.state.productDesc,
        productCost: this.state.productCost,
        productId: this.state.productId,
        totalCost: this.state.totalCost,
        paidAmount: this.state.paidAmount,
        underpayment: this.state.underpayment,
        paymentList: this.state.paymentList,
        client: this.state.roomData["id"],
        user: this.props.user,
      };
      await dataRecipient(orderObj, this.props.token, this.props.ip_address);
      this.getHotelRoomData();
      this.pageHide();
    } else {
      store.addNotification({
        title: "Анхаар!",
        message: "Та төлсөн дүн болон үлдсэн дүнг дүгнэх шаардлагатай!.",
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
    }
  }

  // oneToTwo() {
  //   let customerObj = {
  //     id: this.state.customerId,
  //     lastname: this.state.lastname,
  //     firstname: this.state.firstname,
  //     register: this.state.register,
  //     mobile: this.state.phoneNumber,
  //     email: this.state.email,
  //     address: this.state.homeAddress
  //   };
  //   dataRecipient(customerObj, this.props.token);
  // }

  getWalletsData() {
    fetch("http://" + this.props.ip_address + "/api/finance/wallets/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({
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

  getHotelRoomData() {
    console.log(this.props.token)
    var value = fetch("http://" + this.props.ip_address + "/api/hotel/rooms/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({
          roomsData: data,
        });
        return data;
      })
      .catch((error) => {
        this.setState({ APIError: error });
        store.addNotification({
          title: "Анхаар!",
          message:
            "Алдаа гарлаа. Системийн инженертэй холбогдож хэлнэ үү! Алдааны мэдээлэл: " +
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
    return value;
  }

  UNSAFE_componentWillMount() {
    this.getHotelRoomData();
    this.lastShiftSetState();
  }

  render() {
    let filteredRooms = this.state.roomsData.filter((room) => {
      return (
        room.description
          .toLowerCase()
          .indexOf(this.state.search.toLowerCase()) !== -1
      );
    });
    return (
      <div>
        <ContentHeader {...this.props} />
        {this.state.lastShift ? (
          <div className="alert alert-danger" role="alert">
            Ээлжийг үүсгээгүй байна. Ээлжинд гарч байгаа ресепшин ээлжээ үүсгэнэ
            үү! <br />
            [Зочид буудал] -> [Барааны үлдэгдэл] -> [Ээлж үүсгэх]
          </div>
        ) : null}
        <div className="card card-solid">
          <div className="card-body pb-0">
            <div className="input-group mb-3">
              <input
                className="form-control"
                type="text"
                value={this.state.search}
                placeholder="Хайлт хйих ..."
                onChange={this.updateSearch.bind(this)}
              />
              <div className="input-group-append">
                <span className="input-group-text">
                  <i className="fas fa-search" />
                </span>
              </div>
            </div>
            {filteredRooms.length === 0 && (
              <div className="callout callout-danger">
                <h5>Өрөө олдсонгүй ... </h5>
                <p>
                  Таны хайлтын талбарт бичсэн <b>"{this.state.search}"</b>
                  утгаар хайлт хийхэд өрөө олдсонгүй!
                </p>
              </div>
            )}

            <div className="row d-flex align-items-stretch">
              {filteredRooms.map((el) => {
                return (
                  <RoomDiv
                    key={el.number}
                    data={el}
                    pageShow={this.pageShow.bind(this)}
                  />
                );
              })}
            </div>
          </div>
        </div>
        {this.state.page1Show === true ? (
          <Page1User
            show={this.state.page1Show}
            changeFunction={this.onChange.bind(this)}
            onHide={this.pageHide.bind(this)}
            pageShow={this.pageShow.bind(this)}
            room={this.state.roomData}
            lastname={this.state.lastname}
            firstname={this.state.firstname}
            register={this.state.register}
            phoneNumber={this.state.phoneNumber}
            email={this.state.email}
            homeAddress={this.state.homeAddress}
            {...this.props}
          />
        ) : null}
        {this.state.page2Show === true ? (
          <Page2Room
            show={this.state.page2Show}
            changeFunction={this.onChange.bind(this)}
            dateChangeFunction={this.dateChange.bind(this)}
            onHide={this.pageHide.bind(this)}
            pageShow={this.pageShow.bind(this)}
            room={this.state.roomData}
            fr_date={this.state.fr_date}
            to_date={this.state.to_date}
            productType={this.state.productType}
            quantity={this.state.quantity}
            {...this.props}
          />
        ) : null}
        {this.state.page3Show === true ? (
          <Page3Order
            show={this.state.page3Show}
            changeFunction={this.onChange.bind(this)}
            onHide={this.pageHide.bind(this)}
            pageShow={this.pageShow.bind(this)}
            room={this.state.roomData}
            productType={this.state.productType}
            productDesc={this.state.productDesc}
            productCost={this.state.productCost}
            quantity={this.state.quantity}
            totalCost={this.state.totalCost}
            {...this.props}
          />
        ) : null}
        {this.state.page4Show === true ? (
          <Page4Bill
            show={this.state.page4Show}
            changeFunction={this.onChange.bind(this)}
            onHide={this.pageHide.bind(this)}
            pageShow={this.pageShow.bind(this)}
            payFunc={this.pageShow.bind(this)}
            handleChange={this.handleChange.bind(this)}
            discountChanger={this.discountChanger.bind(this)}
            addInput={this.addInput.bind(this)}
            countAmount={this.countAmount.bind(this)}
            finish={this.finish.bind(this)}
            room={this.state.roomData}
            walletsData={this.state.walletsData}
            productType={this.state.productType}
            productDesc={this.state.productDesc}
            productCost={this.state.productCost}
            quantity={this.state.quantity}
            totalCost={this.state.totalCost}
            discount={this.state.discount}
            paidAmount={this.state.paidAmount}
            underpayment={this.state.underpayment}
            paymentList={this.state.paymentList}
            lastShift={this.state.lastShift}
            {...this.props}
          />
        ) : null}
        {this.state.ordersModal === true ? (
          <OrdersModal
            show={this.state.ordersModal}
            roomId={this.state.roomData["id"]}
            onHide={this.pageHide.bind(this)}
            pageShow={this.pageShow.bind(this)}
            {...this.props}
          />
        ) : null}
        {this.state.orderModal === true ? (
          <OrderModal
            show={this.state.orderModal}
            data={this.state.orderData}
            roomData={this.state.roomData}
            paymentList={this.state.paymentList}
            //handleChange={this.handleChange.bind(this)}
            onHide={this.pageHide.bind(this)}
            pageShow={this.pageShow.bind(this)}
            //addInput={this.addInput.bind(this)}
            countAmount={this.countAmount.bind(this)}
            total={this.state.totalCost}
            paid={this.state.paidAmount}
            under={this.state.underpayment}
            walletsData={this.state.walletsData}
            lastShift={this.state.lastShift}
            {...this.props}
          />
        ) : null}
        {this.state.confirmModal === true ? (
          <ConfirmModal
            show={this.state.confirmModal}
            type={this.state.confirmModalType}
            message={this.state.confirmModalMessage}
            room={this.state.confirmModalRoom}
            onHide={this.pageHide.bind(this)}
            roomsDataUpdater={this.getHotelRoomData.bind(this)}
            {...this.props}
          />
        ) : null}
        {this.state.minibarModal === true ? (
          <MiniBarModal
            show={this.state.minibarModal}
            room={this.state.roomData}
            onHide={this.pageHide.bind(this)}
            {...this.props}
          />
        ) : null}
      </div>
    );
  }
}
