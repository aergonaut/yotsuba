import React from "react";
import {
  ApolloProvider,
  ApolloClient,
  HttpLink,
  InMemoryCache,
} from "@apollo/client";
import { Router } from "@reach/router";
import Navbar from "./components/Navbar";
import SearchResults from "./components/SearchResults";

const client = new ApolloClient({
  cache: new InMemoryCache(),
  link: new HttpLink(),
});

function App() {
  return (
    <ApolloProvider client={client}>
      <Navbar />
      <Router>
        <SearchResults path="/search" />
      </Router>
    </ApolloProvider>
  );
}

export default App;
