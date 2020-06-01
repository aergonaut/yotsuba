import React from "react";
import { Link } from "@reach/router";
import { User, LogOut } from "react-feather";
import { gql, useQuery } from "@apollo/client";
import { CurrentUserQuery } from "./__generated__/CurrentUserQuery";

const CURRENT_USER_QUERY = gql`
  query CurrentUserQuery {
    currentUser {
      username
    }
  }
`;

function UserControls() {
  const { loading, error, data } = useQuery<CurrentUserQuery>(
    CURRENT_USER_QUERY
  );

  if (loading) {
    return null;
  }

  return (
    <div className="navbar-nav ml-lg-auto">
      <Link
        to={`/users/${data.currentUser.username}`}
        className="nav-item nav-link"
        title="Your profile"
      >
        <User size={20} />
        <span className="ml-2">{data.currentUser.username}</span>
      </Link>
      <a
        href="/session"
        className="nav-item nav-link"
        title="Logout"
        data-method="delete"
      >
        <LogOut size={20} />
      </a>
    </div>
  );
}

export default UserControls;
