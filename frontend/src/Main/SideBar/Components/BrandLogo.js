import React from "react";

function BrandLogo() {
  return (
    <a href="/" className="brand-link">
      <img
        src="/dist/img/AdminLTELogo.png"
        alt="AdminLTE Logo"
        className="brand-image img-circle elevation-3"
        style={{ opacity: ".8" }}
      />
      <span className="brand-text font-weight-light">TESORO APP</span>
    </a>
  );
}

export default BrandLogo;
