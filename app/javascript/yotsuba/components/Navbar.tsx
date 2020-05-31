import React from "react";
import { gql, useQuery } from "@apollo/client";
import { Search, User } from "react-feather";

const CURRENT_USER_QUERY = gql`
  query CurrentUserQuery {
    currentUser {
      username
    }
  }
`;

function Navbar() {
  const { loading, error, data } = useQuery(CURRENT_USER_QUERY);

  if (loading) return <div>Loading...</div>;

  return (
    <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
      <div className="container">
        <a className="navbar-brand" href="#">
          Yotsuba!
        </a>
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
          <form className="form-inline ml-lg-auto">
            <div className="input-group">
              <input
                className="form-control"
                type="search"
                placeholder="Search"
                aria-label="Search"
              />
              <div className="input-group-append">
                <button className="btn btn-secondary" type="button">
                  <Search size={20} />
                </button>
              </div>
            </div>
          </form>
          <div className="navbar-nav ml-lg-auto">
            <a className="nav-item nav-link" href="#">
              <User size={20} />
              <span className="ml-2">{data.currentUser.username}</span>
            </a>
          </div>
        </div>
      </div>
    </nav>
  );
}

export default Navbar;
