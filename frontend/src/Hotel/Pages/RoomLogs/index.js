import React, { Component } from "react";
// import { getLogs } from "./Components/LogRobots";
import ContentHeader from "../../../Main/Components/ContentHeader";
import { store } from "react-notifications-component";
import Moment from "react-moment";

export default class index extends Component {
  constructor(props) {
    super(props);
    this.state = {
      logsData: [],
    };
  }

  logsSetState() {
    fetch("http://" + this.props.ip_address + "/api/hotel/clientlogs/", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Token " + this.props.token,
      },
    })
      .then(async (response) => {
        const data = await response.json();
        this.setState({ logsData: data });
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
  }

  componentDidMount() {
    this.logsSetState();
  }

  render() {
    return (
      <div>
        <ContentHeader {...this.props} />
        <div className="card">
          <div className="card-body">
            <table className="table table-striped compact">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Өрөө</th>
                  <th>Төрөл</th>
                  <th>Тоо</th>
                  <th>Утга</th>
                  <th>Огноо</th>
                </tr>
              </thead>
              <tbody>
                {this.state.logsData.map((log, index) => (
                  <tr key={index}>
                    <td>{log.id}</td>
                    <td>{log.client.number}</td>
                    <td>
                      {log.choices_type === "1" ? "Өрөөний мэдээлэл" : null}
                      {log.choices_type === "2" ? "Зочины тоон мэдээлэл" : null}
                      {log.choices_type === "3"
                        ? "Цэвэлэгээний мэдээлэл"
                        : null}
                      {log.choices_type === "4" ? "Мини барны мэдээлэл" : null}
                    </td>
                    <td>{log.number}</td>
                    <td>
                      {log.value === "in" ? "Зочинтой" : null}
                      {log.value === "out" ? "Зочингүй" : null}
                      {log.value === "i_p" ? "хүн орсон" : null}
                      {log.value === "o_p" ? "хүн гарсан" : null}
                      {log.value === "d" ? "Бохир" : null}
                      {log.value === "c" ? "Цэвэр" : null}
                      {log.value === "c_s" ? "Цэвэрлэж эхэлсэн" : null}
                      {log.value === "r" ? "Минибар дүүргэсэн" : null}
                      {log.value === "u" ? "Минибар дүүрэн биш" : null}
                    </td>
                    <td>
                      <Moment format="YYYY/MM/DD HH:mm">
                        {log.created_at}
                      </Moment>
                    </td>
                  </tr>
                ))}
              </tbody>
              <tfoot>
                <tr>
                  <th>#</th>
                  <th>Өрөө</th>
                  <th>Төрөл</th>
                  <th>Тоо</th>
                  <th>Утга</th>
                  <th>Огноо</th>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
      </div>
    );
  }
}
