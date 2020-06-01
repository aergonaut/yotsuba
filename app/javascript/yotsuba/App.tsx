import React from "react";
import {
  ApolloProvider,
  ApolloClient,
  HttpLink,
  InMemoryCache,
} from "@apollo/client";
import { Router, RouteComponentProps, Link } from "@reach/router";
import Navbar from "./components/Navbar";
import SearchResults from "./components/SearchResults";
import ItemDetail from "./components/ItemDetail";
import { GitHub, Twitter } from "react-feather";

const client = new ApolloClient({
  cache: new InMemoryCache(),
  link: new HttpLink(),
});

function Home(props: RouteComponentProps) {
  return (
    <div className="container-lg">
      <div className="row m-4">
        <p className="text-center w-100">
          Try searching for an item with the search box above!
        </p>
      </div>
    </div>
  );
}

function App() {
  return (
    <ApolloProvider client={client}>
      <Navbar />
      <Router>
        <Home default={true} />
        <SearchResults path="/search" />
        <ItemDetail path="/items/:slug" />
      </Router>
      <footer>
        <div className="container-lg">
          <div className="p-4 border-top text-center">
            <ul className="list-inline">
              <li className="list-inline-item">
                <a href="https://github.com/aergonaut/yotsuba" title="GitHub">
                  <GitHub />
                </a>
              </li>
              <li className="list-inline-item">
                <a href="https://twitter.com/aergonaut" title="Twitter">
                  <Twitter />
                </a>
              </li>
            </ul>
            <p>
              <strong>
                <Link to="/">Yotsuba!</Link>
              </strong>{" "}
              is a fan-made website and is not affiliated with Nintendo.
            </p>
          </div>
        </div>
      </footer>
    </ApolloProvider>
  );
}

export default App;
