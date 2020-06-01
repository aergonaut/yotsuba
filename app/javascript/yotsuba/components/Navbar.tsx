import React, { useState } from "react";
import { Search, User, LogOut } from "react-feather";
import { navigate, Link } from "@reach/router";
import UserControls from "./UserControls";

function Navbar() {
  const [inputValue, setInputValue] = useState("");

  return (
    <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
      <div className="container-lg">
        <Link to="/" className="navbar-brand">
          Yotsuba!
        </Link>
        <button
          className="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span className="navbar-toggler-icon"></span>
        </button>
        <div className="collapse navbar-collapse" id="navbarSupportedContent">
          <form
            className="form-inline"
            onSubmit={(event) => {
              event.preventDefault();
              navigate(`/search?q=${inputValue}`);
            }}
          >
            <div className="input-group">
              <input
                className="form-control"
                type="search"
                placeholder="Search"
                aria-label="Search"
                value={inputValue}
                onChange={(event) => {
                  setInputValue(event.target.value);
                }}
              />
              <div className="input-group-append">
                <button
                  className="btn btn-primary"
                  type="button"
                  onClick={(event) => {
                    navigate(`/search?q=${inputValue}`);
                  }}
                >
                  <Search size={20} />
                </button>
              </div>
            </div>
          </form>
          <UserControls />
        </div>
      </div>
    </nav>
  );
}

export default Navbar;
