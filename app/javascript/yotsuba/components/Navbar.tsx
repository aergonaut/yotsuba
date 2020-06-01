import React, { useState } from "react";
import { gql, useQuery } from "@apollo/client";
import { Search, User } from "react-feather";
import { CurrentUserQuery } from "./__generated__/CurrentUserQuery";
import { navigate, Link } from "@reach/router";

const CURRENT_USER_QUERY = gql`
  query CurrentUserQuery {
    currentUser {
      username
    }
  }
`;

function Navbar() {
  const { loading, error, data } = useQuery<CurrentUserQuery>(
    CURRENT_USER_QUERY
  );
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
            className="form-inline ml-lg-auto"
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
          <div className="navbar-nav ml-lg-auto">
            <Link to="/profile" className="nav-item nav-link">
              <User size={20} />
              {loading ? null : (
                <span className="ml-2">{data.currentUser.username}</span>
              )}
            </Link>
          </div>
        </div>
      </div>
    </nav>
  );
}

export default Navbar;
