import React, { useState } from "react";
import {
  ApolloProvider,
  ApolloClient,
  HttpLink,
  InMemoryCache,
} from "@apollo/client";
import Navbar from "./components/Navbar";
import SearchResults from "./components/SearchResults";

const client = new ApolloClient({
  cache: new InMemoryCache(),
  link: new HttpLink(),
});

function App() {
  const [searchTerm, setSearchTerm] = useState("");

  return (
    <ApolloProvider client={client}>
      <Navbar searchTerm={searchTerm} setSearchTerm={setSearchTerm} />
      <SearchResults searchTerm={searchTerm} />
    </ApolloProvider>
  );
}

export default App;
