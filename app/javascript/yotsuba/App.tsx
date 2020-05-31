import React from "react";
import {
  ApolloProvider,
  ApolloClient,
  HttpLink,
  InMemoryCache,
} from "@apollo/client";
import Navbar from "./components/Navbar";

const client = new ApolloClient({
  cache: new InMemoryCache(),
  link: new HttpLink(),
});

function Greeting() {
  return (
    <>
      <Navbar />
      <div className="container"></div>
    </>
  );
}

const App = () => (
  <ApolloProvider client={client}>
    <Greeting />
  </ApolloProvider>
);

export default App;
